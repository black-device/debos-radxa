#!/bin/bash


# env
#export CPU=rk3566
#export BOARD=radxa-cm3-io
#export MODEL=ubuntu
#export DISTRO=focal
#export VARIANT=server
#export ARCH=arm64
#export FORMAT=gpt
#export IMAGESIZE=2000MB

./scripts/build.sh -c rk3566 -b radxa-cm3-io -m ubuntu -d focal -v server -a arm64 -f gpt -0
