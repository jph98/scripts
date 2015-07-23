Setup
-----

* .vimrc lives in your home directory
* .vim contains the various bits and pieces 

Use pathogen from here - https://github.com/tpope/vim-pathogen
* Download into the autoload folder
* Things are installed in .vim/bundle after that

Comments - use "
Help - use : then tab    

Vimrc Settings
--------------

* Mouse compatibility - set mouse=a
* Set line numbers - set number
* Autocomplete - TODO
* Set terminal support for 256 colours - set t_Co=256
    
Color Schemes
-------------

    :colorscheme solarized
    
:colorscheme and tab to look at what's currently installed

Autocomplete
------------

Ruby - https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport

CTRL-X CTRL-O for completion

Commands
--------

    :NERDTree

Search and Replace
------------------

    :%s/pattern/replace/

Copying/Pasting Text
--------------------

Make sure you set unnamed as the clipboard in vimrc then:

    "*y
    
    "*p
