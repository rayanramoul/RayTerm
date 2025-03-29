#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh

get_platform()
{
  case $(uname -s) in
    Linux)
      gpu=$(glxinfo | grep -e OpenGL.renderer | awk '{print $4}')
      echo $gpu
      ;;

    Darwin)
      # TODO - Darwin/Mac compatability
      ;;

    CYGWIN*|MINGW32*|MSYS*|MINGW*)
      # TODO - windows compatability
      ;;
  esac
}

get_gpu()
{
  gpu=$(get_platform)
  if [[ "$gpu" == NVIDIA ]]; then
    usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{ sum += $0 } END { printf("%d%%\n", sum / NR) }')
  else
    usage='unknown'
  fi
  normalize_percent_len $usage
}

main()
{
  # storing the refresh rate in the variable RATE, default is 5
  RATE=$(get_tmux_option "@kanagawa-refresh-rate" 5)
  name="GPU"

  if installed "glxinfo"; then
    type=$(glxinfo | grep -e OpenGL.renderer | cut -d':' -f2 | sed -E 's/.*?(RTX|GTX|RX|R9|R7|R5|HD|Arc|UHD|Iris|HD Graphics) ([0-9]+[A-Za-z0-9]*).*/\1 \2/' | xargs)
    name="GPU ($type)"
  fi

  gpu_label=$(get_tmux_option "@kanagawa-gpu-usage-label" "$name")
  gpu_usage=$(get_gpu)

  echo "$gpu_label $gpu_usage"
  sleep $RATE
}

# run the main driver
main
