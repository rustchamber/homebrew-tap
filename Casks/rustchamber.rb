cask "rustchamber" do
  version "0.2.9"
  sha256 "060b8b84dac61ddc39a54acc06696554316d806dd6d1f2b86442fe9508fc452f"

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
