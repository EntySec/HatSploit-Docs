---
layout: default
title: Writing plugins
parent: Development
nav_order: 1
---

Plugins are intended to extend the basic HatSploit command list. It is pretty easy to write your first plugin. Before writing the plugin, answer these questions:

* Why am I writing this plugin?
* What should this plugin do?
* Will people use it?

After deciding what your plugin should do, take this template and edit it for your needs.

```python
"""
This plugin requires HatSploit: https://hatsploit.com
Current source: https://github.com/EntySec/HatSploit
"""

from hatsploit.lib.plugin import Plugin


class HatSploitPlugin(Plugin):
    def __init__(self):
        super().__init__()

        self.details.update({
            'Name': "full name",
            'Plugin': "name",
            'Authors': [
                'Your name (your nickname) - plugin developer',
            ],
            'Description': "description.",
        })

        self.commands = {
            'category': {
                'command': {
                    'Description': "description",
                    'Usage': "command",
                    'MinArgs': 0,
                }
            }
        }

    def command(self, argc, argv):
        pass

    def load(self):
        pass

    def unload(self):
        pass
```

**NOTE:** All plugins should inherit from `Plugin` (`hatsploit.lib.plugin`), otherwise plugin won't be loaded.

Lets go through all the necessary methods:

* `self.details` - Is a dictionary containing all necessary information (`Full name`, `name`, `description`, `authors`, etc.)
* `self.commands` - Is a dictionary that contains all categories and commands implemented by the plugin.
* `self.load()` - Method, which is called when plugin is being loaded.
* `self.unload()` - Method, which is called when plugin is being unloaded.
* `self.command()` - Method, which contains code of `command` specified in the `self.commands`.

Acknowledge that `self.commands` contains category and then the list of commands that belong to this category. For example:

```python
self.commands = {
    'My Category': {
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
}
```

* `Description` - Command description.
* `Usage` - Usage which is displayed if `MinArgs` condition is not achieved.
* `MinArgs` - Minimum necessary arguments. (e.g. if your command requires one mandatory argument, then `MinArgs` should be `1`)

**NOTE:** If your command has specific list of arguments thay should be displayed if `MinArgs` condition is not achieved, add `Options` like this:

```
'Options': {
    '-e': ['<arg>', 'Example'],
}
```

Moreover, commands are implemented within methods which have the same names as their commands from `self.commands`. For example (for previous dictionary):

```
def command1(self, argc, argv):
    ... snip ...

def command2(self, argc, argv):
    ... snip ...
```

* `argc` - Number or arguments. (including command name)
* `argv` - List of arguments. (including command name, which is `argv[0]`)
