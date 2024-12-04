---
layout: default
title: Managing databases
parent: Development
nav_order: 1
---

There are four types of databases in the HatSploit Framework.

* **1.** Module database - database containing information about modules.
* **2.** Payload database - database containing information about payloads.
* **3.** Plugin database - database containing information about plugins.
* **4.** Encoder database - database containing information about encoders.

## Base Databases

HatSploit base databases are databases that contains HatSploit modules, payloads, plugins and encoders from this repository (modules - `hatsploit/modules`, payloads - `hatsploit/payloads`, plugins - `hatsploit/plugins`, encoders - `hatsploit/encoders`).

HatSploit will ask you to build base databases automatically at startup.

## Managing Module Databases

For managing module databases, HatSploit has a `module_db` command.

```
Usage: module_db <option> [arguments]
 
Options:
 
    Option    Arguments               Description                                 
    ------    ---------               -----------                                 
    -l                                List all connected module databases.        
    -d        <name>                  Disconnect specified module database.       
    -c        <name> <path>           Connect new module database.                
    -b        <path> <output_path>    Build module database from modules path.    
```

### Listing Module Databases

For getting a list of module databases, use `module_db -l`.

```
(hsf)> module_db -l

Connected Module Databases:
 
    Number    Name       Path                                                                            
    ------    ----       ----                                                                            
    0         modules    /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/modules.json

(hsf)>
```

### Disconnecting Module Database

To disconnect specified module database, use `module_db -d <name>`

### Connecting Module Database

To connect specified module database, use `module_db -c <name> <path>`

### Building Module Database

To build a module database, you should use `module_db -b <path> <output_path>`, where `<path>` is the path to the directory containing your modules (like `hatsploit/modules`) and `<output_path>` is the path where to generate database.

```
(hsf)> module_db -b /Users/enty8080/modules /Users/enty8080/modules.json
(hsf)> module_db -c my_modules /Users/enty8080/modules.json
(hsf)> module_db -l

Connected Module Databases:

    Number    Name           Path                                                                            
    ------    ----           ----                                                                            
    0         modules        /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/modules.json
    1         my_modules     /Users/enty8080/modules.json

(hsf)>
```

## Managing Payload Databases

For managing payload databases, HatSploit has a `payload_db` command.

```
Usage: payload_db <option> [arguments]
 
Options:
 
    Option    Arguments               Description                                   
    ------    ---------               -----------                                   
    -l                                List all connected payload databases.         
    -d        <name>                  Disconnect specified payload database.        
    -c        <name> <path>           Connect new payload database.                 
    -b        <path> <output_path>    Build payload database from payloads path.    
```

### Listing Payload Databases

For getting a list of payload databases, use `payload_db -l`.

```
(hsf)> payload_db -l

Connected Payload Databases:
 
    Number    Name        Path                                                                            
    ------    ----        ----                                                                            
    0         payloads    /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/payloads.json

(hsf)>
```

### Disconnecting Payload Database

To disconnect specified payload database, use `payload_db -d <name>`

### Connecting Payload Database

To connect specified payload database, use `payload_db -c <name> <path>`

### Building Payload Database

To build a payload database, you should use `payload_db -b <path> <output_path>`, where `<path>` is the path to the directory containing your payloads (like `hatsploit/payloads`) and `<output_path>` is the path where to generate database.

```
(hsf)> payload_db -b /Users/enty8080/payloads /Users/enty8080/payloads.json
(hsf)> payload_db -c my_payloads /Users/enty8080/payloads.json
(hsf)> payload_db -l

Connected Payload Databases:

    Number    Name           Path                                                                            
    ------    ----           ----                                                                            
    0         payloads       /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/payloads.json
    1         my_payloads    /Users/enty8080/payloads.json

(hsf)>
```

## Managing Plugin Databases

For managing plugin databases, HatSploit has a `plugin_db` command.

```
Usage: plugin_db <option> [arguments]
 
Options:
 
    Option    Arguments               Description                                 
    ------    ---------               -----------                                 
    -l                                List all connected plugin databases.        
    -d        <name>                  Disconnect specified plugin database.       
    -c        <name> <path>           Connect new plugin database.                
    -b        <path> <output_path>    Build plugin database from plugins path.    
```

### Listing Plugin Databases

For getting a list of plugin databases, use `plugin_db -l`.

```
(hsf)> plugin_db -l

Connected Plugin Databases:
 
    Number    Name       Path                                                                            
    ------    ----       ----                                                                            
    0         plugins    /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/plugins.json

(hsf)>
```

### Disconnecting Plugin Database

To disconnect specified plugin database, use `plugin_db -d <name>`

### Connecting Plugin Database

To connect specified plugin database, use `plugin_db -c <name> <path>`

### Building Plugin Database

To build a plugin database, you should use `plugin_db -b <path> <output_path>`, where `<path>` is the path to the directory containing your plugins (like `hatsploit/plugins`) and `<output_path>` is the path where to generate database.

```
(hsf)> plugin_db -b /Users/enty8080/plugins /Users/enty8080/plugins.json
(hsf)> plugin_db -c my_plugins /Users/enty8080/plugins.json
(hsf)> plugin_db -l

Connected Plugin Databases:

    Number    Name          Path                                                                            
    ------    ----          ----                                                                            
    0         plugins       /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/plugins.json
    1         my_plugins    /Users/enty8080/plugins.json

(hsf)>
```

## Managing Encoder Databases

For managing encoder databases, HatSploit has a `encoder_db` command.

```
Usage: encoder_db <option> [arguments]
 
Options:
 
    Option    Arguments               Description                                 
    ------    ---------               -----------                                 
    -l                                List all connected encoder databases.        
    -d        <name>                  Disconnect specified encoder database.       
    -c        <name> <path>           Connect new encoder database.                
    -b        <path> <output_path>    Build encoder database from encoders path.    
```

### Listing Encoder Databases

For getting a list of plugin databases, use `encoder_db -l`.

```
(hsf)> encoder_db -l

Connected Encoder Databases:
 
    Number    Name       Path                                                                            
    ------    ----       ----                                                                            
    0         encoders   /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/encoders.json

(hsf)>
```

### Disconnecting Encoder Database

To disconnect specified encoder database, use `encoder_db -d <name>`

### Connecting Encoder Database

To connect specified encoder database, use `encoder_db -c <name> <path>`

### Building Encoder Database

To build a encoder database, you should use `encoder_db -b <path> <output_path>`, where `<path>` is the path to the directory containing your encoders (like `hatsploit/encoders`) and `<output_path>` is the path where to generate database.

```
(hsf)> encoder_db -b /Users/enty8080/encoders /Users/enty8080/encoders.json
(hsf)> encoder_db -c my_encoders /Users/enty8080/encoders.json
(hsf)> encoder_db -l

Connected Encoder Databases:

    Number    Name          Path                                                                            
    ------    ----          ----                                                                            
    0         encoders      /usr/local/lib/python3.9/site-packages/hatsploit/base/../db/encoders.json
    1         my_encoders   /Users/enty8080/encoders.json

(hsf)>
```
