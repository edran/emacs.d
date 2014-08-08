.emacs.d
========

Pretty much an always in-progress config. Currently also very slow at startup because of many redundant loads and no autoload use. Will be refactored at some point.

Requirements
------------
(TODO: actually document this.)
* xcape (for god-mode esc switch)

* Haskell autocomplete stuff
* Latex stuff

Python:
 * Flake8
 * Jedi is used for autocompletion

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
