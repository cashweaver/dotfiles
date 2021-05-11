#!/bin/bash
# Increase the brightness (optionally: of a specific monitor
#
# Expects 1-2 arguments: a direction (up|down) and an optional monitor name

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/../config/monitors.sh"
source "${DIR}/config.sh"
source "${DIR}/set_brightness_fn.sh"

#function get_new_brightness

if [[ -z $2 ]]; then
  # Change the brightness of all monitors

  brightest_brightness=$(<"${DIR}/brightest_brightness.txt")
  if [[ $1 == "up" ]]; then
    new_brightness=$(python3 -c "from decimal import Decimal; print(max(min(Decimal(${brightest_brightness}+${brightness_step}), 1), 0.1))")
  else
    new_brightness=$(python3 -c "from decimal import Decimal; print(max(min(Decimal(${brightest_brightness}-${brightness_step}), 1), 0.1))")
  fi

  # Update all stored brightnesses
  set_brightness "$new_brightness" "north"
  set_brightness "$new_brightness" "south"
  set_brightness "$new_brightness" "east"
  set_brightness "$new_brightness" "west"
else
  # Change the brightness of the specified monitor
  current_brightness=$(<"${DIR}/${2}_monitor_brightness.txt")
  if [[ $1 == "up" ]]; then
    new_brightness=$(python3 -c "from decimal import Decimal; print(max(min(Decimal(${current_brightness}+${brightness_step}), 1), 0.1))")
  else
    new_brightness=$(python3 -c "from decimal import Decimal; print(max(min(Decimal(${current_brightness}-${brightness_step}), 1), 0.1))")
  fi

  set_brightness "$new_brightness" "$2"
fi
