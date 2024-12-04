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
An argument for `use` command can be an index as mentioned above. 
This index can be obtained for the table produced by `search` or any other command that retrieves module list.

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
    host                 yes         HTTP host.
    port        80       yes         HTTP port.
    ssl         no       no          Use SSL.
    timeout     10       no          Connection timeout.
    username    admin    yes         Default username.

[hsf7: exploit: RomPager Multi Password Disclosure]> set host 192.168.1.56
[i] host => 192.168.1.56
```

In order to display module devices (systems/devices that are affected by this particular module) use `show devices` or `devices`.

```entysec
[hsf3: RomPager Multi Password Disclosure]> devices

Devices (exploit/linux/rompager/multi_password_disclosure):

    ID    Name
    0     AirLive WT-2000ARM (2.11.6.0(RE0.C29)3.7.6.1)
    1     D-Link DSL-2520U (1.08 Hardware Version: B1)
    2     D-Link DSL-2640R
    3     D-Link DSL-2740R (EU_1.13 Hardware Version: A1)
    4     Huawei 520 HG
    5     Huawei 530 TRA
    6     Pentagram Cerberus P 6331-42
    7     TP-Link TD-8816
    8     TP-Link TD-8817 (3.0.1 Build 110402 Rel.02846)
    9     TP-LINK TD-8840T (3.0.0 Build 101208 Rel.36427)
    10    TP-Link TD-W8901G
    11    TP-Link TD-W8951ND
    12    TP-Link TD-W8961ND
    13    ZTE ZXV10 W300 (W300V1.0.0a_ZRD_CO3)
    14    ZTE ZXDSL 831CII (ZXDSL 831CIIV2.2.1a_Z43_MD)
    15    ZynOS
    16    ZyXEL ES-2024
    17    ZyXEL Prestige P-2602HW
    18    ZyXEL Prestige 782R
```

{: .note }
`show targets` or `targets` command can be invoked to display different module configurations for each target. In case of this example, there is no custom configurations, 
however some modules might have them. To select specific configuration use `target <id>` where `id` is the ID of configuration.

{: .note }
You may use `*` that displays information, options and advanced options, devices and targets all at once.

After all the configuration steps are completed, module can be executed by `run` command.

```entysec
[hsf7: exploit: RomPager Multi Password Disclosure]> run
 
 
Credentials:
 
    Username    Password
    admin       admin
 
[+] Exploit module completed!
```

{: .note }
There are different variations of `run` command. For example: `exploit`, `start` and `execute` - they are all just shortcuts.

{: .note }
If you want to run module as a background job while switching to the next task, use `run -j`. In you want module to execute in loop, use `run -l`.

## Developing the module

If you want to contribute and develop your own module, you might find this guide useful - [Writing Modules](/docs/development/writing-modules)