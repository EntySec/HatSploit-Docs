---
layout: default
title: Writing modules
parent: Development
nav_order: 3
---

After deciding what your module should do, take this template and edit it for your needs.

## Template

```python
"""
This module requires HatSploit: https://hatsploit.com
Current source: https://github.com/EntySec/HatSploit
"""

from hatsploit.lib.module.basic import *


class HatSploitModule(Module):
    def __init__(self):
        super().__init__()

        self.details.update({
            'Category': "category",
            'Name': "full name",
            'Module': "name",
            'Authors': [
                'Your name (your nickname) - module developer',
            ],
            'Description': "description.",
            'Platform': Platform,
            'Rank': "rank level",
            'Payload': {
                'Value': "default payload",
                'Platforms': [Platform, Platform, ...],
                'Arches': [Arch, Arch, ...],
                'Types': ['type 1', 'type 2', ...]
            }
        })

    def run(self):
        pass
```

**NOTE:** All modules should inherit from `Module`, otherwise module won't be imported.

Let's go through all the necessary methods:

* `self.details` - Is a dictionary containing all necessary information (`Full name`, `name`, `description`, `authors`, etc.)
* `self.run()` - Method, which is called on `run`.

### Module platform (`Platform`)

For now, HatSploit does accept these platforms:

* Platforms: OS_LINUX, OS_MACOS, OS_ANDROID, OS_WINDOWS, OS_IPHONE, OS_UNIX.

### Module rank (`Rank`)

Module rank is an approximate level of risk that can be caused by the module. These levels can be set for the module:

* `low` - No serious impact at all or a low impact.
  * e.g. scanners, auxiliary modules
* `medium` - Medium impact.
  * e.g. path traversal, LFI, aggressive scanners
* `high` - High impact.
  * e.g. RCE, command injection, DoS exploits

### Module payload (`Payload`)

A default payload or a compatible payload that can be used with the module. If no default payload provided, user will be prompted to select one.
Only payloads that have platforms, architectures and types same as ones that are selected in the `Payload` will be valid.

This field should be used in modules, that are exploit RCE flaws for example.

**NOTE:** This field is optional, you can omit it.

### Module commands

You can easily add commands to the HatSploit interface from the module.

```python
self.commands = {
    'command1': {
        'Description': "description",
        'Usage': "command1",
        'MinArgs': 0,
    },
    'command2': {
        'Description': "description",
        'Usage': "command2",
        'MinArgs': 0,
    },
}
```

* `Description` - Command description.
* `Usage` - Usage which is displayed if `MinArgs` condition is not achieved.
* `MinArgs` - Minimum necessary arguments. (e.g. if your command requires one mandatory argument, then `MinArgs` should be `1`)

**NOTE:** If your command has specific list of arguments that should be displayed if `MinArgs` condition is not achieved, add `Options` like this:

```python
'Options': {
    '-e': ['<arg>', 'Example'],
}
```

Moreover, commands are implemented within methods which have the same names as their commands from `self.commands`. For example (for previous dictionary):

```python
def command1(self, argc, argv):
    ... snip ...

def command2(self, argc, argv):
    ... snip ...
```

* `argc` - Number or arguments. (including command name)
* `argv` - List of arguments. (including command name, which is `argv[0]`)

### Module options

You can add options to the module, read about them [here](/docs/development/options).

## Examples

You can always refer to the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/modules) which contains some modules and rely on them.
We will be glad if you first explore already existing modules before writing new ones.