---
layout: default
title: HatSploit Script
parent: Getting started
nav_order: 5
---

HatSploit has the ability to execute interface commands from the given file.

## Writing Script

I'll create `port_scan.hsf` file, it will be a HatSploit script that scans all opened ports on `127.0.0.1`.

```assembly
use auxiliary/generic/scanner/port_scanner
    set host 127.0.0.1
run
```

And after I wrote this simple script, I'll execute it with HatSploit.

> hsf -s script.hsf

**NOTE:** If you do not want to exit after script execution completed, just use `--no-exit` argument.