#!/usr/bin/env tclsh

set freq 0

set chan [open "input.txt" r]
set delta_fs [read $chan]
close $chan

set freqs {}

while {1} {
    foreach delta_f $delta_fs {
        set freq [expr $freq + $delta_f]
        if {"$freq" ni $freqs} {
            lappend freqs $freq
        } else {
            puts "first repeating frequency is $freq"
            return
        }
    }
}
