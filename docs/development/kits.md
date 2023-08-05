---
layout: default
title: Kits
parent: Development
nav_order: 5
---

Kits are packages that help to extend module's functionality. Sometimes, there are some cases, when we need a TCP connection with the target and to avoid writing TCP client by yourself, you can use a kit.

There are different kits available in the HatSploit Framework, you can read about them in the Kits section.

## Usage

To use a kit, you simple need to include it from the `hatsploit.lib.module`.

After importing a kit, you need to inherit the module from it, so it will be active.

Here is an example of the module that utilizes SSH:

```python
from hatsploit.lib.module.basic import *
from hatsploit.lib.module.proto import SSH

class HatSploitModule(Module, SSH):
    ... snip ...
```

Kits also declare their options inside the module. For the above example, these options will be declared automatically:

* `timeout` - `IntegerOption(10, "Connection timeout.", False)`
* `host` - `IPv4Option(None, "SSH host.", True)`
* `port` - `PortOption(22, "SSH port.", True)`
* `username` - `Option(None, "SSH username.", True)`
* `password` - `Option(None, "SSH password.", True)`

So, after inheriting from this kit, you won't need to declare them by yourself.

Read more about options in the options section.