cask "rustchamber" do
  version "0.2.5-beta"
  sha256 "def61542ba34385693b5a0cead28881dc156f143b64b60a506ae2cc4a41ab245"

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
