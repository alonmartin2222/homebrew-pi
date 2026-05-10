# homebrew-pi

Homebrew tap for [pi](https://github.com/earendil-works/pi) coding-agent
companion apps and tools by [@alonmartin2222](https://github.com/alonmartin2222).

## Usage

```bash
brew tap alonmartin2222/pi
```

## Available casks

### pi-sticky-prompt

Always-on-top floating prompt bar for the pi coding agent — keeps your
prompt input visible while you scroll the terminal.

```bash
brew install --cask pi-sticky-prompt
```

After installing, run `pi install npm:pi-sticky-prompt` to install the
extension half (a tiny Node module that lets pi sessions expose
themselves over a Unix domain socket so the HUD can find them).

See <https://github.com/alonmartin2222/pi-sticky-prompt> for full
documentation.

## License

Each cask in this tap inherits the license of its upstream project.

The cask formulae themselves are MIT-licensed.
