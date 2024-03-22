#!/bin/sh

export TRACK="gleam"

download() {
    if [ -z "$1" ]; then echo 'Usage: download <EXERCISE>'; return 1; fi
    WS=`exercism workspace`
    export EXERCISE="$1"
    if [ -d "$WS/$TRACK/$EXERCISE" ]; then echo 'Exercise "'"$EXERCISE"'" already downloaded'; return 1; fi
    exercism download --track=$TRACK --exercise="$EXERCISE" && code "$WS/$TRACK/$EXERCISE/src/"*".gleam" && code "$WS/$TRACK/$EXERCISE/test/"*".gleam" && code "$WS/$TRACK/$EXERCISE/README.md"
}

attempt() {
    if [ "$1" ]; then export EXERCISE="$1"; fi
    if [ -z "$EXERCISE" ]; then echo '$EXERCISE not set and arg not provided'; return 1; fi
    WS=`exercism workspace`
    if [ ! -d "$WS/$TRACK/$EXERCISE" ]; then echo 'Exercise "'"$EXERCISE"'" not downloaded yet'; return 1; fi
    CUR=$PWD
    cd "$WS/$TRACK/$EXERCISE"
    gleam test && exercism submit && git add -A && git commit -m "Solve $EXERCISE exercise" && git push
    cd $CUR
}
