# .emacs.d

Personal emacs configuration. Currently very slow and potentially
unstable. Use at your own risk. Meant to be used with Ubuntu 14.04;
checkout `precise` branch for 12.04 compatibility.

## Requirements
* xcape (for god-mode esc switch)

### LaTeX
* dvipng

### Python
* pip (for anaconda mode)
* virtualenv (for virtualenvwrapper)

## Installation

``` git clone --recursive git@github.com/edran/emacs.d ~/.emacs.d ```
or `git submodule update --init --recursive` if you have already
cloned the repository.

init.sh is used to disable caps lock and add Esc with xcape

TODOs
-----

* Configure thesaurus for text modes
* Install writegood-mode for essay writing
* Refactor *everything* to autoload.
* Install perspective @nex3/perspective-el
