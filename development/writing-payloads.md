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
            'Arch': "architecture",
            'Platform': "platform",
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
* `self.run()` - Method, which is called on `run`.

### Payload platform & arch (`Platform`, `Arch`)

For now, HatSploit does accept these platforms and architectures:

* Platforms: `macos`, `linux`, `apple_ios`, `android`, `windows`, `bsd`.
* Architectures: `x86`, `x64`, `armle`, `armbe`, `aarch64`, `mipsle`, `mipsbe`, `mips64`.

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