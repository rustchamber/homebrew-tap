cask "rustchamber" do
  version "0.1.0-beta"
  sha256 "6d2dc7182751c97e838a6bfb2b889dc2ccc329ca782d23f021cfc3e59d74d498"

  url "https://github.com/rustchamber/rustchamber/releases/download/v#{version}/RustChamber-#{version}-macos-universal.dmg"
  name "RustChamber"
  desc "Native Rust desktop workspace for OpenCode"
  homepage "https://github.com/rustchamber/rustchamber"

  depends_on macos: :big_sur

  app "RustChamber.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/RustChamber.app"],
        must_succeed: false
  end

  uninstall quit: "dev.rustchamber.RustChamber"

  zap trash: [
    "~/Library/Application Support/RustChamber",
    "~/Library/Application Support/rustchamber",
    "~/Library/Saved Application State/dev.rustchamber.RustChamber.savedState",
  ]
end
