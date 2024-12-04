---
layout: default
title: Writing Modules
parent: Development
nav_order: 3
---

Modules in HatSploit are designed to enchance it with exploits, scanners or post-exploitation scripts. Once you have determined the 
purpose of your modules, you can use the following template as a starting point and modify it according to your needs.

## Template

```python
""" 
This module requires HatSploit: https://hatsploit.com
Current source: https://github.com/EntySec/HatSploit
""" 

from badges.cmd import Command
from hatsploit.lib.core.module import Module


class HatSploitModule(Module):
    def __init__(self):
        super().__init__({
            'Category': "",
            'Name': "",
            'Module': "",
            'Authors': [
                'Your name (your username) - module developer'
            ],
            'Description': """
            """,
            'Targets': {},
            'Platform': Platform,
            'Rank': None,
            'Devices': (
            ),
            'References': [
                {'URL': 'https://example.com/'},
                {'CVE': 'xxxx-xxxxx'},
                {'EDB': 12345}
            ],
            'DisclosureDate': "YY-MM-DD",
            'Notes': {
                'Stability': [],
                'Reliability': [],
                'SideEffects': [],
            },
        })

    def __call__(self):
        """ Code in this function executed when module is used for first time.
        """

        pass

    def run(self):
        """ Module body, code in this function executed when used hits run.
        """

        pass
```

{: .note }
Every module should inherit from the `Module` class (`hatsploit.lib.module`). If this inheritance is missing, the module will not be loaded properly by HatSploit.

### Module category (`Category`)

Module category can be any, but these are recommended:

* *auxiliary* - Module provides scanning functionality and only interacts with the target by scanning it.
* *exploit* - Module provides an exploit for a specific vulnerability and can be used to exploit it and gain any type of access if used with payload or for DoS, information  
  disclosure and any other impact.
* *post* - Module provides a post-exploitation functionality and used when the access to the target system is gained (by exploit module for example).

### Module name (`Name`)

Module name is a full name of module that is displayed in a console prompt. If module has a name of `Nostromo httpd Remote Code Execution` then prompt will look like this:

```entysec
[hsf3: exploit: Nostromo httpd Remote Code Execution]>
```

### Module slug (`Module`)

Module slug is used as an argument to `use` command. It should look like this - `category/platform/product/name` (e.g. 
`exploit/linux/nostromo/remote_code_execution`).

### Module targets (`Targets`)

Module targets are custom configurations that can be specified so that module can be run agains multiple targets without the need to rewrite it for each of them separately. You 
can store any data in target, for example:

```python
{
  'Target 1 full name': {
    'SampleOffset': 123,
    'SamoleText': "Text",
    'SampleCode': b'\xff\x90\xc3',
  },
  'Target 2 full name': {
    'SampleOffset': 456,
    'SamoleText': "Another text",
    'SampleCode': b'\xbb\xaa\xc3',
  }
}
```

This configuration then can be accessed within module by using `self.target`. So if used selects appropriate target then you can get it's `SampleOffset` by using `self.target
['SampleOffset']`. On user side this will look like this:

```entysec
[hsf3: Your module name]> targets

Targets (category/platform/product/your_module):

    Current    ID    Name
    *          0     Target 1 full name
               1     Target 2 full name

[hsf3: Your module name]> target 1
[hsf3: Your module name]> targets

Targets (category/platform/product/your_module):

    Current    ID    Name
               0     Target 1 full name
    *          1     Target 2 full name
