# homebrew-gotodir

Homebrew tap for [`gotodir`](https://github.com/JasGH/gotodir) — an arrow-key picker for jumping between project directories.

## Install

```sh
brew tap JasGH/gotodir
brew install gotodir
```

Then add this to your shell config:

```sh
# ~/.zshrc  (or ~/.bashrc)
[ -f "$(brew --prefix)/share/gotodir/gotodir.sh" ] && \
  source "$(brew --prefix)/share/gotodir/gotodir.sh"
```

See the [main repo](https://github.com/JasGH/gotodir) for full documentation.
