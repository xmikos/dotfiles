Mikos's dotfiles
================

Requirements
------------

- git
- bash
- coreutils
- findutils

Installation
------------

    cd ~
    git clone git https://github.com/xmikos/dotfiles.git
    cd dotfiles
    ./install

Already existing files will be backed up with _.dotfiles-backup_ extension.
If you don't need backups and you don't mind that existing files 
will be overwritten, you can start install script like this:

    BACKUP=0 ./install

Update
------

    dotfiles-sync

What's included?
----------------

- __dotfiles-sync__ - script for simple installation and update of dotfiles
- __diffcolor__ - script for colorization of unified diff output
  (you can use `diffcolor` same as `diff -u`)
- Basic configuration files for _bash_, _readline_, _git_ and _mutt_
- Complex __vim__ configuration which makes Vim adhere to
  Common User Access (CUA) interface standard (make Vim behave like Notepad! ;-))

  Some Vim features:
    - sensible basic Vim settings
    - nice 256-color scheme which looks good on transparent terminals
    - standard Windows-like keybindings (Ctrl-C/Ctrl-V/Ctrl-X,
      Ctrl-Ins/Shift-Ins, CTRL-F, F3/Shift-F3, Ctrl-S, Ctrl-O, Ctrl-Q, etc.)
      and Shift + arrows for selecting text
    - cut & paste lines with Ctrl-K/Ctrl-U (like in Nano)
    - Insert key toggle between normal and insert mode
    - (un)comment selections with Ctrl-D (like in Kate)
    - (un)indent selected blocks of code with Tab/Shift-Tab
    - code completion with Tab
    - simple tabs like in web browser (Ctrl-T/Ctrl-W, Ctrl-PageUp/PageDown)
    - switch between split windows with Alt-PageUp/Alt-PageDown

  Included Vim plugins:
    - _Pathogen_ - management of individually installed plugins in ~/.vim/bundle
    - _AutoFenc_ - automatically detect and set file encoding when opening a file
    - _LightLine_ - light and configurable statusline/tabline
    - _NERD Commenter_ - comment/uncomment selections
    - _smarthomekey_ - intelligent Home key which respects indentation
    - _Supertab_ - code completion with Tab key
    - _Tagbar_ - class browser
    - _GitGutter_ - shows signs for modified lines (changes in Git working tree)
    - some great colorschemes (_Hybrid_, _Jellybeans_, _Molokai_, _Wombat_)

