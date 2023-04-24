


# Shutdown / Reboot

+ To restart/reboot after shutdown
  + `rocks run host "/sbin/shutdown -r now"`
+ To shut down all the compute nodes
  + `cluster-fork "shutdown -h now"`  
  + `rocks run host "shutdown -h now"`
+ To shut down front end
  + `shutdown -h now`

+ If nodes are down by any chance, or most probably due to unexpected reboot.
  **Change the state from down to idle** by the following commands
  + `scontrol update nodename=compute-1-[1-4] state=resume`  where, `compute-1-[1-4]` list the nodes of interest


# User Accounts

## Creating users accounts
  + sudo useradd [OPTIONS] username 
  + verify using `id <user_name>`
  + Users home directory: `/home` or `/export/home`

## Syncing accounts across the nodes
  + `rocks sync users`  # Sync user and group information to all nodes
  + `rocks sync config`  # Update all config files, restart relevant services
  + `rocks sync slurm`  # Sync SLURM configuration files to compute nodes


# Software Utilities

## Mathematica
+ Access mathematic from ohter nodes using (note that you must use -Y option along with ssh to get GUI interface)
  `/export/apps/Wolfram/Mathematica/11.3/Executables/mathematica`
+ `export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb` adds X11 to path
+ Activating mathematic license
	/share/apps/Wolfram/MathLM/mathlm -logfile /share/apps/Wolfram/MathLM/log.mathematica_`date +'%d_%m
	_%Y_%H:%M:%S'`

## Abaqus

+ change port from eno1 to eth1 using (Because our cluster uses eno1 convention but abaqus lmgrd recognises only eth1.)
    + `ip link set eno1 down`
    + `ip link set eno1 name eth1`
    + `ip link set eth1 up`

+ Starting ABAQUS lmgrd service

    `/share/apps/Abaqus2016/SIMULIA/CAE/2016/linux_a64/code/bin/lmgrd -c /share/apps/Abaqus2016/license/0cc47aacd1e6_ABQ23602_0005_1.LIC -l /share/apps/Abaqus2016/license/licLog/log-$(date "+%Y.%m.%d-%H.%M.%S").txt`

+ lmgrd binaries available at 

    `/share/apps/Abaqus2016/Flexnet2016/linux_a64/code/bin/`

# Drivers

  `yum install -y mesa-dri-drivers` installs libGL missing drivers (for GUI based interface)
