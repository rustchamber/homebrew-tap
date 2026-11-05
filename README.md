# RustChamber Homebrew tap

Install [RustChamber](https://github.com/rustchamber/rustchamber) with Homebrew:

```bash
brew install --cask rustchamber/tap/rustchamber
```

Or tap the repository first:

```bash
brew tap rustchamber/tap
brew trust --cask rustchamber/tap/rustchamber
brew install --cask rustchamber
```

Upgrade:

```bash
brew upgrade --cask rustchamber
```

Uninstall, keeping settings:

```bash
brew uninstall --cask rustchamber
```

Uninstall and remove settings and window state:

```bash
brew uninstall --zap --cask rustchamber
```

The cask removes the macOS quarantine flag after installation, so the app opens without
the "Apple could not verify" dialog. If RustChamber is already in `/Applications` from a
manual DMG install, adopt it once:

```bash
brew install --cask --adopt rustchamber/tap/rustchamber
```

Builds are ad-hoc signed because the project does not ship an Apple Developer ID
certificate.
