#!/bin/bash

pacmd set-default-sink "alsa_output.pci-0000_00_1b.0.analog-stereo" 
pacmd set-sink-volume "alsa_output.pci-0000_00_1b.0.analog-stereo" 40000

