# hotkey to switch between directories
# hit: CTRL+W
function switch_directory_() {zle -I; switch_directory}; zle -N switch_directory_
bindkey -M vicmd '^w' switch_directory_
