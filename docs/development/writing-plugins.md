---
layout: default
title: Writing Plugins
parent: Development
nav_order: 2
---

# Writing Plugins for HatSploit

Plugins in HatSploit are designed to extend the basic command list, providing custom functionality that integrates seamlessly with the framework. Once you have determined the purpose of your plugin, you can use the following template as a starting point and modify it according to your needs.

```python
""" 
This plugin requires HatSploit: https://hatsploit.com
Current source: https://github.com/EntySec/HatSploit
""" 

from badges.cmd import Command
from hatsploit.lib.core.plugin import Plugin


class HatSploitPlugin(Plugin):
    def __init__(self):
        super().__init__({
            'Name': "",
            'Plugin': "",
            'Authors': [
                'Your name (your nickname) - plugin developer',
            ],
            'Description': "",
        })

        self.commands = {
            Command({
                'Name': 'command',
                'Description': "",
                'MinArgs': 1, # Minimum number of arguments
                'Options': [
                    ( # command options (argparse)
                        ('-o', '--option'),
                        {
                            'help': "",
                            'type': int
                        }
                    ),
                    # other command options
                ]
            })
        }

    # command body, name of method should be a name of command
    def command(self, args):
        pass

    # method executed during the loading process
    def load(self):
        pass

    # method executed during the unloading process
    def unload(self):
        pass
```

**Note:** Every plugin should inherit from the `Plugin` class (`hatsploit.lib.plugin`). If this inheritance is missing, the plugin will not be loaded properly by HatSploit.

## Examples and Best Practices

If you are new to writing plugins for HatSploit, it is highly recommended that you review existing plugins in the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/plugins). These existing plugins can serve as valuable references for understanding the structure and functionality of plugins within the framework.

We encourage you to explore these resources and learn from them before developing new plugins. This practice will help you follow consistent patterns and ensure the best integration with HatSploit's functionality.
