

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

## Launch

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload center &
    MONITOR=$m polybar --reload datee &
    MONITOR=$m polybar --reload quicks &
    MONITOR=$m polybar --reload launcher &
  done
else
    polybar --reload center &
    polybar --reload datee &
    polybar --reload quicks &
    polybar --reload launcher &
fi
