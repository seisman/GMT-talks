#!/bin/bash
gmt psbasemap -R0/10/0/5 -JX10c/5c -Bxafg -Byafg -BWSen+glightblue+t'GMT is easy to learn' > GMT_B_example_10.ps
rm gmt.*
