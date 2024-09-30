---
layout: default
title: Using HatSploit
parent: Getting started
nav_order: 2
---

So, the main question is - How to start working with HatSploit? We have an answer, this guide is for learning how to use HatSploit.

## First Run

First, you need to run HatSploit, for this, open your terminal and type `hsf`. After this, you will see the terms of service message, accept it, and continue.

```hsf
[?] Accept HatSploit Framework Terms of Service? [y/n]
```

After this, HatSploit will ask you to build base databases, this means that HatSploit will load all modules, plugins, and payloads and will save them to the base database.

```hsf
[?] Do you want to build and connect base databases? [y/n]
```

After all these setup steps completed, the main HatSploit interface appears.

```
                     ___________
                    < HatSploit >
                     -----------
                .''    /
      ._.-.___.' (`\  /
     //(        ( `'
    '/ )\ ).__. )
    ' <' `\ ._/'\
       `   \     \

    --=[ HatSploit Framework 3.0.0 unfulf1ll3d (https://hatsploit.com)
--==--=[ Developed by EntySec (https://entysec.com)
    --=[ 55 modules | 60 payloads | 2 encoders | 3 plugins

HatSploit Tip: You can run module in background, just use run -j

[hsf3]>
```

## Using Commands

HatSploit has various commands for interacting with its function, you can type `help` or `?` for getting a list of these commands. After doing this, you will see a description for each of them.

```
Core Commands:

    Command    Description
    -------    -----------
    clear      Clear terminal window.
    exit       Exit console.
    help       Show all available commands.
    quit       Exit console.
    exit       Exit HatSploit Framework.

... snip ...   
```

## Using Run Options

Run options are options that you can select on startup via command-line arguments.

```
usage: hsf [-h] [-c] [--check-modules] [--check-payloads] [--check-encoders]
           [--check-plugins] [--rpc] [--host HOST] [--port PORT] [-u]
           [-s SCRIPT] [--no-exit] [--no-startup]

Modular penetration testing platform that enables you to write, test, and
execute exploit code.

options:
  -h, --help            show this help message and exit
  -c, --check           Check base modules, payloads, encoders and plugins.
  --check-modules       Check only base modules.
  --check-payloads      Check only base payloads.
  --check-encoders      Check only base encoders.
  --check-plugins       Check only base plugins.
  --rpc                 Start HatSploit RPC server.
  --host HOST           HatSploit RPC server host. [default: 127.0.0.1]
  --port PORT           HatSploit RPC server port. [default: 5000]
  -u, --update          Update HatSploit Framework.
  -s SCRIPT, --script SCRIPT
                        Execute HatSploit commands from script file.
  --no-exit             Do not exit after script execution.
  --no-startup          Do not execute startup.hsf file.
```

## HatSploit Startup file

HatSploit startup file contains all commands that should be executed on startup. It is placed in the HatSploit workplace - `~/.hsf/startup.hsf`.
