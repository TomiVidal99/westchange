WC_DIRECTORIES=${0:A:h}/directories

# TODO: should auto install fzf
# check if the user has the fzf utility

if [ ! -f $WC_DIRECTORIES ]; then
  touch $WC_DIRECTORIES
fi

# switch between the defined directories.
function switch_directory() {
  DIRS=$(cat $WC_DIRECTORIES)
  DIR=""; DIR=$(echo $DIRS | cut -d'=' -f1 | fzf)
  if [ "$DIR" = "" ]; then
    echo "No directory selected. Did not switch."
    return
  fi
  FULLPATH=$(echo $DIRS | grep $DIR | head -n 1 | cut -d'=' -f2)
  if [ -d $FULLPATH ]; then
    cd "$FULLPATH"
  else
    echo "'${FULLPATH}' doesn't exist."
  fi
}

# add the current directory to the working directories list
function add_directory() {
  # TODO: check if the name picked doesn't actually exist.
  read "DIR_NAME?What should i call this directory? "
  if [ -z "$DIR_NAME" ]; then
    echo "ERROR: enter a valid directory name"
    return
  fi
  DIR=$(pwd)
  FULLPATH="${DIR_NAME}=${DIR}"
  echo $FULLPATH >> $WC_DIRECTORIES
}

# remove current directory from the working directory list
function remove_directory() {
  zle -I
  if [ -z $WC_DIRECTORIES ]; then
    # exit if the are no working directories
    clear
    echo "No working directories"
    return 
  fi
  DIR=$(cat $WC_DIRECTORIES | cut -d'=' -f1 | fzf)
  FULLPATH=$(cat $WC_DIRECTORIES | grep $DIR)
  PATTERN_TO_REMOVE="/$(echo $FULLPATH | sed 's/\//\\\//g')/d"
  while true; do
      read "yn?Remove '$FULLPATH' [y/n]: "
      case $yn in
          [Yy]*) echo "Deleted" ; break;;
          [Nn]*) echo "Aborted" ; return  1;;
      esac
  done
  sed -i $PATTERN_TO_REMOVE $WC_DIRECTORIES
}

# load the hotkeys to quickly change directory
source ${0:A:h}/hotkeys.sh
