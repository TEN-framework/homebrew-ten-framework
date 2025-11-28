# 🍺 TEN Framework Homebrew Tap

Official Homebrew tap for [TEN Framework](https://github.com/TEN-framework/ten-framework).

## 📦 Installation

### Install tman

```bash
# Add the tap (one-time setup)
brew tap TEN-framework/ten-framework

# Install tman
brew install tman
```

### Upgrade

```bash
brew update
brew upgrade tman
```

## 🛠️ Formula Maintenance

### Template-Based Formula

This tap uses a template-based approach for formula management:

- **Template**: `Formula/tman.rb.template` - The source template
- **Generated**: `Formula/tman.rb` - The actual formula (auto-generated)

### Template Placeholders

The template uses the following placeholders:

| Placeholder              | Description            | Example     |
| ------------------------ | ---------------------- | ----------- |
| `__VERSION__`            | Release version        | `0.11.35`   |
| `__MAC_X64_SHA256__`     | SHA256 for macOS x64   | `abc123...` |
| `__MAC_ARM64_SHA256__`   | SHA256 for macOS ARM64 | `def456...` |
| `__LINUX_X64_SHA256__`   | SHA256 for Linux x64   | `ghi789...` |
| `__LINUX_ARM64_SHA256__` | SHA256 for Linux ARM64 | `jkl012...` |

### Automatic Updates

The formula is automatically updated when new releases are published to [ten-framework](https://github.com/TEN-framework/ten-framework):

1. New release is created → triggers build workflows
2. All platform binaries are uploaded to release assets
3. [update_homebrew workflow](https://github.com/TEN-framework/ten-framework/blob/main/.github/workflows/update_homebrew.yml) is triggered
4. Workflow downloads assets, calculates checksums, and updates formula

### Manual Update

If automatic update fails or you need to manually update:

```bash
# 1. Download release assets
VERSION="0.11.36"
curl -L -o tman-mac-x64.zip \
  "https://github.com/TEN-framework/ten-framework/releases/download/${VERSION}/tman-mac-release-x64.zip"
curl -L -o tman-mac-arm64.zip \
  "https://github.com/TEN-framework/ten-framework/releases/download/${VERSION}/tman-mac-release-arm64.zip"
curl -L -o tman-linux-x64.zip \
  "https://github.com/TEN-framework/ten-framework/releases/download/${VERSION}/tman-linux-release-x64.zip"
curl -L -o tman-linux-arm64.zip \
  "https://github.com/TEN-framework/ten-framework/releases/download/${VERSION}/tman-linux-release-arm64.zip"

# 2. Calculate SHA256
MAC_X64_SHA=$(sha256sum tman-mac-x64.zip | awk '{print $1}')
MAC_ARM64_SHA=$(sha256sum tman-mac-arm64.zip | awk '{print $1}')
LINUX_X64_SHA=$(sha256sum tman-linux-x64.zip | awk '{print $1}')
LINUX_ARM64_SHA=$(sha256sum tman-linux-arm64.zip | awk '{print $1}')

# 3. Generate formula from template
cd Formula
sed -e "s/__VERSION__/$VERSION/g" \
    -e "s/__MAC_X64_SHA256__/$MAC_X64_SHA/g" \
    -e "s/__MAC_ARM64_SHA256__/$MAC_ARM64_SHA/g" \
    -e "s/__LINUX_X64_SHA256__/$LINUX_X64_SHA/g" \
    -e "s/__LINUX_ARM64_SHA256__/$LINUX_ARM64_SHA/g" \
    tman.rb.template > tman.rb

# 4. Test the formula
brew audit --strict tman
brew install --build-from-source tman
brew test tman

# 5. Commit and push
git add Formula/tman.rb
git commit -m "Update tman to v${VERSION}"
git push origin main
```

### Modifying the Formula

To change the formula structure:

1. Edit `Formula/tman.rb.template`
2. Regenerate `Formula/tman.rb` using the script above
3. Test thoroughly
4. Commit both files

**Important**: Always commit changes to `tman.rb.template`. The `tman.rb` file will be automatically regenerated.

## 🧪 Testing

### Local Testing

```bash
# Audit the formula
brew audit --strict tman

# Install from source
brew install --build-from-source tman

# Run tests
brew test tman

# Verify installation
tman --version
```

### CI/CD

The [update_homebrew workflow](https://github.com/TEN-framework/ten-framework/blob/main/.github/workflows/update_homebrew.yml) includes validation steps:

- SHA256 verification
- Formula generation from template
- Git commit validation

## 📚 Documentation

For more information about the automation and setup:

- [Automation Guide](https://github.com/TEN-framework/ten-framework/blob/main/tools/homebrew/AUTOMATION.md)
- [Token Setup Guide](https://github.com/TEN-framework/ten-framework/blob/main/tools/homebrew/TOKEN_SETUP.md)
- [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)

## 🔗 Links

- [TEN Framework GitHub](https://github.com/TEN-framework/ten-framework)
- [TEN Framework Documentation](https://doc.theten.ai)
- [TEN Framework Website](https://www.theten.ai/)

## 📄 License

Apache-2.0 - See [LICENSE](https://github.com/TEN-framework/ten-framework/blob/main/LICENSE) for details.

---

**Maintained by**: TEN Framework Team
**Questions?** Open an issue at [ten-framework/issues](https://github.com/TEN-framework/ten-framework/issues)
