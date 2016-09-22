#!/bin/bash
gmt psbasemap -R0/10/0/5 -JX10c/5c -Bxa2f1g0.5+p'$' > GMT_B_example_4.ps
rm gmt.*
