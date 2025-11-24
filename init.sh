#!/bin/bash

ifconfig virbr0 192.168.0.1/24
ip addr add dev virbr0 172.17.0.1/24

brctl stp virbr0 off

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 ! -d 192.168.0.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.17.0.0/24 ! -d 192.168.0.0/24 -j MASQUERADE
sysctl -w net.ipv4.ip_forward=1
iptables -t filter -I FORWARD -j ACCEPT
iptables -t mangle -I FORWARD -j ACCEPT
