---
layout: default
title: HatSploit Modules
parent: Getting started
nav_order: 5
---

## About Modules

Since HatSploit Framework has a modular system, all the additional functional including exploits, tools or post-exploitation capabilities are implemented within modules.

Modules can be different. They can scan the target for opened ports, exploit security flaws or spoof the traffic.

## Using the module

To use specific module, just type `use` and module name.

```
[hsf]> use
Usage: use <module|number>
[hsf]>
```

**NOTE:** You can use the module by its number from `search` or `show` lists.

```
[hsf7]> use exploit/linux/rompager/multi_password_disclosure
[hsf7: exploit: RomPager Multi Password Disclosure]> info
 
Category:    exploit
Name:        RomPager Multi Password Disclosure
Module:      exploit/linux/rompager/multi_password_disclosure
Description: RomPager multiple devices password disclosure.
Platform:    linux
Rank:        high

[hsf7: exploit: RomPager Multi Password Disclosure]>
```

Here we also used `info` command to obtain the general module information.

The module we just selected is an exploit for `RomPager 4.07` server. It takes few options and then tries to obtain credentials.

You can list module options using `options` command and list advanced options using `advanced` command.

```
[hsf7: exploit: RomPager Multi Password Disclosure]> options
 
Module Options (exploit/linux/rompager/multi_password_disclosure):
 
    Option      Value    Required    Description
    ------      -----    --------    -----------
    host                 yes         HTTP host.
    port        80       yes         HTTP port.
    ssl         no       no          Use SSL.
    timeout     10       no          Connection timeout.
    username    admin    yes         Default username.
 
[hsf7: exploit: RomPager Multi Password Disclosure]>
```

Options can be set using `set` command and can be set to `None` using `unset`.

```
[hsf7: exploit: RomPager Multi Password Disclosure]> set host 192.168.1.56
[i] host => 192.168.1.56
[hsf7: exploit: RomPager Multi Password Disclosure]>
```

Finally, to execute the module, you should use command `run`.

```
[hsf7: exploit: RomPager Multi Password Disclosure]> run
 
 
Credentials:
 
    Username    Password
    --------    --------
    admin       admin
 
[+] Exploit module completed!
[hsf7: exploit: RomPager Multi Password Disclosure]>
```

**NOTE:** If you want to run module as a background job, use `run -j`.

## Developing the module

If you want to contribute and develop your own module, you might find this guide useful - [Writing Modules](/docs/development/writing-modules)