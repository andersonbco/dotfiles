#!/usr/bin/env python

# Script to choose between the current scratchpads using rofi

########### REQUIRED #############
# Rofi (obviously)               #
# sudo pip install i3ipc-python  #
# sudo pip install python-rofi   #
##################################

import sys

from i3ipc import Connection, Event
from rofi import Rofi

i3 = Connection()
r = Rofi()

scratchpads = []
for node in i3.get_tree().scratchpad().floating_nodes:
    scratchpads.append((node.nodes[0].name, node.nodes[0].window))

selected_index, selected_key = r.select("Choose a scratchpad", [x[0] for x in scratchpads])

if selected_index == -1:
    sys.exit(1)

i3.command('[id='"%s"'] scratchpad show' % scratchpads[selected_index][1])
