---
layout: default
title: SSH Kit
parent: Kits
nav_order: 1
---

## Usage

```python
from hatsploit.lib.module.basic import *
from hatsploit.lib.module.ssh import SSH

class HatSploitModule(Module, SSH):
    ...
```

## Options

* `timeout` - `IntegerOption(10, "Connection timeout.", False)`
* `host` - `IPv4Option(None, "SSH host.", True)`
* `port` - `PortOption(22, "SSH port.", True)`
* `username` - `Option(None, "SSH username.", True)`
* `password` - `Option(None, "SSH password.", True)`

## Methods

* `self.open_ssh()` - create SSH client - returns SSH client

## Example

```python
client = self.open_ssh()
client.connect()

output = client.send_command("whoami")

client.disconnect()
```