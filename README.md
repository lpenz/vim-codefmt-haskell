[![Build Status](https://travis-ci.org/lpenz/vim-codefmt-haskell.png?branch=master)](https://travis-ci.org/lpenz/vim-codefmt-haskell)

# vim-codefmt-haskell

Haskell formatter for google/vim-codefmt using stylish-haskell


## Installation


### Prerequisites

* vim-codefmt (https://github.com/google/vim-codefmt)
* stylish-haskell (https://github.com/jaspervdj/stylish-haskell)


### Vundle Installation

* Install Vundle (https://github.com/VundleVim/Vundle.vim)
* Add this line to the vundle plugins section in your ~/.vimrc:
```Plugin 'lpenz/vim-codefmt-haskell'```
* Run :PluginInstall inside vim to install the plugin.


## Usage

Format a haskell buffer with :FormatCode

Enable auto-formatting upon save with :AutoFormatBuffer


## Configuration

You can change the formatter executable with the stylish_haskell_executable codefmt flag.
In your ~/.vimrc:

```Glaive codefmt stylish_haskell_executable='/users/foo/bin/stylish-haskell'```


## Credits

The authors of vim-codefmt and the related vim plugins maktaba and glaive
(https://github.com/google/vim-codefmt) for a codefmt framework that simply
does the right thing.

syml for the rust-codefmt plugin that served as the basis for this one
(https://github.com/syml/rust-codefmt).
