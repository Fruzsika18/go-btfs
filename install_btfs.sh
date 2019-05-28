#!/bin/bash
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on
export EDITOR=vim
go clean -modcache
make install
btfs init
# bootstrap node
btfs bootstrap rm --all
btfs bootstrap add /ip4/3.18.120.107/tcp/4001/ipfs/QmcmRdAHQYTtpbs9Ud5rNx6WzHmU9WcYCrBneCSyKhMr7H
btfs bootstrap add /ip4/3.14.203.8/tcp/4001/ipfs/QmbsqP3GLrRRhGWwnXnb6gb7EFC9LAege333NBpn9cDXAv
btfs bootstrap add /ip4/3.14.238.171/tcp/4001/ipfs/QmRb1Vi7JeNMVE2QVvCuWFU2J2qt6rn4pLf31CHyjt9GbB
# cross-origin resource sharing
btfs config --json API.HTTPHeaders.Access-Control-Allow-Origin "[\"*\"]"
btfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST", "OPTIONS"]'
btfs config --json API.HTTPHeaders.Access-Control-Allow-Credentials "[\"true\"]"
btfs config Addresses.API /ip4/0.0.0.0/tcp/5001
btfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080

# echo a message if btfs is installed successfully
var_btfs=$(which btfs)
if [ -n "$var_btfs" ]; then
    echo install successful, please run 'btfs daemon'
fi