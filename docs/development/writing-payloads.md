---
layout: default
title: Writing Payloads
parent: Development
nav_order: 4
---

Payloads are intended to be sent to the target after successful exploitation.
After deciding what your payload should do, take this template and edit it for your needs.

## Template

```python
"""
This payload requires HatSploit: https://hatsploit.com
Current source: https://github.com/EntySec/HatSploit
"""

from hatsploit.lib.payload.basic import *


class HatSploitPayload(Payload):
    def __init__(self):
        super().__init__()

        self.details.update({
            'Name': "",
            'Payload': "",
            'Authors': [
                'Your name (your username) - payload developer',
            ],
            'Description': """
            """,
            'Arch': Arch,
            'Platform': Platform,
            'Session': None,
            'Type': None,
        })

    def __call__(self):
        """ Code in this function executed when payload is selected for first time.
        """

        pass

    def implant(self):
        """ This function should contain main part of payload.
        """

        return b''

    def run(self):
        """ This function should contain whole payload.
        """

        return b''
```

{: .note }
All payloads should inherit from `Payload`, otherwise payload won't be imported.

### Payload name (`Name`)

Payload name is a full name of payload that is displayed in a console interface.

### Payload slug (`Payload`)

Payload slug is used as an argument to `set payload` command. It should look like this - `platform/architecture/name` (e.g. `linux/x64/shell_reverse_tcp`).

### Payload stage

If your final payload is too big (if there is a limit on the exploited system) then your payload should also include `self.stage()` method that is used as an intermediate stage. So, if payload is big, then instead of sending whole payload available in `self.run()`, handler will firstly send stage from `self.stage()` and then implant from `self.implant()`.

{: .note }
If you payload has more than one intermediate stage, methods can be called `self.stage()` for first stage, `self.stage1()` for second stage, `self.stage2()` for third and etc.

### Payload implant

If payload's `self.run()` method contains whole payload, then `self.implant()` contains only the necessary part of it which is also called the final stage.

For example, if we have payload that connects back to HatSploit and then duplicates `/bin/sh` to the socket, then `self.implant()` of this payload should not contain the part 
that is related to connecting back.

With other words, `self.implant()` is a final stage that is being sent if payload is staged. Each payload with `self.implant()` can be called staged.

This can be necessary if payload is bigger than the buffer size, then handler will need to send an intermediate stage from `self.stage()` and then the code from `self.implant()`.

### Payload platform & arch (`Platform`, `Arch`)

For now, HatSploit does accept these platforms and architectures:

#### Platforms

* `OS_LINUX` - Linux OS
* `OS_MACOS` - macOS (OSX)
* `OS_ANDROID` - Android
* `OS_IPHONE` - iOS (iPhoneOS)
* `OS_UNIX` - Any POSIX-like system (macOS, Linux, iOS, etc.)
* `OS_WINDOWS` - Windows OS

#### Architectures

* `ARCH_X64` - x86_64 CPU little-endian
* `ARCH_X86` - x86 (i386, i486, i686) little-endian
* `ARCH_AARCH64` - Aarch64 (arm64) little-endian
* `ARCH_MIPSLE` - MIPS 32-bit little-endian
* `ARCH_MIPSBE` - MIPS 32-bit big-endian
* `ARCH_ARMLE` - ARM 32-bit little-endian
* `ARCH_ARMBE` - ARM 32-bit big-endian
* `ARCH_MIPS64LE` - MIPS 64-bit little-endian
* `ARCH_MIPS64BE` - MIPS 64-bit big-endian
* `ARCH_PPC` - PowerPC 32-bit big-endian
* `ARCH_PPC64` - PowerPC 64-bit little-endian
* `ARCH_S390X` - IBM Z-Arch big-endian

### Payload type (`Type`)

These types can be used for payloads:

* `ONE_SIDE` - payload is sent once and no session is opened since no data is being received from payload.
* `REVERSE_TCP` - payload is sent and reverse TCP connection is being established.
* `BIND_TCP` - payload is sent and bind TCP connection is being established.

### Payload session (`Session`)

Payload session is a wrapper for a session. Should be set to `None` to use custom session wrapper. Acknowledge how to write a custom session wrapper [here](/docs/development/session-wrapper).

{: .note }
This field is optional, you can omit it instead of setting `Session` to `None`.

### Payload handler

Payload handler is a essential part of reverse TCP and bind TCP payloads. It does establish connection and provide additional functional.

So, if your payload has type of `reverse_tcp` or `bind_tcp`, it should inherit from `Handler` as well.

```python
from hatsploit.lib.payload.basic import *

class HatSploitPayload(Payload, Handler):
    ...
```

With payload handler you won't need to declare `RHOST` and `RPORT` options by yourself and can access their values as `self.rhost.value` and `self.rport.value`.

Read more about handler [here](/docs/kits/handler).

### Payload options

You can add options to the payload, read about them here - [Options](/docs/development/options).

### Using assembler

If you are writing payload that is a shellcode, you can store it in assembly and then let HatSploit assemble this code for you instead of storing machine code. This can be done 
by invoking `self.__asm__` on specific assembly code. `self.__asm__` uses current payload architecture so it expects appropriate assembly.

```python
def run(self):
    """ This function should contain whole payload.

    This particular example generates shellcode that reboots the system
    if executed.
    """

    return self.__asm__(
        """
        start:
            mov al, 0xa2
            syscall

            mov al, 0xa9
            mov edx, 0x1234567
            mov esi, 0x28121969
            mov edi, 0xfee1dead
            syscall
        """
    )
```

## Examples

You can always refer to the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/payloads) which contains some payloads and rely on them.
We will be glad if you first explore already existing payloads before writing new ones.
