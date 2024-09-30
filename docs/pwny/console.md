---
layout: default
title: Console
parent: Pwny
nav_order: 2
---

Pwny is equipped with powerful console that provides an extensive interface for interacting with payload. Console is different for each system due to that different systems support different commands and plugins. To inspect the list of available commands simply type `help`.

```hsf
Pwny interactive shell v1.0.0
Running as felix on /Users/felix

pwny:/Users/felix felix$ help

Core Commands:

    Command    Description
    -------    -----------
    clear      Clear terminal window.
    env        List environment variables.
    exec       Execute path.
    exit       Exit Pwny and terminate connection.
    help       Show all available commands.
    load       Load plugin by name.
    plugins    Show available plugins.
    prompt     Set current prompt line.
    quit       Exit console.
    set        Set environment variable.
    unload     Unload plugin by name.
    unset      Delete environment variable.

... snip ...
```

## Information gathering

The most basic thing that you can do with Pwny is collect information about system and hardware this system is running on. Console displays it in pretty format (neofetch-like style) if used with `sysinfo` command.

```hsf
pwny:/Users/felix felix$ sysinfo

         .:'          Name: macOS
     __ :'__        Kernel: 11.7.3
  .'`  `-'  ``.       Time: 2024-05-03 22:33:51 IST (UTC+0100)
 :          .-'     Vendor: Apple
 :         :          Arch: arm64
  :         `-;     Memory: 14.23 GB/16.0 GB
   `.__.-.__.'        UUID: 7b22d2ad-8b8d-496c-b163-f265f35253e1

pwny:/Users/felix felix$ 
```

## Encrypted negotiation

It's up to you to decide if you want to communicate with target device without encryption. However, worth mentioning that in case of absense of encryption, all commands can be viewed through network analyzers (like WireShark).

You can establish or re-establish secure communication manually using `secure` command or disable it at any time by typing `unsecure`.

```hsf
pwny:/Users/felix felix$ secure
[*] Generating RSA keys...
[*] Exchanging RSA keys for TLS...
[+] RSA keys exchange success!
[+] Communication secured with TLS! 
```

## Pretty output

If there is a huge amount of data to be printed to the screen, Pwny console displays it in less-like format to fit all the data:

```hsf
pwny:/Users/felix felix$ ps

Process List:

    PID      CPU      Name                Path
    ---      ---      ----                ----
    1        arm64    launchd
    73       arm64    syslogd
    74       arm64    UserEventAgent
    76       arm64    uninstalld
    77       arm64    fseventsd
    79       arm64    mediaremoted
    84       arm64    systemstats
    86       arm64    configd
    87       arm64    endpointsecurity
Press Enter for more, or 'q' to quit:
```

## Auto-completion

Pwny console supports auto-completion. If you type `li` instead of `list` it will complete it for you.

```hsf
pwny:/Users/felix felix$ li

Listing: .:

    Mode         Size         Type         Modified               Name
    ----         ----         ----         --------               ----
    r--------    7.00 B       file         2023-01-28 15:19:51    .CFUserTextEncoding
    rw-------    1.16 KB      file         2024-02-06 01:18:13    .sqlite_history
    rw-------    12.00 B      file         2024-02-24 15:04:39    important.txt
```

However, if you spell some command wrongly and auto-completion won't be able to select the appropriate command, it would suggest you the command.

```hsf
pwny:/Users/felix felix$ ca
[!] Did you mean? cam, cat
[-] Failed to spawn process for ca!
[-] Unrecognized command: ca!
```

## Binaries

Pwny console supports execution of system-wide binaries (i.e. binaries in `PATH`) as shown below.

```hsf
pwny:/Users/felix felix$ ls /
Applications
Library
System
Users
Volumes
bin
cores
dev
etc
home
opt
private
sbin
tmp
usr
var
```

## Shell fallback

Want to go back to basic reverse shell? No a problem, Pwny allows you to drop into basic shell.

```hsf
pwny:/Users/felix felix$ bash
pwd
/Users/felix
whoami
felix
exit
```

## Shortcuts

Type path straight into Pwny console and it will decide: change to the path if it's a directory or execute path if it's an executable.

```hsf
pwny:/Users/felix felix$ /bin/df
Filesystem     512-blocks      Used Available Capacity iused      ifree %iused  Mounted on
/dev/disk3s3s1  965595304  40074232 168331776    20%  553779 4827422741    0%   /
pwny:/Users/felix felix$ /
pwny:/ felix$ pwd
/
```

Prepending `!` to command executes shell command locally.

## Environment

Pwny console has its own environment, meaning that setting specific environment variables might affect some features. You can list all environment variables with `env` command.

```hsf
pwny:/ felix$ env

Environment Variables:

    Name    Value
    ----    -----
    PATH    /opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

### Verbose mode

If you want to see all the packets that were sent and received, you can enable `VERBOSE` variable.

```hsf
pwny:/ felix$ set verbose on
[i] Sent TLV packet (12 bytes, 1 objects)
[i] 00000000  b9 0b 00 00 04 00 00 00  db 59 00 00             |.........Y..    |
[i] Read TLV packet (21 bytes, 2 objects)
[i] 00000000  e3 2e 00 00 01 00 00 00  2f ba 0b 00 00 04 00 00 |......../.......|
[i] 00000010  00 01 00 00 00                                   |.....           |
[i] Sent TLV packet (12 bytes, 1 objects)
[i] 00000000  b9 0b 00 00 04 00 00 00  0f 52 00 00             |.........R..    |
[i] Read TLV packet (25 bytes, 2 objects)
[i] 00000000  0c 00 00 00 05 00 00 00  66 65 6c 69 78 ba 0b 00 |........felix...|
[i] 00000010  00 04 00 00 00 01 00 00  00                      |.........       |
[i] Sent TLV packet (12 bytes, 1 objects)
[i] 00000000  b9 0b 00 00 04 00 00 00  0f 52 00 00             |.........R..    |
[i] Read TLV packet (25 bytes, 2 objects)
[i] 00000000  0c 00 00 00 05 00 00 00  66 65 6c 69 78 ba 0b 00 |........felix...|
[i] 00000010  00 04 00 00 00 01 00 00  00                      |.........       |
```
