#!/usr/bin/env bash

# Get the active output device (sink)
active_sink=$(pactl get-default-sink)

# Get the description of the active sink
pactl list sinks | grep -A 10 "$active_sink" | grep "Description:" | cut -d' ' -f2-
