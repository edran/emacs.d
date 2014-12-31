.emacs.d
========

Personal emacs configuration. Currently very slow and potentially
unstable. Use at your own risk.

Requirements
------------

 * xcape (for god-mode esc switch)
 * Latex stuff (??)
 * ^ dvipng
 * Flake8
 * hlint, happy, hasktags, stylish-haskell, cabal (>=1.18) and ghc-mod
 * C/C++ stuff (??)
Installation
------------

```
git clone --recursive git@github.com/edran/emacs.d ~/.emacs.d
```

init.sh is used to disable caps lock and add Esc with xcape

In emacs:
* M-x jedi:install-server

TODOs
-----

* write an install script (In-progress[ish])
* Configure thesaurus for texts modes
* Install helm and take ido away
* Document more stuff.
* Refactor *everything* to autoload.
* Install perspective @nex3/perspective-el
