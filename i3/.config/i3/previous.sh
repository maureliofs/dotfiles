#!/bin/bash

i3-msg -t get_tree | jq -r 'recurse(.nodes[]) | select(.nodes[].focused == true and .layout == "tabbed") | .nodes[] | .focused, .id' | tac | sed -En '1h;/true/{$ba;n;p;q;:a;g;p}' | xargs -I '%' i3-msg '[con_id=%] focus'
