#!/bin/sh
FN=sokoban.en
TAPENAME=SOKOBA
txt2cmt -n $TAPENAME $FN.bas
cmt2wav $FN.bas.cmt
