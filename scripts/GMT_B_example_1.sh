#!/bin/bash
gmt psbasemap -R0/10/0/5 -JX10c/5c -Bx2 > GMT_B_example_1.ps
rm gmt.*
