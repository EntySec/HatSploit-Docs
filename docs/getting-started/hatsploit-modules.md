---
layout: default
title: HatSploit Modules
parent: Getting started
nav_order: 5
---

Since HatSploit Framework is built aroung a modular system, all the additional functional including exploits, tools or post-exploitation capabilities are implemented within modules.

There are the categories that are commonly used:

* *Auxiliary* - Module provides scanning functionality and only interacts with the target by scanning it.
* *Exploit* - Module provides an exploit for a specific vulnerability and can be used to exploit it and gain any type of access if used with payload or for DoS, information disclosure and any other impact.
* *Post* - Module provides a post-exploitation functionality and used when the access to the target system is gained (by exploit module for example).

In short, modules can be different. They can scan the target for opened ports, exploit security flaws or spoof the traffic.

## Using the module

To use specific module, just type `use` and provide module name or index as an argument.

```entysec
[hsf3]> use exploit/linux/rompager/multi_password_disclosure
[hsf3: RomPager Multi Password Disclosure]> 
```

{: .note }
An argument for `use` command can be an index as mentioned above. This index can be obtained for the table produced by `search` or any other command that retrieves module list.

When used, module information can be fetched with `info` command. It provides various descriptions, module authors, references and side effects (if specified).

{: .note }
`info` command can also be used with a module name or index as an argument. So in order to obtain module information it is not always required to switch to this module.

```entysec
[hsf3: RomPager Multi Password Disclosure]> info

    Name: RomPager Multi Password Disclosure
  Module: exploit/linux/rompager/multi_password_disclosure
Platform: linux
    Rank: high

Authors:
  Ivan Nikolskiy (enty8080) - module developer

Description:
  Numerious devices using RomPager are vulnerable to
  a password disclosure through extracting it from
  the downloaded rom-0 file.

References:
  URL: https://github.com/EntySec/RomBuster
  URL: https://nvd.nist.gov/vuln/detail/cve-2014-4019
  URL: https://www.exploit-db.com/exploits/33803
  CVE: 2014-4019
  EDB: 33803
```

The module selected as an example is an *exploit* for `RomPager 4.07` server-side software. It attempts to obtain credentials by sending a malicious requiest to the specified target.

Any module can be configured by a set of options that are predefined by a module author. Different modules have different options and they vary from module to module. Module options can be listed with `show options` (or shorter form - `options`) and can be set by `set` command. Module can also include advanced options that are hidden by default. They are optional and typically used only when high level of configuration is requied. These options can be displayed by `show advanced` command.

{: .note }
`unset` command can be invoked to empty the option value.

```entysec
[hsf7: exploit: RomPager Multi Password Disclosure]> options
 
Module Options (exploit/linux/rompager/multi_password_disclosure):
 
    Option      Value    Required    Description
    ------      -----    --------    -----------
    host                 yes         HTTP host.
    port        80       yes         HTTP port.
    ssl         no       no          Use SSL.
    timeout     10       no          Connection timeout.
    username    admin    yes         Default username.

[hsf7: exploit: RomPager Multi Password Disclosure]> set host 192.168.1.56
[i] host => 192.168.1.56
```

After all the configuration steps are completed, module can be executed by `run` command.

```entysec
[hsf7: exploit: RomPager Multi Password Disclosure]> run
 
 
Credentials:
 
    Username    Password
    --------    --------
    admin       admin
 
[+] Exploit module completed!
```

{: .note }
There are different variations of `run` command. For example: `exploit`, `start` and `execute` - they are all just shortcuts.

{: .note }
If you want to run module as a background job while switching to the next task, use `run -j`. In you want module to execute in loop, use `run -l`.

## Developing the module

If you want to contribute and develop your own module, you might find this guide useful - [Writing Modules](/docs/development/writing-modules)