---
layout: default
title: Ngrok
parent: Plugins
nav_order: 2
---

Ngrok plugin provides an interface to manage ngrok forwarding rules from HatSploit console.

## Usage

```hsf
[hsf3]> load ngrok

                             __
     ____  ____ __________  / /__
    / __ \/ __ `/ ___/ __ \/ //_/
   / / / / /_/ / /  / /_/ / ,<
  /_/ /_/\__, /_/   \____/_/|_|
        /____/

[i] Use ngrok to invoke ngrok.
```

## Commands

* `ngrok` - Manage ngrok service.

```hsf
[hsf3]> ngrok
usage: ngrok [-h] [-l] [-o PORT] [-c ID] [-a TOKEN]

Manage ngrok service.

options:
  -h, --help            show this help message and exit
  -l, --list            List all active tunnels.
  -o PORT, --open PORT  Open tunnel for specified port.
  -c ID, --close ID     Close active tunnel by ID.
  -a TOKEN, --auth TOKEN
                        Authenticate ngrok API by token.
[hsf3]> ngrok -o 8888
[*] Opening tunnel for port 8888...
[+] Tunnel opened (127.0.0.1:8888 -> 4.tcp.eu.ngrok.io:17333)!
[hsf3]> ngrok -l

Active Tunnels:

    ID    Connection
    --    ----------
    0     127.0.0.1:8888 -> 4.tcp.eu.ngrok.io:17333

[hsf3]>
```