# Faster version of powerline https://github.com/rdnetto/powerline-hs
if [ -f $HOME/.local/bin/powerline-hs ]; then
  POWERLINE_COMMAND=$HOME/.local/bin/powerline-hs
  POWERLINE_CONFIG_COMMAND=/bin/true
fi

# Load .oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
  export ZSH=$HOME/.oh-my-zsh
  ZSH_THEME="agnoster"
  ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
  DISABLE_AUTO_UPDATE="true"
  plugins=(git osx systemadmin common-aliases)
  source $ZSH/oh-my-zsh.sh
fi

# Set default editor to emacs
if which emacs > /dev/null; then
  export EDITOR='emacs -nw';
fi

# Source nix if installed
[ -f ~/.nix-profile/etc/profile.d/nix.sh ] && source ~/.nix-profile/etc/profile.d/nix.sh

if which jenv > /dev/null; then
  eval "$(jenv init -)";
fi

[ -d ~/.local/bin ] && export PATH=$PATH:~/.local/bin

if [ -d $HOME/.conscript ]; then
  export CONSCRIPT_HOME="$HOME/.conscript"
  export CONSCRIPT_OPTS="-XX:MaxPermSize=512M -Dfile.encoding=UTF-8"
  export PATH=$CONSCRIPT_HOME/bin:$PATH
fi
