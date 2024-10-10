---
layout: default
title: HatSploit Plugins
parent: Getting started
nav_order: 4
---

HatSploit plugins are designed to enhance the framework by allowing users to customize the main interface and introduce new commands. Plugins offer extended functionality and enable users to tailor the framework according to their specific requirements.

If you are interested in learning how to develop and write your own plugins for HatSploit, you can refer to the documentation available here: [Writing Plugins](/docs/development/writing-plugins).

## Loading a plugin

To demonstrate how plugins work, let’s try loading one of the fun plugins included with HatSploit – `cowsay`. The framework provides a dedicated `load` command for this purpose, and its usage is quite simple:

```entysec
[hsf]> load
Usage: load <plugin|number>
```

{: .note }
An argument for `load` command can be an index as mentioned above. This index can be obtained for the table produced by `search` or any other command that retrieves plugin list.

When you load the `cowsay` plugin, the following amusing cow message will appear:

```entysec
[hsf]> load cowsay
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
```

Once the plugin is loaded, it adds a new command to the main HatSploit interface.

```entysec
Cowsay Commands:
 
    Command    Description                
    cowsay     Ask the cow to say a message.
```

Now, executing the newly available `cowsay` command with the argument `HatSploit is Great` will produce the following output:

```entysec
[hsf]> cowsay 'HatSploit is Great'
 ____________________
< HatSploit is Great >
 --------------------
         \   ^__^ 
          \  (oo)\_______
             (__)\       )\/\
                 ||----w |
                 ||     ||
```

## Unloading a plugin

When you no longer need a plugin, you can free up space by unloading it using the `unload` command:

```entysec
[hsf]> unload
Usage: unload <plugin|number>
```

{: .note }
An argument for `unload` command can be an index as mentioned above. This index can be obtained for the table produced by `search` or any other command that retrieves plugin list.

## Discovering more plugins

If you are eager to explore and utilize additional plugins, a more comprehensive collection can be found here - [HatSploit Plugins](/docs/plugins).

## Developing the plugin

If you want to contribute and develop your own plugin, you might find this guide useful - [Writing Plugins](/docs/development/writing-plugins)
