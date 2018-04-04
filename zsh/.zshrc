fpath=(~/.zsh $fpath)

# Enable tab-completion
autoload -Uz compinit && compinit

if [[ -x "$(command -v antibody)" ]]; then
  source <(antibody init)
  antibody bundle < ~/.antibody/bundles.txt
else
  echo "Unable to load ZSH configuration, missing application 'antibody'"
  echo "Install it with: nix-env -i antibody"
fi

# If jenv installed source it http://www.jenv.be/
if [[ -x "$(command -v jenv)" ]]; then
  eval "$(jenv init -)"
fi

# Stack installs files to ~/.local/bin, add to PATH if present
if [[ -d "${HOME}/.local/bin" && "${PATH}" != *"${HOME}/.local/bin"* ]]; then
  export PATH="${PATH}:${HOME}/.local/bin"
fi

# Color man pages
if [[ -x "$(command -v most)" ]]; then
  export PAGER="most"
fi

# Syntax highlighting for GNU Tree
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export HISTSIZE=10000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

alias ns="nix-shell --command 'zsh --rcs ~/.zshrc'"

# Useful for preventing passwords being saved to history by prefixing with a space
setopt hist_ignore_space

# Below history options are to share history across tmux screens

# This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt inc_append_history

# This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file
setopt share_history

unsetopt beep      # no bell on error
unsetopt list_beep # no bell on ambiguous completion

setopt interactivecomments # Allow bash style # comments in the shell
