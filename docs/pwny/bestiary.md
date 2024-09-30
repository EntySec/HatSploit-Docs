---
layout: default
title: Command Bestiary
parent: Pwny
nav_order: 3
---

* [Core Commands](#Core-Commands)
* [Evasion Commands](#Evasion-Commands)
* [Filesystem Commands](#Filesystem-Commands)
* [Gather Commands](#Gather-Commands)
* [Local Commands](#Local-Commands)
* [Manage Commands](#Manage-Commands)
* [Pivot Commands](#Pivot-Commands)

## Core Commands

[`clear`](#clear) | [`env`](#env) | [`exec`](#exec) | [`exit`](#exit) | [`help`](#help) | [`load`](#load) | [`plugins`](#plugins) | [`prompt`](#prompt) | [`quit`](#quit) | [`set`](#set) | [`unload`](#unload) | [`unset`](#unset)

### `clear`

* Clear terminal window

Simply clear terminal window and delete all previous output.

### `env`

* List environment variables

Lists environment variables **inside Pwny console**. Read more about console and environment [here](/docs/pwny/console).

### `exec`

* Execute path

Executes argument as it is a path on target system. If it is a file, then load it to primary memory and display result.

### `exit`

* Exit Pwny and terminate connection

Closes (terminates) current connection and exits the console. If you want to just exit, without terminating connection use [`quit`](#quit).

### `help`

* Show all available commands

Display all commands that are available in the console. Result of this command may vary depending on what system Pwny is running on and console configuration.

### `load`

* Load plugin by name

Loads plugin with name specified as an argument.

### `plugins`

* Show available plugins

Display all plugins that are available in the console. Result of this command may vary depending on what system Pwny is running on and console configuration.

### `prompt`

* Set current prompt line

Changes prompt message. Argument might be a string with embedded ColorScript syntax.

### `quit`

* Exit console

Exit console without terminating connection.

### `set`

* Set environment variable

Set variable value within console environment.

### `unload`

* Unload plugin by name

Unload plugin with name specified as an argument.

### `unset`

* Delete environment variable

Delete variable within console environment.