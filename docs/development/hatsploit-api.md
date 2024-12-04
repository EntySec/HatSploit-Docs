---
layout: default
title: HatSploit API
parent: Development
nav_order: 9
---

This page is about HatSploit Python API, API intended for development of modules, payloads, encoders and plugins.

You don't need to import any additional libraries to use this API. However, this API works only inside module, payload, encoder or plugin.

## CLI API

### Printing messages

```python
self.print_empty("Sample empty information.")
self.print_process("Sample process happening...")
self.print_error("Sample error occurred!")
self.print_warning("Sample warning message.")
self.print_success("Sample successful message!")
self.print_information("Sample information message.")
```

**output:**

```entysec
Sample empty information.
[*] Sample process happening...
[-] Sample error occurred!
[!] Sample warning message.
[+] Sample successful message!
[i] Sample information message.
```

### Printing tables

```python
headers = ('Username', 'Password')
data = [('admin', '1234')]

self.print_table('Credentials', headers, *data)
```

**output:**

```hsf
Credentials:

  Username    Password
  --------    --------
  admin       1234
```

### Input message

```python
self.input_empty("Your input: ")
self.input_question("Are you sure? [y/N] ")
self.inpit_arrow("Your input: ")
```

**output:**

```hsf
Your input:
[?] Are you sure [y/N]
[>] Your input:
```
