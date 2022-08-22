# ----------------------------
# basic
# ----------------------------
# コマンド履歴の管理
HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000
#ヒストリに重複を表示しない
setopt hist_ignore_all_dups
# 重複するコマンドが保存されるとき、古い方を削除する。
setopt hist_save_no_dups
# enable completion
autoload -Uz compinit; compinit
autoload -Uz colors; colors
#alias
alias ls="ls -G"

#Google Cloud SDK
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lettuce/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lettuce/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lettuce/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lettuce/google-cloud-sdk/completion.zsh.inc'; fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# ----------------------------
# Zinit plugins
# ----------------------------
# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
# シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting
# 入力補完
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
# コマンド履歴を検索
zinit light zdharma/history-search-multi-word
