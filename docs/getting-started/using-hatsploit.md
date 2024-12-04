---
layout: default  
title: Using HatSploit  
parent: Getting started  
nav_order: 2
---

The key question many ask is: **How do you start working with HatSploit?** This guide aims to provide a comprehensive overview of how to begin using the HatSploit Framework effectively.

## Initial launch

To get started with HatSploit, the first step is to launch the framework. Open your terminal and execute the following command:

```bash
hsf
```

Once this command is run, you will be prompted with a message to accept the terms of service. You need to confirm your agreement to proceed further.

```entysec
[?] Accept HatSploit Framework Terms of Service? [y/n]
```

After accepting the terms, HatSploit will ask whether you'd like to build and connect its base databases. This process involves loading all the framework’s essential modules, plugins, and payloads, and saving them to the database for faster access.

```entysec
[?] Do you want to build and connect base databases? [y/n]
```

Once these initial setup steps are completed, the main HatSploit interface will be presented:

```entysec
                     ___________
                    < HatSploit >
                     -----------
                .''    /
      ._.-.___.' (`\  /
     //(        ( `'
    '/ )\ ).__. )
    ' <' `\ ._/'       `   \     
    --=[ HatSploit Framework 3.0.0 unfulf1ll3d (https://hatsploit.com)
--==--=[ Developed by EntySec (https://entysec.com)
    --=[ 55 modules | 60 payloads | 2 encoders | 3 plugins

HatSploit Tip: You can run a module in the background by using `run -j`.

[hsf3]>
```

## Executing commands

HatSploit offers a variety of commands that allow you to interact with its functionality. To see a list of all available commands, you can simply type `help` or `?`. This will provide you with a list of commands alongside a description of their purpose.

```entysec
[hsf3]> help

Core Commands:

    Command    Description
    clear      Clear terminal window.
    exit       Exit console.
    help       Show all available commands.
    quit       Exit console.
    source     Execute specific file as source.
    exit       Exit HatSploit Framework.
    search     Search payloads, modules and plugins.


Developer Commands:

    Command    Description
    pyshell    Open Python shell.
    repeat     Repeat specified command.
    sleep      Sleep for specified seconds.


Encoder Commands:

    Command     Description
    encoders    Show available encoders.
Press Enter for more, 'a' for all, 'q' to quit:
```

Each command is designed to assist you in navigating through the framework's features with ease. Familiarizing yourself with these commands will significantly enhance your user experience.

## Interface built-ins

Built-ins are created to enchance interface and provide shorter and simplier ways to perform frequent tasks (e.g. clear terminal window, display available commands, execute 
source file, etc.)

* `#` - NOP (no operation), do nothing, can be used for comments in scripts.

```entysec
[hsf3]> # nothing has happened
```

* `?` - Shortcut for `help` command, displays all available interface commands.

```entysec
[hsf3]> ?

Core Commands:

    Command    Description
    clear      Clear terminal window.
    exit       Exit console.
    help       Show all available commands.
    quit       Exit console.
    source     Execute specific file as source.
    exit       Exit HatSploit Framework.
    search     Search payloads, modules and plugins.


Developer Commands:

    Command    Description
    pyshell    Open Python shell.
    repeat     Repeat specified command.
    sleep      Sleep for specified seconds.


Encoder Commands:

    Command     Description
    encoders    Show available encoders.
Press Enter for more, 'a' for all, 'q' to quit:
```

* `@` - Clears terminal window.

* `!` - Executes system command or sequence of commands.

```entysec
[hsf3]> !pwd
[*] Executing system command: pwd

/Users/felix
```

* `:` - Execute file as source file or sequence of interface commands.

```entysec
[hsf3]> :source.cmd
[hsf3]> :
: help
: modules
: encoders
```

* `.` - Exits command-line interface.

* `*` - If used inside module, displays module information, targets, options and advanced options.

```entysec
[hsf3: D-Link hedwig Remote Code Execution]> *

    Name: D-Link hedwig Remote Code Execution
  Module: exploit/linux/dlink/hedwig_code_execution
Platform: linux
    Rank: high

Authors:
  Ivan Nikolskiy (enty8080) - module developer
  Roberto Paleari - vulnerability researcher

Description:
  Remote Code Execution in D-Link DIR-645 <= 1.03, DIR-300 <= 2.14,
  DIR-600.

References:
  URL: https://www.exploit-db.com/exploits/27283
  URL: https://nvd.nist.gov/vuln/detail/CVE-2013-7389
  CVE: 2013-7389
  EDB: 27283

Devices:
  D-Link DIR-645 v1.03
  D-Link DIR-300 v2.14
  D-Link DIR-600

Press Enter for more, 'a' for all, 'q' to quit:
```

## Startup options

HatSploit provides several run options that can be selected via command-line arguments at startup. These options allow you to customize the execution of the framework according to your needs.

```
usage: hsf [-h] [-c] [--check-modules] [--check-payloads] [--check-encoders]
           [--check-plugins] [--rpc] [--host HOST] [--port PORT] [-u]
           [-s SCRIPT] [--no-exit] [--no-startup]

Modular penetration testing platform that enables you to write, test, and
execute exploit code.

Options:
  -h, --help            Show this help message and exit.
  -c, --check           Check base modules, payloads, encoders, and plugins.
  --check-modules       Check only base modules.
  --check-payloads      Check only base payloads.
  --check-encoders      Check only base encoders.
  --check-plugins       Check only base plugins.
  --rpc                 Start HatSploit RPC server.
  --host HOST           Specify HatSploit RPC server host. [Default: 127.0.0.1]
  --port PORT           Specify HatSploit RPC server port. [Default: 5000]
  -u, --update          Update HatSploit Framework.
  -s SCRIPT, --script SCRIPT
                        Execute HatSploit commands from a script file.
  --no-exit             Do not exit after script execution.
  --no-startup          Do not execute the startup.hsf file on startup.
```

These command-line options provide a more advanced and flexible way to interact with HatSploit, especially when automating tasks or managing multiple instances.

## HatSploit startup file

The HatSploit startup file is a crucial feature for automating repetitive tasks. It contains all the commands that should be executed automatically on startup. This file is stored in the HatSploit workspace at:

```
~/.hsf/startup.hsf
```

By configuring this file, you can streamline your workflow by predefining certain actions to be executed every time HatSploit is launched.
