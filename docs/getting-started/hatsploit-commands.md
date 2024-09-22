---
layout: default
title: HatSploit Commands
parent: Getting started
nav_order: 3
---

```msf
msf6 exploit(windows/smb/ms17_010_eternalblue) > advanced

Module advanced options (exploit/windows/smb/ms17_010_eternalblue):

   Name                    Current Setting                     Required  Description
   ----                    ---------------                     --------  -----------
   CHOST                                                       no        The local client address
   CPORT                                                       no        The local client port
   CheckModule             auxiliary/scanner/smb/smb_ms17_010  yes       Module to check with
   ConnectTimeout          10                                  yes       Maximum number of seconds to establish a TCP connection
   ... etc ...

Payload advanced options (windows/x64/meterpreter/reverse_tcp):

   Name                         Current Setting  Required  Description
   ----                         ---------------  --------  -----------
   AutoLoadStdapi               true             yes       Automatically load the Stdapi extension
   AutoRunScript                                 no        A script to run automatically on session creation.
   AutoSystemInfo               true             yes       Automatically capture system information on
   ... etc ...
```

This is a HatSploit interface commands reference. Here you can find all commands, their usages and syntax.

* [Core Commands](#Core-Commands)
* [Database Commands](#Database-Commands)
* [Developer Commands](#Developer-Commands)
* [Jobs Commands](#Jobs-Commands)
* [Module Commands](#Module-Commands)
* [Plugin Commands](#Plugin-Commands)
* [Sessions Commands](#Sessions-Commands)

## Core Commands

[`clear`](#clear) | [`exit`](#exit) | [`help`](#help) | [`search`](#search) | [`show`](#show)

### `clear`

Clear terminal window.

```
Usage: clear
```

### `exit`

Exit HatSploit Framework.

```
Usage: exit [option]

  -h, --help   Show this help message.
  -f, --force  Force exit, ignoring active jobs.
```

### `help`

Show available commands.

```
Usage: help
```

### `search`

Search payloads, modules and plugins.

```
Usage: search [option] [<keyword>]

  -w, --where [payloads|modules|plugins]  Select where search.
```

## Database Commands

[`module_db`](#module_db) | [`payload_db`](#payload_db) | [`plugin_db`](#plugin_db)

### `module_db`

Manage module databases.

```
Usage: module_db <option> [arguments]

  -l, --list                        List all connected module databases.
  -d, --disconnect <name>           Disconnect specified module database.
  -c, --connect <name> <path>       Connect new module database.
  -b, --build <path> <output_path>  Build module database from modules path.
```

### `payload_db`

Manage payload databases.

```
Usage: payload_db <option> [arguments]

  -l, --list                        List all connected payload databases.
  -d, --disconnect <name>           Disconnect specified payload database.
  -c, --connect <name> <path>       Connect new payload database.
  -b, --build <path> <output_path>  Build payload database from payloads path.
```

### `plugin_db`

Manage plugin databases.

```
Usage: plugin_db <option> [arguments]

  -l, --list                        List all connected plugin databases.
  -d, --disconnect <name>           Disconnect specified plugin database.
  -c, --connect <name> <path>       Connect new plugin database.
  -b, --build <path> <output_path>  Build plugin database from plugins path.
```
