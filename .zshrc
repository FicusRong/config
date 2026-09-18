# Use utf-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# -----------------------------------------------------------------------------
# History Configuration
# -----------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# Write to history immediately and ignore duplicates
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# -----------------------------------------------------------------------------
# Prompt Configuration
# -----------------------------------------------------------------------------
# Enables prompt substitution and color support
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors

# Simple, informative prompt: [user@host:current_folder]$ 
PROMPT='%F{green}%n@%m%f:%F{cyan}%~%f$ '

# -----------------------------------------------------------------------------
# Completion & Navigation
# -----------------------------------------------------------------------------
autoload -Uz compinit && compinit

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Alias
alias ll='ls -lah'
alias du='du -h'
alias du1='du -h -d 1'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias proxy='export http_proxy="http://127.0.0.1:54054"; export https_proxy="http://127.0.0.1:54054"; export all_proxy="socks5://127.0.0.1:54054"; echo "Proxy Environment Set."'
proxy
alias unproxy='unset http_proxy https_proxy all_proxy; echo "Proxy Environment Cleared."'

# -----------------------------------------------------------------------------
# Environment & PATH
# -----------------------------------------------------------------------------
export EDITOR="vim"
export LANG="en_US.UTF-8"

# ========== Homebrew 中科大镜像（支持 Manifest） ==========
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# Add local binaries to PATH
export PATH="$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH"


# Claude Code API Router configuration
export ANTHROPIC_BASE_URL="https://co.yes.vg"
export ANTHROPIC_AUTH_TOKEN="cr_274fa0b16ebf19b746a72356bbbd1a424f4e30c90ac888db982adb48d547a36f"


# Added by Antigravity CLI installer
export PATH="/Users/shu.rong/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# YITU Dev
# -----------------------------------------------------------------------------
export HARBOR_REGISTRY=harbor.yitu-inc.com
export ARTIFACTORY_REGISTRY=it-artifactory.yitu-inc.com
