# Enabl Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export HYPRSHOT_DIR=$HOME/Pictures/Screenshots

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes 
# ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME="gozilla"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshconfig="nvim ~/.zshrc"
alias cls='clear'
alias e='exit'

# pacman 
alias pI='sudo pacman -S' 
alias pU='sudo pacman -Sy archlinux-keyring;sudo pacman -Syu'
alias pS='sudo pacman -Ss'
alias pR='sudo pacman -Rn'
alias pQ='sudo pacman -Q'

# yay
alias yI='yay -S' 
alias yU='yay -Syu'
alias yS='yay -Ss'
alias yR='yay -R'
alias yQ='yay -Q'

# exa 
alias ls='exa -a --group-directories-first --icons'
alias ll='exa -al --group-directories-first --icons'
alias lt='exa -aT --group-directories-first --icons'
alias l.='exa -a | grep "^\."'

# ls
# alias ls='ls -a --color --group-directories-first'
# alias ll='ls -alh --group-directories-first'
# alias l.='ls -a | grep "^\."'

# kitty 
alias kittyicat='kitty +kitten icat'
alias kittythemes='kitty +kitten themes'

# mpv
alias tvb='mpv --ytdl-format=22 $1'
alias tvm='mpv --ytdl-format=18 $1' 

# making/editing files and direcotries
alias j='cd $(find . -type d | fzf --preview="tree -C {}")'
# alias fzl='find . -type f | fzf'
alias md='mkdir -p'
alias mf='touch'
alias mx='chmod +x'
alias v='nvim'
alias vf='find . -type f | fzf --preview="bat --color always {}" | xargs -r nvim'
alias code='code --profile C++'
alias rm='trash'
alias cp='cp -i'
alias build='./build.sh'

# git 
alias gclone='git clone'
alias gitdo='git add .; git commit; git push'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# nmcli
alias wifi='nmcli device wifi'

# yt-dlp
# --- video
alias yt-dlp-vid-1080="yt-dlp -f 140+137 -o '%(title)s.%(ext)s'"
alias yt-dlp-vid-720="yt-dlp -f 140+136 -o '%(title)s.%(ext)s'"
alias yt-dlp-vid-420="yt-dlp -f 140+135 -o '%(title)s.%(ext)s'"
alias yt-dlp-vid-360="yt-dlp -f 140+134 -o '%(title)s.%(ext)s'"
# --- playlist video
alias yt-dlp-vid-list-1080="yt-dlp -f 140+137 -o '%(playlist_index)s-%(title)s.%(ext)s'"
alias yt-dlp-vid-list-720="yt-dlp -f 140+136 -o '%(playlist_index)s-%(title)s.%(ext)s'"
alias yt-dlp-vid-list-420="yt-dlp -f 140+135 -o '%(playlist_index)s-%(title)s.%(ext)s'"
alias yt-dlp-vid-list-360="yt-dlp -f 140+134 -o '%(playlist_index)s-%(title)s.%(ext)s'"
# --- audio
alias yt-dlp-aud="yt-dlp -x -o '%(title)s.%(ext)s'"
# --- playlist audio
alias yt-dlp-audo-list="yt-dlp -x -o '%(playlist_index)s-%(title)s.%(ext)s'"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH":~/.local/bin


# vocab script
# shuf -n 1 ~/.local/share/new-word | lolcat

# starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# vim mode
set -o vi

