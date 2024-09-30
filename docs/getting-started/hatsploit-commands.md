---
layout: default
title: HatSploit Commands
parent: Getting started
nav_order: 3
---

This is a HatSploit interface commands reference. Here you can find all commands, their usages and syntax.

* [Core Commands](#Core-Commands)
* [Database Commands](#Database-Commands)
* [Developer Commands](#Developer-Commands)
* [Jobs Commands](#Jobs-Commands)
* [Module Commands](#Module-Commands)
* [Plugin Commands](#Plugin-Commands)
* [Sessions Commands](#Sessions-Commands)

## Core Commands

[`clear`](#clear) | [`exit`](#exit) | [`help`](#help) | [`quit`](#quit) | [`search`](#search)

### `clear`

* Clear terminal window

Simply clear terminal window and delete all previous output.

### `exit`

* Exit console

Exit console.

### `help`

* Show all available commands

Display all commands that are available in the console. Result of this command may vary depending on what system Pwny is running on and console configuration.

### `quit`

* Exit console

Exit console.

### `search`

* Search payloads, modules and plugins

<details markdown="block">
<summary>Usage</summary>

```
usage: search [-h] [-f FILTER] keyword

Search payloads, modules and plugins.

positional arguments:
  keyword               Keyword to search for.

options:
  -h, --help            show this help message and exit
  -f FILTER, --filter FILTER
                        Filter search result separated by comma (e.g. CVE:2020-12345)
```
</details>