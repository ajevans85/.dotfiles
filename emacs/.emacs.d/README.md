Scala for Emacs
===============

This is my basic Emacs setup orientated around Scala development using Ensime.

Packages are managed by the [use-package](https://github.com/jwiegley/use-package) project and set to auto install, this keeps things simple to manage.

A custom theme [darkula](https://github.com/bmdhacks/emacs-color-theme-darkula) is used to give the look and feel of IntelliJ. You will need to install the [Droid Sans Mono for Powerline](https://github.com/powerline/fonts/tree/master/DroidSansMono) font manually.

I use the Emacs [Evil](http://www.emacswiki.org/emacs/Evil) plugin to give VIM keybindings 

##Modules used
* [Ensime](https://github.com/ensime/ensime-server) - ENhanced Scala Interaction Mode for text Editors.
* [Evil](http://www.emacswiki.org/emacs/Evil) - Vim key bindings
* [Linum Relative](https://github.com/emacsmirror/linum-relative) - Relative line numbers for Vim navigation
* [Magit](https://github.com/magit/magit) - Git support
* [Projectile](https://github.com/magit/magit) - Project navigation support

##Installation

1. Install the [Droid Sans Mono for Powerline](https://github.com/powerline/fonts/tree/master/DroidSansMono) font.

2. Note the --recursive option for the git submodules.

```
git clone --recursive git@github.com:ajevans85/scala-for-emacs.git ~/.emacs.d
```

