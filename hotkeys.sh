# hotkey to switch between directories
# hit: CTRL+W
function switch_directory_() {zle -I; switch_directory}; zle -N switch_directory_
bindkey -M vicmd '^w' switch_directory_

# also it's recommended to have some aliases like:
# alias awcd='add_directory'
# alias rwcd='remove_directory'
