.emacs.d
========

Pretty much an always in-progress config. Currently also very slow at
startup because of many redundant loads and no autoload use. Will be
refactored at some point.

Seriously.

Requirements
------------
(TODO: actually document this.)
 * xcape (for god-mode esc switch)
 * Latex stuff (??)
 * Flake8
 * hlint, happy, hasktags, stylish-haskell, cabal (>=1.18) and ghc-mod

Installation
------------

```
git clone --recursive git@github.com/edran/emacs.d ~/.emacs.d
```

Then make init.sh run at startup somehow (xinitrc, xsession, etc.)

In emacs:
* M-x jedi:install-server

TODOs
-----

* write an install script
* Configure thesaurus for texts modes
* Document more stuff.
* Refactor *everything* to autoload.
* Install perspective @nex3/perspective-el