```

### Module devices (`Devices`)

This entry specifies a list of vulnerable devices, systems and software versions. For example, in case of `exploit/linux/dlink/hedwig_code_execution` this entry will look like 
this:

```python
[
  "D-Link DIR-645 v1.03",
  "D-Link DIR-300 v2.14",
  "D-Link DIR-600"
]
```

### Module rank (`Rank`)

Module rank is an approximate level of risk that can be caused by the module. These levels can be set for the module:

* `LOW_RANK` - No serious impact at all or a low impact. (e.g. scanners, auxiliary modules)
* `MEDIUM_RANK` - Medium impact. (e.g. path traversal, LFI, aggressive scanners)
* `HIGH_RANK` - High impact. (e.g. RCE, command injection, DoS exploits)

### Module references (`References`)

Module references can include links to resources containing detailed information about module and/or exploit, CVE number, EDB number or any other information from external 
resources that is related to this module.

```python
[
  {'URL': 'https://example.com/'},
  {'CVE': 'xxxx-xxxxx'},
  {'EDB': 12345}
]
```

### Module platform (`Platform`)

For now, HatSploit does accept these platforms:

* `OS_LINUX` - Linux OS
* `OS_MACOS` - macOS (OSX)
* `OS_ANDROID` - Android
* `OS_IPHONE` - iOS (iPhoneOS)
* `OS_UNIX` - Any POSIX-like system (macOS, Linux, iOS, etc.)
* `OS_WINDOWS` - Windows OS

### Module notes (`Notes`)

Module notes include module characteristics which can be `Stability`, `Reliability` and `SideEffects`:

* `Stability` - Module stability, notes if module does crash target in some cases or not. These notes include
  * `CRASH_SAFE` - Module does not crash target.
  * `CRASH_DOWN` - Module might/does crash target.
  * `ACCOUNT_LOCKOUTS` - Module causes account lockout.
* `Reliability` - Module reliability, notes if module spawn reliable sessions or not. These notes include
  * `RELIABLE_SESSION` - Module spawns reliable session.
  * `WEAK_SESSION` - Module spawns weak (unstable) session
* `SideEffects` - Module side effects can be any of these
  * `ARTIFACTS_ON_DISK` - Module leaves artifacts on disk.
  * `IOC_IN_LOGS` - Module produces IOC (identification of compromise) in logs.

### Module payload (`Payload`)

A default payload or a compatible payload that can be used with the module. If no default payload provided, user will be prompted to select one. Only payloads that have platforms, architectures and types same as ones that are selected in the `Payload` will be valid.

{: .note }
This field should be used in modules, that exploit RCE flaws for example. This field is optional, you can omit it if module does not require the use of payload.

`Payload` entry can contain two mixins: 

* `PayloadInlineMixin` - This mixin specifies payloads that can be sent directly to target. For example, if you have a module that exploits OS command injection, then this 
  value should contain all single command payloads. If you have a module that exploits buffer overflow vulnerability then this value should contain all binary payloads 
  (shellcodes, complex C payloads, etc.)
* `PayloadDropMixin` - This mixin can contain any payload that should be uploaded on disk for successful execution.

{: .note }
In HatSploit interface, when module is used, interface decides what default payload to use. In case if module has both mixins configured, module will select `PayloadDropMixin` 
as a default payload because it has higher priority.

Any of these two values should contain payload characteristics. For module that exploits OS command injection in Linux `Payload` will look like this:

```python
{
  PayloadInlineMixin: {
    'Value': "unix/generic/netcat_reverse_tcp",
    'Platform': [OS_LINUX, OS_UNIX],
    'Arch': [ARCH_GENERIC]
  },
  PayloadDropMixin: {
    'Value': "linux/x64/shell_reverse_tcp",
    'Platform': [OS_LINUX]
  }
}
```

{: .note }
Depending on what flaw module exploits mixins might contain different values as mentioned in the description of each of mixins.

Module target (`Target`) can also contain `Payload` entry so that different configurations can contain different payload requirements. For example:

```python
{
  'Target 1 (Linux)': {
    'Payload': {
      PayloadInlineMixin: {
        'Value': 'unix/generic/netcat_reverse_tcp',
        'Platform': [OS_LINUX, OS_UNIX],
        'Arch': [ARCH_GENERIC],
      },
      PayloadDropMixin: {
        'Value': 'linux/x64/shell_reverse_tcp',
        'Platform': [OS_LINUX],
        'Arch': [ARCH_X86, ARCH_X64],
      }
    }
  },
  'Target 2 (Windows)': {
    'Payload': {
      PayloadInlineMixin: {
        'Value': 'windows/generic/powershell_reverse_tcp',
        'Platform': [OS_WINDOWS],
        'Arch': [ARCH_GENERIC],
      },
      PayloadDropMixin: {
        'Value': 'windows/x64/shell_reverse_tcp',
        'Platform': [OS_WINDOWS],
        'Arch': [ARCH_X86, ARCH_X64],
      }
    }
  }
}
```

{: .note }
> If module uses `Payload` then you must add `Handler` to you module for it to work:
>
> ```python
> class HatSploitModule(Module, ..., Handler):
>     ...
> ```

Once you have specified requirements, you then need to use this payload within your module. In most cases you won't need to access payload or send it manually from code, for 
this you should use `Handler`. Read on how to use it here - [Handler](/docs/kits/handler)

### Module options

Read about module options and how to add and use them here - [Options](/docs/development/options)

## Examples and Best Practices

If you are new to writing modules for HatSploit, it is highly recommended that you review existing modules in the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/modules). These existing modules can serve as valuable references for understanding the structure and functionality of modules within the 
framework.

We encourage you to explore these resources and learn from them before developing new modules. This practice will help you follow consistent patterns and ensure the best 
integration with HatSploit's functionality.
