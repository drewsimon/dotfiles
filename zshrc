source ~/.zplug/init.zsh

# pull in random oh-my-zsh features
zplug "lib/completion",                         from:oh-my-zsh
zplug "lib/directories",                        from:oh-my-zsh
zplug "lib/history",                            from:oh-my-zsh
zplug "plugins/dirpersist",                     from:oh-my-zsh


# history search on typed command
zplug "zsh-users/zsh-history-substring-search"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# prompt
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# install any uninstalled plugins
zplug check || zplug install

zplug load --verbose


# aliases
alias dc='docker-compose'
