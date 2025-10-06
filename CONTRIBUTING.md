# Contributing to Bongopunk

Thank you for your interest in contributing to the Bongopunk theme pack! This document provides guidelines for contributing to the project.

## 🎯 Ways to Contribute

- **Add new application themes**
- **Improve existing themes**
- **Fix bugs and issues**
- **Enhance documentation**
- **Add new features**
- **Report issues**

## 🚀 Getting Started

### Prerequisites

- Git
- Basic knowledge of color schemes and configuration files
- Familiarity with the applications you want to theme

### Setting Up Development Environment

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/yourusername/bongopunk.git
   cd bongopunk
   ```
3. Create a new branch for your feature:
   ```bash
   git checkout -b feature/new-application-theme
   ```

## 🎨 Theme Development Guidelines

### Color Consistency

All themes must use the color palette defined in:
- `colors/antibaryon.toml` (dark mode)
- `colors/baryon.toml` (light mode)

### Required Files for New Applications

When adding support for a new application, create:

1. **Theme files**: Both `baryon` and `antibaryon` variants
2. **Transparent variants** (if applicable)
3. **README.md** with installation and usage instructions
4. **Update installation script** to include the new application

### File Naming Convention

- **Theme files**: `applicationname/baryon.ext` and `applicationname/antibaryon.ext`
- **Transparent variants**: `applicationname/baryon-transparent.ext`
- **Documentation**: `applicationname/README.md`

### Color Usage Guidelines

#### Semantic Color Mapping

- **Red** (`#FE4450`/`#DC2626`): Errors, critical alerts, deletion
- **Green** (`#72F1B8`/`#059669`): Success, confirmation, creation
- **Yellow** (`#FFCC00`/`#D97706`): Warnings, caution
- **Cyan** (`#61E2FF`/`#0891B2`): Primary accent, links, info
- **Purple** (`#AF6DF9`/`#7C3AED`): Secondary accent, special elements
- **Pink** (`#FC199A`/`#BE185D`): Keywords, statements
- **Orange** (`#FF8B39`/`#EA580C`): Numbers, archives, highlights

#### Background and Foreground

- **Dark mode**: Dark background (`#090318`), light foreground (`#8BA7A7`)
- **Light mode**: Light background (`#FAFAFA`), dark foreground (`#2D2D2D`)

### Code Quality Standards

1. **Consistent formatting**: Use proper indentation and spacing
2. **Comments**: Include header comments with theme name and attribution
3. **Error handling**: Graceful degradation when features aren't available
4. **Documentation**: Clear installation and usage instructions

## 📝 Documentation Standards

### README Structure

Each application directory should include a README.md with:

1. **Title and description**
2. **Installation instructions** (manual and automated)
3. **Usage examples**
4. **Configuration options**
5. **Troubleshooting section**
6. **Color palette reference**

### Code Comments

Include header comments in all theme files:

```
# Bongopunk [Mode] for [Application]
# Based on Fluoromachine by maxmx03
# Part of the Bongopunk theme collection
```

## 🧪 Testing Guidelines

### Manual Testing

Before submitting, test your themes with:

1. **Different content types** (code, text, media)
2. **Various screen sizes** and resolutions
3. **Both light and dark system themes**
4. **Transparency effects** (if applicable)

### Accessibility Testing

Ensure your themes meet accessibility standards:

1. **Contrast ratios**: Minimum 4.5:1 for normal text, 3:1 for large text
2. **Color blindness**: Test with color blindness simulators
3. **Readability**: Ensure text is readable in all conditions

### Tools for Testing

- **Contrast checkers**: WebAIM, Colour Contrast Analyser
- **Color blindness simulators**: Coblis, Stark
- **Screenshot tools**: For documentation

## 📋 Pull Request Process

### Before Submitting

1. **Test thoroughly** on your system
2. **Update documentation** as needed
3. **Add to installation script** if applicable
4. **Follow naming conventions**
5. **Include screenshots** (optional but helpful)

### Pull Request Template

```markdown\n## Description\nBrief description of changes\n\n## Type of Change\n- [ ] New application theme\n- [ ] Bug fix\n- [ ] Feature enhancement\n- [ ] Documentation update\n- [ ] Other (specify)\n\n## Applications Affected\n- [ ] Neovim\n- [ ] Kitty\n- [ ] Alacritty\n- [ ] Fish\n- [ ] Tmux\n- [ ] Yazi\n- [ ] Rofi\n- [ ] Dunst\n- [ ] Other (specify)\n\n## Testing\n- [ ] Tested on dark mode (antibaryon)\n- [ ] Tested on light mode (baryon)\n- [ ] Tested transparency variants (if applicable)\n- [ ] Verified color consistency\n- [ ] Checked accessibility\n\n## Screenshots\n(Optional) Include screenshots showing the theme in action\n\n## Additional Notes\nAny additional information or context\n```\n\n### Review Process\n\n1. **Automated checks**: Code formatting, file structure\n2. **Manual review**: Theme quality, consistency, documentation\n3. **Testing**: Maintainers test on different systems\n4. **Feedback**: Address any requested changes\n5. **Merge**: Once approved, changes are merged\n\n## 🐛 Bug Reports\n\n### Before Reporting\n\n1. **Check existing issues** to avoid duplicates\n2. **Test with latest version**\n3. **Verify it's not a configuration issue**\n\n### Bug Report Template\n\n```markdown\n## Bug Description\nClear description of the issue\n\n## Environment\n- OS: \n- Application: \n- Version: \n- Theme mode: \n\n## Steps to Reproduce\n1. Step one\n2. Step two\n3. Step three\n\n## Expected Behavior\nWhat should happen\n\n## Actual Behavior\nWhat actually happens\n\n## Screenshots\n(If applicable)\n\n## Additional Context\nAny other relevant information\n```\n\n## 💡 Feature Requests\n\n### Before Requesting\n\n1. **Check existing issues** and discussions\n2. **Consider scope**: Does it fit the project goals?\n3. **Think about implementation**: How would it work?\n\n### Feature Request Template\n\n```markdown\n## Feature Description\nClear description of the proposed feature\n\n## Use Case\nWhy is this feature needed?\n\n## Proposed Implementation\nHow should this work?\n\n## Alternatives Considered\nOther approaches you've thought about\n\n## Additional Context\nAny other relevant information\n```\n\n## 🎨 Design Philosophy\n\n### Core Principles\n\n1. **Consistency**: Unified experience across all applications\n2. **Accessibility**: Readable and usable for everyone\n3. **Aesthetics**: Beautiful synthwave-inspired design\n4. **Functionality**: Colors have semantic meaning\n5. **Performance**: Minimal impact on application performance\n\n### Inspiration\n\n- **Synthwave aesthetic**: Neon colors, retro-futuristic vibes\n- **BongoCat energy**: Playful and energetic\n- **Fluoromachine**: Technical excellence and attention to detail\n\n## 📞 Getting Help\n\n- **Issues**: For bugs and feature requests\n- **Discussions**: For questions and general discussion\n- **Discord**: [Community server] (if available)\n- **Email**: [Maintainer email] (for sensitive issues)\n\n## 📄 License\n\nBy contributing to Bongopunk, you agree that your contributions will be licensed under the MIT License.\n\n## 🙏 Recognition\n\nContributors are recognized in:\n- **README.md**: Contributors section\n- **CHANGELOG.md**: Release notes\n- **Git history**: Permanent record of contributions\n\nThank you for helping make Bongopunk better! 🎵"
