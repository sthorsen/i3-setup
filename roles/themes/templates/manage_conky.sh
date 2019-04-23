#!/bin/bash

killall conky
sleep 0.1
conky -c ~/.conky/conkyrc_right
conky -c ~/.conky/conkyrc_left
