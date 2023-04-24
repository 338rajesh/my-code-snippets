

CANCEL all SLURM jobs at a time
    squeue -u $USER | grep 197 | awk '{print $1}' | xargs -n 1 scancel

# Task Manager
+ `free -h` or `free -g` or `free -m` 
    + Gives the details of the respective compute node
+ 

# Cluster info

## Nodes
1.  nmcad           # main node
2.  compute-1-1
3.  compute-1-2
4.  compute-1-3
5.  compute-1-4
6.  compute-2-5
7.  compute-3-6
8.  compute-3-7
9.  compute-3-8
10. compute-3-9

+ RAM on each node: 125 GB, check with `free -h`
+ Accessing HPC:
    `ssh user_name@10.40.63.29` or 
    `ssh -X user_name@10.40.63.29` or
    `ssh -Y user_name@10.40.63.29`
    this will lead you into main node `nmcad`
    Then, to access compute nodes, use
    `ssh compute-<>-<>`


# Job Management using slurm


# Applications

## Mathematica

    `ssh -Y rajesh@10.40.63.29 && ssh -Y compute-3-9 && export QT_XKB_CONFIG_ROOT=/usr/share/X11/xkb && /share/apps/Wolfram/Mathematica/11.3/Executables/mathematica`