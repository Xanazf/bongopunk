# Bongopunk Baryon (Light Mode) for Fish Shell
# Based on Fluoromachine by maxmx03

# Color definitions
set -l bg FAFAFA
set -l fg 2D2D2D
set -l bg_alt F5F5F5
set -l fg_alt 6B7280
set -l cyan 0891B2
set -l green 059669
set -l orange EA580C
set -l pink BE185D
set -l purple 7C3AED
set -l red DC2626
set -l yellow D97706
set -l cyan_bright 06B6D4
set -l green_bright 10B981
set -l orange_bright F59E0B
set -l pink_bright EC4899
set -l purple_bright 8B5CF6
set -l red_bright EF4444
set -l yellow_bright F59E0B
set -l comment 9CA3AF
set -l border D1D5DB

# Syntax highlighting colors
set -g fish_color_normal $fg
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $green
set -g fish_color_redirection $orange
set -g fish_color_end $purple
set -g fish_color_error $red
set -g fish_color_param $fg
set -g fish_color_comment $comment
set -g fish_color_selection --background=$border
set -g fish_color_search_match --background=$yellow_bright
set -g fish_color_operator $fg_alt
set -g fish_color_escape $orange
set -g fish_color_autosuggestion $comment
set -g fish_color_cancel $red
set -g fish_color_cwd $cyan
set -g fish_color_user $green
set -g fish_color_host $purple
set -g fish_color_host_remote $pink
set -g fish_color_status $red

# Completion pager colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_background
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $fg
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$border
set -g fish_pager_color_selected_prefix $cyan_bright
set -g fish_pager_color_selected_completion $fg
set -g fish_pager_color_selected_description $comment
set -g fish_pager_color_secondary_background
set -g fish_pager_color_secondary_prefix $cyan
set -g fish_pager_color_secondary_completion $fg
set -g fish_pager_color_secondary_description $comment

# Directory and file colors (LS_COLORS equivalent)
set -g fish_color_valid_path --underline
set -g fish_color_history_current $cyan_bright

# Git prompt colors
set -g __fish_git_prompt_color_branch $purple
set -g __fish_git_prompt_color_branch_detached $red
set -g __fish_git_prompt_color_upstream $cyan
set -g __fish_git_prompt_color_bare $orange
set -g __fish_git_prompt_color_merging $red
set -g __fish_git_prompt_color_cleanstate $green
set -g __fish_git_prompt_color_dirtystate $yellow
set -g __fish_git_prompt_color_invalidstate $red
set -g __fish_git_prompt_color_stagedstate $green
set -g __fish_git_prompt_color_stashstate $cyan
set -g __fish_git_prompt_color_untrackedfiles $orange
set -g __fish_git_prompt_color_flags $purple

# Custom prompt function
function fish_prompt
    set -l last_status $status
    
    # User and host
    set_color $green
    echo -n (whoami)
    set_color $comment
    echo -n "@"
    set_color $purple
    echo -n (hostname -s)
    
    # Current directory
    set_color $comment
    echo -n ":"
    set_color $cyan
    echo -n (prompt_pwd)
    
    # Git status
    if command -v git >/dev/null 2>&1
        set -l git_branch (git branch 2>/dev/null | sed -n '/\* /s///p')
        if test -n "$git_branch"
            set_color $comment
            echo -n " on "
            set_color $purple
            echo -n "$git_branch"
            
            # Git status indicators
            if not git diff-index --quiet HEAD 2>/dev/null
                set_color $yellow
                echo -n "*"
            end
            if test (git status --porcelain 2>/dev/null | wc -l) -gt 0
                set_color $orange
                echo -n "+"
            end
        end
    end
    
    # Prompt character
    set_color $comment
    echo -n " "
    if test $last_status -eq 0
        set_color $green
        echo -n "❯"
    else
        set_color $red
        echo -n "❯"
    end
    set_color normal
    echo -n " "
end

# Right prompt with time and status
function fish_right_prompt
    set -l last_status $status
    
    # Show last command status if non-zero
    if test $last_status -ne 0
        set_color $red
        echo -n "[$last_status] "
    end
    
    # Show current time
    set_color $comment
    echo -n (date "+%H:%M:%S")
    set_color normal
end