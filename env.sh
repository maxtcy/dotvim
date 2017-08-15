#!/bin/bash
sudo add-apt-repository ppa:pgolm/the-silver-searcher
echo "-=update repository=-"
sudo apt-get update &>/dev/null
echo "-=update Done=-"
echo "[1] Cscope"
sudo apt install cscope

echo "[2] ag (somethig like grep, but faster)"
sudo apt-get install silversearcher-ag
