#!/bin/bash
# wormhole by flaszlo2000

SAVE_FILE="/opt/wh/wh.log"

function get_wh {
    let index=1;
    if [[ $# -eq 1 ]]; then
        index=$1
    fi;

    if [[ -e $SAVE_FILE ]]; then
        res=`tail -$index $SAVE_FILE | head -1`

        if [[ $(echo $res | wc -c) -gt 1 ]]; then
            cd $res # NOTE: use with source
        else
            echo "The history is empty!" >&2
        fi
    else
        echo "There is no history file!" >&2
    fi
}

function set_wh {
    if [[ $# -eq 1 ]]; then
        if [[ -d $1 ]]; then
            echo $1 >> $SAVE_FILE
        else
            echo "Not a valid input!" >&2
        fi
    else
        echo "No parameter!" >&2
    fi
}

function clear_history {
    rm $SAVE_FILE
}

function print_history {
    if [[ -e $SAVE_FILE ]]; then
        cat $SAVE_FILE
    fi
}

function print_help {
    echo "Simple wormhole, usage:"
    echo ''
    echo '-s|--set|set): set a folder to be saved.'
    echo '    Use: wh set ./example_folder'
    echo ''
    echo '-g|--get|get): get the nth saved folder.'
    echo '    Use: wh get (in this case it will use the last)'
    echo '         wh get 5 will get the fifth'
    echo "         If the given number is larger than the history oldest line's index, then it will print the oldest line"
    echo ''
    echo '-c|--clear|clear): clear the history'
    echo '-p|--print|print): print the history'
    echo '-h|--help|help): this msg'
    echo ''
    #echo 'Made by: flaszlo2000'
}

case "$1" in
 -s|--set|set) set_wh $2 ;;
 -g|--get|get) get_wh $2 ;;
 -c|--clear|clear) clear_history ;;
 -p|--print|print) print_history ;;
 -h|--help|help) print_help ;;
 *) echo "Use: wh help" ;;
esac
