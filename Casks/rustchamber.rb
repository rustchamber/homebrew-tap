cask "rustchamber" do
  version "0.0.1-alpha"
  sha256 "25ea0bb2da5b241b3f61d7571e15bfd51cc029ad100d280c77c7a666d40680cd"

  url "https://github.com/LipeMachado/rustchamber/releases/download/v#{version}/RustChamber-#{version}-macos-universal.dmg"
  name "RustChamber"
  desc "Native Rust desktop workspace for OpenCode"
  homepage "https://github.com/LipeMachado/rustchamber"

  depends_on macos: :big_sur

  app "RustChamber.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "#{appdir}/RustChamber.app"],
        must_succeed: false
  end

  uninstall quit: "dev.rustchamber.RustChamber"

  zap trash: [
    "~/Library/Application Support/RustChamber",
    "~/Library/Application Support/rustchamber",
    "~/Library/Saved Application State/dev.rustchamber.RustChamber.savedState",
  ]
end
