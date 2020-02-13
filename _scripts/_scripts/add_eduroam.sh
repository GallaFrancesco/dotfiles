#!/bin/bash

# Add "eduroam" as a networkmanager connection
# connect by adding then nmtui -> etc.

nmcli connection add \
	type wifi con-name "eduroam" ifname $(ifconfig | grep -i w | cut -d":" -f 1) ssid "eduroam" -- \
	wifi-sec.key-mgmt wpa-eap 802-1x.eap peap \
	802-1x.phase2-auth mschapv2 802-1x.identity "francesco.galla@edu.unito.it"
