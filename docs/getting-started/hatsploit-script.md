---
layout: default
title: HatSploit Script
parent: Getting started
nav_order: 8
---

HatSploit has the ability to execute interface commands from the given file.

## Writing Script

I'll create `dirscan.hsf` file, it will be a HatSploit script that scans all directories on `127.0.0.1:8080`.

```
use auxiliary/generic/scanner/directory_scanner
    set host 127.0.0.1
    set port 8080
run
```

And after I wrote this simple script, I'll execute it with HatSploit.

> hsf -s script.hsf

**NOTE:** If you do not want to exit after script execution completed, just use `--no-exit` argument.