# Put this in .bashrc

function lean4-dev() {
  BASEDIR="" # set this if you place your lean4 installs all in the same dir
  if [[ $# == 0 ]]; then
      echo "LEAN4HOME = $LEAN4HOME"
  else
      if [[ -d "$BASEDIR/$1" ]]; then
          DIR=`cd "$BASEDIR/$1"; pwd -P`
          export LEAN4HOME="$DIR"
          shift
      else
          echo "ERROR: '$BASEDIR/$1' does not exist."
          false
      fi
  fi
}
