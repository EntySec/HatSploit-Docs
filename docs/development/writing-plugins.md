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

        self.commands = [
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
        ]

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

## Adding commands

The main purpose of plugin is to bring new commands to the standard command-line interface. Command can be created using `Command` object. To get it, put this line of code before plugin class.

```python
from badges.cmd import Command
```

Command object is highly configurable and can be used to create simple commands that only take inline arguments or more complex flag-driven commands.

| Value    | Description | Required |
|----------|-------------|----------|
| **Name** | Command name and the name of the method that contains the executable code for this command. | Yes |
| **Description** | Command decription that is displayed when `help` is invoked. | Yes |
| **MinArgs** | Minimum arguments that command takes, if user types less arguments than this number, error or help banner will be displayed. | No |
| **Usage** | Usage (help banner) that is displayed if user provided arguments less than **MinArgs** number. (will be ignored if **Options** used) | No |
| **Options** | Enables the use of flags for command and contains information about flags. (read below) | No |
| **Examples** | List containing examples of usage. | No |
| **Shorts** | Dictionary that contains command shortcuts as keys and list of command that replaces shortcut and shortcut description. (read below) | No |

**Options** attribute:

{: .note }
**Options** attribute should be added to a command if use of flags is relevant

As its value this attribute has a list of tuples in which first value is a tuple that defines the flag and the second value is a dict with flag attributes. Look at the example below:

```python
Command({
    'Name': 'sample',
    'Description': 'Sample command.',
    'Options': [
        (
            ('-o', '--option'),
            {
                'help': "Sample flag with long and short name.",
            },
            ('-O',),
            {
                'help': "Sample flag with only short name."
            }
        )
    ]
})
```

{: .note }
Flag attributes are used to determine the purpose and information of the flag including its data type, description or whether it takes an argument or just stores `True` or `False` values.

| Name       | Description |
|------------|-------------|
| **action** | The basic type of action to be taken when this argument is encountered at the command line. |
| **nargs** |The number of command-line arguments that should be consumed. |
| **const** | A constant value required by some action and nargs selections. |
| **default** | The value produced if the argument is absent from the command line and if it is absent from the namespace object. |
| **type** | The type to which the command-line argument should be converted. |
| **choices** | A sequence of the allowable values for the argument. |
| **required** | Whether or not the command-line option may be omitted (optionals only).
| **help** | A brief description of what the argument does. |
| **metavar** | A name for the argument in usage messages. |
| **dest** | The name of the attribute to be added to the object returned by parse_args(). |
| **deprecated** | Whether or not use of the argument is deprecated. |

Command body or command executable code should be stored in the plugin method of the same name as the command. It should take single argument - **args**. Depending on what command this is, the data type of **args** can be either list (if command is inline, so command name is **args[0]**, first argument is **args[1]** and etc.) or class that contains flags as its methods. For example, if you have a command that has a flag `--string`, then command method will receive **args** that has **args.string** for this flag.

{: .note}
> Command method should have the exact same name as a command. So if you have `sample` in your command's **Name** then plugin method containing command executable code should be named `sample`.
>
> ```python
> def sample(self, args):
>     ...
> ```
>

**Shorts** attribute:

{: .note }
**Shorts** attribute should be added to a command if use of flags is relevant

## Examples and Best Practices

If you are new to writing plugins for HatSploit, it is highly recommended that you review existing plugins in the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/plugins). These existing plugins can serve as valuable references for understanding the structure and functionality of plugins within the framework.

We encourage you to explore these resources and learn from them before developing new plugins. This practice will help you follow consistent patterns and ensure the best integration with HatSploit's functionality.
