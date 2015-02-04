# .emacs.d

Personal emacs configuration. Currently very slow and potentially
unstable. Use at your own risk.


## Requirements

* xcape (for god-mode esc switch)

### LaTeX

* dvipng

### Python

* Flake8
* Jedi
* `M-x jedi:install-server`

### Haskell

* hlint
* happy
* hasktags
* stylish-haskell
* cabal (>=1.18)
* ghc-mod

## C/C++ stuff

* Irony
 - libclang (3.4)
 - CMake >= 2.8.5
 - clang (if needed)
 - `M-x irony-install-server RET`

* ggtags
 - GNU global


## Installation

```
git clone --recursive git@github.com/edran/emacs.d ~/.emacs.d
```

init.sh is used to disable caps lock and add Esc with xcape

TODOs
-----

* Configure thesaurus for text modes
* Document more stuff.
* Refactor *everything* to autoload.
* Install perspective @nex3/perspective-el
