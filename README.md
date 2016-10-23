# Dotfiles


## Prerequisites
Dotfiles are enabled /disabled using GNU Stow `gnu stow`.

Install GNU Stow:
```
nix-env -i stow
```

## Checkout the project

```
cd ~
git clone --recursive git@github.com:ajevans85/.dotfiles.git
```

## Enable required configs

Enter the project directory.

```
cd ~/.dotfiles
```

For each configuration that you want to enable use `stow`. IE:

```
stow emacs
stow git
stow nix
```

Stow will create the correct symlinks in your home directory.
