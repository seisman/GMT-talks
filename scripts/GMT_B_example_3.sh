#!/bin/bash
gmt psbasemap -R0/10/0/5 -JX10c/5c -Bxa2f1g0.5+l"X axis" > GMT_B_example_3.ps
rm gmt.*
