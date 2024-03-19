---
layout: default
title: Writing payloads
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
            'Name': "full name",
            'Payload': "name",
            'Authors': [
                'Your name (your nickname) - payload developer',
            ],
            'Description': "description.",
            'Arch': Arch,
            'Platform': Platform,
            'Session': None,
            'Rank': "rank level",
            'Type': "type",
        })

    def run(self):
        return ""
```

**NOTE:** All payloads should inherit from `Payload`, otherwise payload won't be imported.

Let's go through all the necessary methods:

* `self.details` - Is a dictionary containing all necessary information (`Full name`, `name`, `description`, `authors`, etc.)
* `self.run()` - Method, which is called on `run` and contains whole payload.

Optional methods:

* `self.implant()` - Method which is called if final phase is required and contains the main part of payload.
* `self.phase()` - Method which is called if whole payload is too big, it is an intermediate phase that is sent before the final implant.

### Payload phase

If your final payload is too big (if there is a limit on the exploited system) then your payload should also include `self.phase()` method that is used as an intermediate phase. So, if payload is big, then instead of sending whole payload available in `self.run()`, handler will firstly send phase from `self.phase()` and then implant from `self.implant()`.

**NOTE:** If you payload has more than one intermediate phase, methods can be called `self.phase()` for first phase, `self.phase1()` for second phase, `self.phase2()` for third and etc.

### Payload implant

If payload's `self.run()` method should contain full payload, then `self.implant()` contains only the necessary part of it which is also called the final phase.

For example, if we have payload which connects back to HatSploit and the duplicates `/bin/sh` to the socket, then `self.implant()` of this payload should not contain the part which is related to connecting back.

With other words, `self.implant()` is a final phase that is being sent if payload is phased (staged). Each payload with `self.implant()` can be called phased (staged).

This can be necessary if payload is bigger than the buffer size, then handler will need to send an intermediate phase from `self.phase()` and then the code from `self.implant()`.

### Payload platform & arch (`Platform`, `Arch`)

For now, HatSploit does accept these platforms and architectures:

* Platforms: OS_LINUX, OS_MACOS, OS_ANDROID, OS_WINDOWS, OS_IPHONE, OS_UNIX.
* Architectures: ARCH_X64, ARCH_X86, ARCH_AARCH64, ARCH_MIPSLE, ARCH_MIPSBE, ARCH_ARMLE, ARCH_ARMBE.

### Payload type (`Type`)

These types can be used for payloads:

* `one_side` - payload is sent once and no session is opened since no data is being received from payload.
* `reverse_tcp` - payload is sent and reverse TCP connection is being established.
* `bind_tcp` - payload is sent and bind TCP connection is being established.

### Payload rank (`Rank`)

Payload rank is an approximate level of risk that can be caused by the payload. These levels can be set for the payload:

* `low` - No serious impact at all or a low impact.
* `medium` - Medium impact, might not cause damage but affect the target.
* `high` - High impact, may cause damage to the target.

### Payload session (`Session`)

Payload session is a wrapper for a session. Should be set to `None` to use custom session wrapper. Acknowledge how to write a custom session wrapper [here](/docs/development/session-wrapper).

**NOTE:** This field is optional, you can omit it instead of setting `Session` to `None`.

### Payload handler

Payload handler is a essential part of reverse TCP and bind TCP payloads. It does establish connection and provide additional functional.

So, if your payload has type of `reverse_tcp` or `bind_tcp`, it should inherit from `Handler` as well.

```python
from hatsploit.lib.payload.basic import *

class HatSploitPayload(Payload, Handler):
    ... snip ...
```

With payload handler you won't need to declare `rhost` and `rport` options by yourself and can access their values as `self.rhost.value` and `self.rport.value`.

Read more about handler [here](/docs/kits/handler).

### Payload options

You can add options to the payload, read about them [here](/docs/development/options).

## Examples

You can always refer to the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/payloads) which contains some payloads and rely on them.
We will be glad if you first explore already existing payloads before writing new ones.
