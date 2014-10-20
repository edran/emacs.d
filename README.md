.emacs.d
========

Personal emacs configuration. Currently very slow and potentially
unstable. Use at your own risk.

Requirements
------------

 * xcape (for god-mode esc switch)
 * Latex stuff (??)
 * Flake8
 * hlint, happy, hasktags, stylish-haskell, cabal (>=1.18) and ghc-mod

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

* write an install script
* Configure thesaurus for texts modes
* Document more stuff.
* Refactor *everything* to autoload.
* Install perspective @nex3/perspective-el
