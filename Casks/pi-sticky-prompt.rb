cask "pi-sticky-prompt" do
  version "0.1.1"
  sha256 "7cf72c78e0b36278edb862ed2a32e816969ded378b2fe573fd1a620f88d92415"

  url "https://github.com/alonmartin2222/pi-sticky-prompt/releases/download/v#{version}/PiStickyPrompt.app.zip"
  name "Pi Sticky Prompt"
  desc "Always-on-top floating prompt bar for the pi coding agent"
  homepage "https://github.com/alonmartin2222/pi-sticky-prompt"

  depends_on macos: ">= :ventura"

  app "PiStickyPrompt.app"

  # The .app is ad-hoc signed, so brew tags it with com.apple.quarantine and
  # Gatekeeper blocks the first launch. Strip the attribute on install so
  # users can launch normally. (They still get standard system protections;
  # this only skips the "unidentified developer" prompt.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/PiStickyPrompt.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/org.pi.sticky-prompt.plist",
    "~/Library/Saved Application State/org.pi.sticky-prompt.savedState",
  ]

  caveats <<~EOS
    pi-sticky-prompt has two halves:

      1. The macOS HUD (this cask) — already installed.
      2. The pi extension that lets pi sessions expose themselves over a
         Unix domain socket. Install it once with:

           pi install npm:pi-sticky-prompt

    Then start any pi session, launch PiStickyPrompt, and use Cmd+Opt+P
    to toggle the bar.
  EOS
end
