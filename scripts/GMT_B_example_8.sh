#!/bin/bash
gmt psbasemap -R0/10/0/5 -JX10c/5c -Bx2+lX -By1+lY -BWSen > GMT_B_example_8.ps
rm gmt.*
