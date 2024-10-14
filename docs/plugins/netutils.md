---
layout: default
title: Network Utilities
parent: Plugins
nav_order: 1
---

Network Utilities plugin provides various tools for communicating over the network.

## Usage

```entysec
[hsf3]> load netutils

     _______________                        |*\_/*|________
    |  ___________  |     .-.     .-.      ||_/-\_|______  |
    | |           | |    .****. .****.     | |           | |
    | |   0   0   | |    .*****.*****.     | |   0   0   | |
    | |     -     | |     .*********.      | |     -     | |
    | |   \___/   | |      .*******.       | |   \___/   | |
    | |___     ___| |       .*****.        | |___________| |
    |_____|\_/|_____|        .***.         |_______________|
      _|__|/ \|_|_.............*.............._|________|_
     / ********** \                          / ********** \
   /  ************  \                      /  ************  \
   --------------------                    --------------------

[i] Commands: telnet, ssh
```

## Commands

* `telnet` - Connect to TCP server.

```entysec
[hsf3]> telnet 127.0.0.1 8888
Connected to 127.0.0.1!
```

* `ssh` - Connect to SSH server.

```entysec
[hsf3]> ssh felix@127.0.0.1 22
felix@127.0.0.1's password: **********
Last login: Mon Sep 30 01:06:12 2024
felix@Felixs-MacBook-Air ~ %
```
