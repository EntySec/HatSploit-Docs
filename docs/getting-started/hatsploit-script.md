---
layout: default
title: HatSploit Script
parent: Getting started
nav_order: 8
---

HatSploit has the ability to execute interface commands from the given file.

## Writing script

The HatSploit script provided below scans all directories at `http://127.0.0.1:8080/`.

```hsf
##
# Created by Ivan Nikolskiy at 08/08/2022
# (c) EntySec 2022
#
# @Brief: Scan HTTP server hosted on localhost:8080
##

use auxiliary/generic/scanner/directory_scanner
    set host 127.0.0.1
    set port 8080
run
```

And after I wrote this simple script, I'll execute it with HatSploit.

> hsf -s script.hsf

{: .note }
If you do not want to exit after script execution completed, just use `--no-exit` argument.