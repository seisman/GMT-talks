#!/bin/bash
gmt psbasemap -R0/10/0/5 -JX10c/5c -Bxa2f1g0.5+u'%' > GMT_B_example_5.ps
rm gmt.*
