#!/usr/bin/perl
use strict;
use warnings;
print ("Updates Available: ", (`pacman -Qu` =~ m/^[^\s]+\s\((\d+)\):/m) ? $1 : 0);
print("\n")
