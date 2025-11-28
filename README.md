# TEN Framework Homebrew Tap

Official Homebrew formulae for [TEN Framework](https://github.com/TEN-framework/ten-framework) - An open-source framework for real-time multimodal conversational AI.

## 🍺 Installation

### Quick Install

```bash
brew tap TEN-framework/ten-framework
brew install tman
```

Or install in one command:

```bash
brew install TEN-framework/ten-framework/tman
```

### Verify Installation

```bash
tman --version
```

## 📦 Available Formulae

### tman

TEN Framework package manager and development tool.

**Features:**
- 📦 Package management for TEN Framework projects
- 🚀 Project scaffolding and initialization  
- 🔗 Dependency resolution
- 🛠️ Build and deployment tools

**Usage:**

```bash
# Check version
tman --version

# Show help
tman --help

# Install project dependencies
tman install

# Create new project
tman create my-project
```

## 🔄 Updating

Update tman to the latest version:

```bash
brew update
brew upgrade tman
```

## 🗑️ Uninstallation

```bash
brew uninstall tman
brew untap TEN-framework/ten-framework
```

## 📚 Documentation

- [TEN Framework](https://github.com/TEN-framework/ten-framework)
- [Official Website](https://www.theten.ai/)
- [Documentation](https://doc.theten.ai/)

## 🤝 Contributing

Issues and pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

### Updating the Formula

When a new version of tman is released:

1. Update the `version` field in `Formula/tman.rb`
2. Download the new release artifacts and calculate SHA256 checksums
3. Update the `sha256` values in the formula
4. Submit a pull request

## 📄 License

This tap is part of the TEN Framework project, licensed under the Apache License 2.0.

---

<div align="center">
  <strong>Built with ❤️ by the TEN Framework Team</strong>
</div>

