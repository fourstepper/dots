######### I, as of now, do not use this script, as I use the Cadence GUI and settings #########

#!/usr/bin/bash

# Output of cat /proc/asound/cards (mine is "USB")
card=USB

# Wanted sample rate (mine is 44100)
rate=44100

# Wanted buffer size (mine is 1024)
buffer=1024

killall carla &>/dev/null

killall a2jmidid &>/dev/null

# path to your wanted carla project
carlarun() {
    carla -n '~/.dotfiles/dotfiles/.config/Carla/sonarworks_carla_config.carxp'
}

# run it
jack_control ds alsa
jack_control dps device hw:USB
jack_control dps rate $rate
jack_control dps nperiods 2
jack_control dps period $buffer
jack_control start

jackpatch 

carlarun &>/dev/null &

#a2jmidid -e &>/dev/null &

exit
