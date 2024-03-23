#!/bin/sh

export TRACK="gleam"

exercism-dl() {
    if [ "$1" ]; then export EXERCISE="$1"; else; echo 'Usage: download <EXERCISE>'; return 1; fi
    WS=`exercism workspace`
    EX_DIR="$WS/$TRACK/$EXERCISE"
    if [ -d "$EX_DIR" ]; then echo 'Exercise "'"$EXERCISE"'" already downloaded'; return 1; fi
    exercism download --track=$TRACK --exercise="$EXERCISE" && code "$EX_DIR/src/"*".gleam" && code "$EX_DIR/test/"*".gleam" && code "$EX_DIR/README.md"
}

exercism-test() {
    if [ "$1" ]; then export EXERCISE="$1"; fi
    if [ -z "$EXERCISE" ]; then echo '$EXERCISE not set and arg not provided'; return 1; fi
    WS=`exercism workspace`
    EX_DIR="$WS/$TRACK/$EXERCISE"
    if [ ! -d "$EX_DIR" ]; then echo 'Exercise "'"$EXERCISE"'" not downloaded yet'; return 1; fi
    CUR=$PWD
    cd "$EX_DIR"
    exercism test
    cd $CUR
}

exercism-attempt() {
    if [ "$1" ]; then export EXERCISE="$1"; fi
    if [ -z "$EXERCISE" ]; then echo '$EXERCISE not set and arg not provided'; return 1; fi
    WS=`exercism workspace`
    EX_DIR="$WS/$TRACK/$EXERCISE"
    if [ ! -d "$EX_DIR" ]; then echo 'Exercise "'"$EXERCISE"'" not downloaded yet'; return 1; fi
    CUR=$PWD
    cd "$EX_DIR"
    exercism test && \
    exercism submit && \
    git add -A "$EX_DIR" && \
    git commit -m "Solve $EXERCISE exercise" && \
    git push && \
    export EXERCISE=""
    cd $CUR
}
