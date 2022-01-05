# wh
Simple shell "folder bookmark" application named wormhole, with this you will be able to save and retrieve paths into a stack-like structure so you won't need to remember and retype them all the time

### Install
In the code, you will have to set the log file path to ensure permanent saving. (If you don't want that, simply set it into /tmp/)

### Aliases
To use this program anywhere, I suggest you to put this into your .bashrc:

```
WH_DIR="path_to_the_wh_dot_sh"
alias wh="$WH_DIR"
```

And I use these as well to make my life easier
```
alias whg="source $WH_DIR get"
alias whc="pwd | xargs $WH_DIR set"
```
