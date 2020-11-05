#!/usr/bin/env bash

display_info(){

	d_title=$USER@$HOSTNAME
	d=$(uname -a | awk '{print $6}')
	d_os=$(uname -o) 
	d_kname=$(cat /proc/sys/kernel/ostype)
	d_kversion=$(cat /proc/sys/kernel/osrelease)
	d_uptime=$(uptime | sed 's/.*up//g;s/user.*//g')
	d_shell=$(basename $SHELL)
	d_desk=$XDG_SESSION_DESKTOP
	d_cpu=$(cat /proc/cpuinfo | grep -o 'model name.*'| sed -n 1p | sed 's/.*:.//g')
	d_memtot=$(echo $(cat /proc/meminfo | sed -n 1p | tr -d [A-Za-z:' ']) / 1000000 | bc) 
	d_memfree=$(echo $(cat /proc/meminfo | sed -n 2p | tr -d [A-Za-z:' ']) / 1000000 | bc)


}

set_info(){
display_info
cat <<EOF

$d_title
Distro: ${d^}
OS: $d_os
Kernel Name: $d_kname
Kernel Version: $d_kversion
Uptime: $d_uptime
Shell: ${d_shell^}
Desk: ${d_desk^}
CPU: $d_cpu
RAM Total: $d_memtot GB
RAM Livre: $d_memfree GB

EOF

}

set_info
