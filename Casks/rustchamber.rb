cask "rustchamber" do
  version "0.2.1-beta"
  sha256 "21c2c5e2578912a1f6d1ef075d198e4e96fae0d01c0ebe00e1981d06f8b57de5"

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
