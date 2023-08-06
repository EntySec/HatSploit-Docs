---
layout: default
title: HatSploit Plugins
parent: Getting started
nav_order: 4
---

## About Plugins

HatSploit plugins are intended to customize the main interface and add new commands to it.

For learning how to write HatSploit plugins: [here](/docs/development/writing-plugins)

## Load Plugin

First, we'll try to load the first HatSploit fun plugin - `cowsay`. For this purpose, HatSploit has its own `load` command with pretty simple usage.

```
(hsf)> load
Usage: load <plugin|number>
(hsf)>
```

**NOTE:** You can load the plugin by its number from `search` or `show` lists.

After loading the `cowsay` plugin, this cow will appear.

```
(hsf)> load cowsay
[*] Loading cowsay plugin...
 ________________
< Cow here, moo! >
 ----------------
         \   ^__^ 
          \  (oo)\_______
             (__)\       )\/\
                 ||----w |
                 ||     ||
        
[i] Use cowsay to call me.
[+] Successfully loaded cowsay plugin!
(hsf)> help
```

Also, after this, the new command will be added to the main HatSploit interface.

```
Cowsay Commands:
 
    Command    Description                
    -------    -----------                
    cowsay     Ask cow to say message.
```

Executing the new command `cowsay` with the argument `HatSploit is Great` will give us this result.

```
(hsf)> cowsay 'HatSploit is Great'
 ____________________
< HatSploit is Great >
 --------------------
         \   ^__^ 
          \  (oo)\_______
             (__)\       )\/\
                 ||----w |
                 ||     ||
        
(hsf)>
```

## Unload Plugin

To free space, you can unload the loaded plugin, just use the `unload` command.

```
(hsf)> unload
Usage: unload <plugin|number>
(hsf)>
```

**NOTE:** You can unload the plugin by its number from `search` or `show` lists.