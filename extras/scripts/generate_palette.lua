#!/usr/bin/env lua
-- generate_palette.lua
-- Reads TOML color files from ./colors, extracts [colors.accent] entries,
-- and writes a PNG strip per file into ./extras/palettes (created if missing).
-- Pure Lua with a minimal PNG writer (no external deps).

local INPUT_DIR = "colors"
local OUTPUT_DIR = "extras/palettes"
local TILE_WIDTH = 64
local TILE_HEIGHT = 16
local GAP = 0

local function ensure_dir(path)
	os.execute(string.format("mkdir -p '%s'", path))
end

-- Parse [colors.accent] only
local function parse_accent_colors(toml_text)
	local colors = {}
	local in_section = false
	for line in toml_text:gmatch("[^\n]*\n?") do
		local s = (line or ""):gsub("[\r\n]+", "")
		local t = s:match("^%s*(.-)%s*$") or ""
		if t:match("^%[.-%]") then
			in_section = (t:lower() == "[colors.accent]")
		elseif in_section and t ~= "" and not t:match("^#") then
			local key, val = t:match("^([%w%-%_]+)%s*=%s*(.+)$")
			if key and val then
				val = val:gsub("%s+#.*$", "")
				local q = val:sub(1, 1)
				if q == '"' or q == "'" then
					val = val:match("^[\"'](.-)[\"']$") or val
				end
				val = val:match("^%s*(.-)%s*$")
				table.insert(colors, { name = key, value = val })
			end
		end
	end
	return colors
end

-- Color parsing
local function parse_hex(hex)
	hex = hex:gsub("#", "")
	if #hex == 3 then
		hex = hex:sub(1, 1):rep(2) .. hex:sub(2, 2):rep(2) .. hex:sub(3, 3):rep(2)
	end
	if #hex ~= 6 then
		return nil
	end
	local r = tonumber(hex:sub(1, 2), 16)
	local g = tonumber(hex:sub(3, 4), 16)
	local b = tonumber(hex:sub(5, 6), 16)
	if r and g and b then
		return r, g, b
	end
end

local function parse_color(s)
	s = (s or ""):lower()
	local r, g, b = parse_hex(s)
	if r then
		return r, g, b
	end
	local rr, gg, bb = s:match("^rgb%((%d+)%s*,%s*(%d+)%s*,%s*(%d+)%)$")
	if rr then
		return tonumber(rr), tonumber(gg), tonumber(bb)
	end
	return nil
end

-- Bit utils and CRC32
local ok_bit, bit = pcall(require, "bit32")
if not ok_bit then
	ok_bit, bit = pcall(require, "bit")
end
local band, bor, bxor, rshift, lshift
if ok_bit then
	band, bor, bxor, rshift, lshift = bit.band, bit.bor, bit.bxor, bit.rshift, bit.lshift
else
	function band(a, b)
		local r, bitv = 0, 1
		while a > 0 or b > 0 do
			local aa = a % 2
			local bb = b % 2
			if aa == 1 and bb == 1 then
				r = r + bitv
			end
			a = math.floor(a / 2)
			b = math.floor(b / 2)
			bitv = bitv * 2
		end
		return r
	end
	function bor(a, b)
		local r, bitv = 0, 1
		while a > 0 or b > 0 do
			if (a % 2) == 1 or (b % 2) == 1 then
				r = r + bitv
			end
			a = math.floor(a / 2)
			b = math.floor(b / 2)
			bitv = bitv * 2
		end
		return r
	end
	function bxor(a, b)
		local r, bitv = 0, 1
		while a > 0 or b > 0 do
			if (a % 2) ~= (b % 2) then
				r = r + bitv
			end
			a = math.floor(a / 2)
			b = math.floor(b / 2)
			bitv = bitv * 2
		end
		return r
	end
	function rshift(a, b)
		return math.floor(a / 2 ^ b)
	end
	function lshift(a, b)
		return (a * 2 ^ b) % 2 ^ 32
	end
end

local function write_be32(n)
	return string.char(band(rshift(n, 24), 0xFF), band(rshift(n, 16), 0xFF), band(rshift(n, 8), 0xFF), band(n, 0xFF))
end

local function adler32(str)
	local s1, s2 = 1, 0
	for i = 1, #str do
		s1 = (s1 + str:byte(i)) % 65521
		s2 = (s2 + s1) % 65521
	end
	return bor(lshift(s2, 16), s1)
end

