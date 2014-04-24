# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tobe/.zshrc'

autoload -Uz compinit
autoload colors
colors
compinit
# End of lines added by compinstall

setopt hist_ignore_all_dups  # 重複するコマンド行は古い方を削除
setopt hist_ignore_dups      # 直前と同じコマンドラインはヒストリに追加しない
setopt share_history         # コマンド履歴ファイルを共有する
setopt append_history        # 履歴を追加 (毎回 .zsh_history を作るのではなく)
setopt inc_append_history    # 履歴をインクリメンタルに追加
setopt hist_no_store         # historyコマンドは履歴に登録しない
setopt hist_reduce_blanks    # 余分な空白は詰めて記録
#setopt hist_ignore_space    # 先頭がスペースの場合、ヒストリに追加しない


# cd - と入力してTabキーで今までに移動したディレクトリを一覧表示
setopt auto_pushd


# コマンド履歴の検索機能の設定
# ^[  は「エスケープ」
# viなら    Ctrl-v ESC
# Emacsなら Ctrl-q ESC
# viで編集する場合
# 上2行は Ctrl-v を押下した後、希望のキーを押下
# 下2行は「エスケープ」の後にキーの端末コードを入力
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "OA" history-beginning-search-backward-end
bindkey "OB" history-beginning-search-forward-end
bindkey "[A" history-beginning-search-backward-end
bindkey "[B" history-beginning-search-forward-end
# 複数行コマンドの場合、上記の設定だと少々不都合
# tcshの様にする場合は以下のようにする
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end

# インクリメンタルサーチの設定
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

# 全履歴の一覧を出力する
function history-all { history -E 1 }


# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

export LANG=ja_JP.UTF-8

# lsコマンドの補完候補にも色付き表示
eval `dircolors`
## zstyle ':completion:*:default' list-colors ${LS_COLORS}
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


# PROMPT
## PROMPT="%m:%n%% "
## RPROMPT="[%~]"
SPROMPT="correct: %R -> %r ? "

# エスケープシーケンスを使う。
setopt prompt_subst

# ^[  は「エスケープ」
## PROMPT="%B%{[36m%}%n@%m %c %#%{[m%}%b " # 通常のプロンプト
PROMPT="%B%{[37m%}%{${fg[yellow]}%}[%T:%n@%m %c]%{${reset_color}%} %#%{[m%}%b "
## PROMPT="%B%{[37m%}[%{${fg[red]}%}%T%{${reset_color}%}:%n@%m %c] %#%{[m%}%b "
## PROMPT="%B%{[37m%}%{${fg[yellow]}%}[%{${reset_color}%}%{${fg[red]}%}%T%{${reset_color}%}:%n@%m %c%{${fg[yellow]}%}]%{${reset_color}%} %#%{[m%}%b "
PROMPT2="%B%_%{${fg[yellow]}%}>%{${reset_color}%}%b "                          # forやwhile/複数行入力時などに表示されるプロンプト
SPROMPT="%r is correct? [n,y,a,e]: "        # 入力ミスを確認する場合に表示されるプロンプト
RPROMPT="%T"                                # 右に表示したいプロンプト(24時間制での現在時刻)

setopt transient_rprompt                    # 右プロンプトに入力がきたら消す



# alias
## alias ls='ls -aFG'
alias ls='ls -GF --color=auto'
alias ll='ls -al'
alias xml='xmlstarlet'

## export TERM=vt100-color

