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
self.print_empty("Test.")
self.print_process("Test...")
self.print_error("Test!")
self.print_warning("Test.")
self.print_success("Test!")
self.print_information("Test.")
```

**output:**

```
Test.
[*] Test...
[-] Test!
[!] Test.
[+] Test!
[i] Test.
```

### Printing tables

```python
headers = ('Username', 'Password')
data = [('admin', '1234')]

self.print_table('Credentials', headers, *data)
```

**output:**

```
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

```
Your input:
[?] Are you sure [y/N]
[>] Your input:
```

## Tools API

* `self.background(target: Callable[..., Any], args: list = [], kwargs: dict = {})` - Background a target.

**example:**

```python
def target(num):
    time.sleep(num)

self.background(target, [100])
```