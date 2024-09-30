---
layout: default
title: Handler Kit
parent: Kits
nav_order: 2
---

## Usage

**module:**

```python
from hatsploit.lib.module.basic import *

class HatSploitModule(Module, Handler):
    ...
```

**payload:**

```python
from hatsploit.lib.payload.basic import *

class HatSploitPayload(Payload, Handler):
    ...
```

## Options

**module:**

* `payload` - `PayloadOption(None, "Payload to use.", True)`
* `blinder` - `BooleanOption('no', "Start blind command injection.", False)`
* `lhost` - `IPv4Option(TCPTools.get_local_host(), "Local host.", True)`
* `lport` - `PortOption(8888, "Local port.", True)`

**payload:**

* `encoder` - `EncoderOption(None, "Encoder to use.", False)`
* `rhost` - `IPv4Option(TCPTools.get_local_host(), "Remote host.", True)`
* `rport` - `PortOption(8888, "Remote port.", True)`

## Methods

* `self.module_handle(...)` - Handle session for current module and payload.

**required arguments:**

* `sender` - function that takes one argument and is used to exploit the vulnerability and send the payload.

**NOTE:** `sender` is a complete exploit. This function should take command or payload and execute it on target. This function can easily be called an entry point for handler.

**optional arguments:**

* `method` - method to use, to send the payload (e.g. `printf`, `bash_echo`, `echo`, `certutil`, etc.)
* `concat` - concatenation operator (e.g. `&&`)
* `linemax` - maximum characters in the command.
* `location` - if payload is sent to the filesystem, you can specify custom path. (e.g. `/tmp` or `%TEMP%`)
* `background` - background operator (e.g. `&`)
* `on_session` - function that takes no arguments and executed right after session was opened.

## Example

This example below is a part of module, which exploits RCE vulnerability and passes the exploit to handler.

```python
...

def exploit(self, command):
    ...

def run(self):
    self.module_handle(
        sender=self.exploit,
    )
```

After this, if exploit works, session should be opened.