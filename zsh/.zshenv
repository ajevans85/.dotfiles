# --------------------------
# Set up the PATH
# --------------------------

# Nix integration
if [[ -d "${HOME}/.nix-profile/bin" && "$PATH" != *"${HOME}/.nix-profile/bin"* ]]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

# MacPorts integration
if [[ -d /opt/local/bin && "$PATH" != *"/opt/local/bin"* ]]; then
  export PATH="/opt/local/bin:$PATH"
fi

if [[ -d /opt/local/sbin && "$PATH" != *"/opt/local/sbin"* ]]; then
  export PATH="/opt/local/sbin:$PATH"
fi

# Jenv integration
if [[ -d "${HOME}/.jenv" && "$PATH" != *"${HOME}/.jenv/bin"* ]]; then
  export PATH="${PATH}:${HOME}/.jenv/bin"
  eval "$(jenv init -)"
fi

# Stack installs files to ~/.local/bin, add to PATH if present
if [[ -d "${HOME}/.local/bin" && "${PATH}" != *"${HOME}/.local/bin"* ]]; then
  export PATH="${PATH}:${HOME}/.local/bin"
fi