local function crc32(str)
	local crc = 0xFFFFFFFF
	for i = 1, #str do
		crc = bxor(crc, str:byte(i))
		for _ = 1, 8 do
			local mask = -band(crc, 1)
			crc = bxor(rshift(crc, 1), band(0xEDB88320, mask))
		end
	end
	return bxor(crc, 0xFFFFFFFF)
end

-- Uncompressed zlib (store)
local function zlib_no_compress(payload)
	local out = { string.char(0x78, 0x01) }
	local i = 1
	while i <= #payload do
		local block_len = math.min(65535, #payload - i + 1)
		local is_final = (i + block_len - 1) == #payload
		out[#out + 1] = string.char(is_final and 1 or 0)
		out[#out + 1] = string.char(band(block_len, 0xFF), band(rshift(block_len, 8), 0xFF))
		local nlen = bxor(block_len, 0xFFFF)
		out[#out + 1] = string.char(band(nlen, 0xFF), band(rshift(nlen, 8), 0xFF))
		out[#out + 1] = payload:sub(i, i + block_len - 1)
		i = i + block_len
	end
	out[#out + 1] = write_be32(adler32(payload))
	return table.concat(out)
end

local function make_png_rgba(width, height, pixels_rgba)
	local rows = {}
	local stride = width * 4
	for y = 0, height - 1 do
		rows[#rows + 1] = string.char(0) .. pixels_rgba:sub(y * stride + 1, (y + 1) * stride)
	end
	local raw = table.concat(rows)
	local zdata = zlib_no_compress(raw)
	local function chunk(typ, data)
		return write_be32(#data) .. typ .. data .. write_be32(crc32(typ .. data))
	end
	local signature = string.char(137, 80, 78, 71, 13, 10, 26, 10)
	local ihdr = write_be32(width) .. write_be32(height) .. string.char(8, 6, 0, 0, 0)
	local png = {
		signature,
		chunk("IHDR", ihdr),
		chunk("IDAT", zdata),
		chunk("IEND", ""),
	}
	return table.concat(png)
end

local function build_strip(colors)
	if #colors == 0 then
		return make_png_rgba(1, TILE_HEIGHT, string.char(0, 0, 0, 0):rep(TILE_HEIGHT))
	end
	local w = #colors * (TILE_WIDTH + GAP) - GAP
	local h = TILE_HEIGHT
	local buf = {}
	for _y = 1, h do
		for _, c in ipairs(colors) do
			for _x = 1, TILE_WIDTH do
				buf[#buf + 1] = string.char(c.r, c.g, c.b, 255)
			end
			if GAP > 0 then
				for _x = 1, GAP do
					buf[#buf + 1] = string.char(0, 0, 0, 0)
				end
			end
		end
	end
	return make_png_rgba(w, h, table.concat(buf))
end

local function read_file(path)
	local f, err = io.open(path, "rb")
	if not f then
		return nil, err
	end
	local s = f:read("*a")
	f:close()
	return s
end

local function write_file(path, data)
	local f, err = io.open(path, "wb")
	if not f then
		return false, err
	end
	f:write(data)
	f:close()
	return true
end

local function basename_no_ext(p)
	local name = p:match("([^/]+)$") or p
	return name:gsub("%..-$", "")
end

local function list_toml(dir)
	local p = io.popen(string.format("ls -1 '%s' 2>/dev/null", dir))
	if not p then
		return {}
	end
	local files = {}
	for f in p:lines() do
		if f:match("%.toml$") then
			files[#files + 1] = f
		end
	end
	p:close()
	return files
end

local function main()
	ensure_dir(OUTPUT_DIR)
	local files = list_toml(INPUT_DIR)
	for _, file in ipairs(files) do
		local full = INPUT_DIR .. "/" .. file
		local content, err = read_file(full)
		if not content then
			io.stderr:write("Failed to read ", full, ": ", tostring(err), "\n")
			goto continue
		end
		local entries = parse_accent_colors(content)
		local list = {}
		for _, e in ipairs(entries) do
			local r, g, b = parse_color(e.value)
			if r then
				list[#list + 1] = { name = e.name, r = r, g = g, b = b }
			end
		end
		if #list > 0 then
			local png = build_strip(list)
			local outname = OUTPUT_DIR .. "/" .. basename_no_ext(file) .. "_accent.png"
			local ok, werr = write_file(outname, png)
			if not ok then
				io.stderr:write("Failed to write ", outname, ": ", tostring(werr), "\n")
			else
				print("Wrote palette: " .. outname)
			end
		else
			print("No accent colors in " .. full)
		end
		::continue::
	end
end

main()
