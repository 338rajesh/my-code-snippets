# Terminal command typing

+ Up/Down arrows
+ Use tab for completion
+ Use ctrl+r for history
+ `ctrl+ins` => copying to clipboard
+ `shift+ins` => pasting
+ clear screen
  + `clear` (hides forever)
  + `ctrl+L` (prev. content can be accessed by scrolling up)

# Basic commands

+ `date`
+ `clear` or `ctrl+L`
+ `&&`, `;` for connecting series of commands
+ `$` for user and `#` for admin/super-user
+ Access the home dir with `~`
+ `top` (or `htop` for more features)

# File system in linux

## General

+ name starting with `.` is hidden by default
+ `ls` and its options
+ `du` and its options
+ `pwd`
+ `readlink -f`

## Structure

## Important files

+ `~/.bashrc`
  + system path
  + alias
  + `which` command

## Operations

+ Making a directory
  + `mkdir`
+ `find`
+ Copying/Moving a file/directory
    COMMON IDEA: <command><><SOURCE(S)><><DESTINATION>    
  + `cp`; '-r'
  + `mv`
  + `scp`
+ Creating/Editing a text document
  + `vi`, `vim`, `nano`

# Tree Command

+ Listing Options
  + `-d`: Only Directories
  + `-L 2`: Level of descent
  + `-P`, `-I`: Follow and Ignore patterns
  + `--filelimit #`: Do not descend in dir with morethan # files
  + `-o filename`: 
+ File Options
  + `-h` print size in human readable manner
  + `-D` Data of last modification
  + `-u` Owner of the file
  + `-p` Protections
+ Sorting Options
  + `-t`, `-v`, `-c` based on last modification, version and change time
  + `-r` Reverse the order of sort
  + `dirsfirst`
  + `sort X` X in name, version, size, mtime, ctime


## Zipping
### 7za
+ Append file(s)
  + 7za a ~/file_name.7z /path/to/target/directories
  


+ `cat homogenization_lump*[5-6]*`