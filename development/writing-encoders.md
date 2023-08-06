---
layout: default
title: Writing encoders
parent: Development
nav_order: 5
---

Encoders are intended to encode payloads, evade malware detection techniques or obfuscate code.
After deciding what your encoder should do, take this template and edit it for your needs.

## Template

```python
"""
This encoder requires HatSploit: https://hatsploit.com
Current source: https://github.com/EntySec/HatSploit
"""

from hatsploit.lib.encoder.basic import *


class HatSploitEncoder(Encoder):
    def __init__(self):
        super().__init__()

        self.details.update({
            'Name': "full name",
            'Encoder': "name",
            'Authors': [
                'Your name (your nickname) - encoder developer',
            ],
            'Description': "description",
            'Architecture': "architecture",
        })

    def run(self):
        return self.payload
```

**NOTE:** All encoders should inherit from `Encoder`, otherwise encoder won't be imported.

Let's go through all the necessary methods:

* `self.details` - Is a dictionary containing all necessary information (`Full name`, `name`, `description`, `authors`, etc.)
* `self.payload` - Payload which can be encoded.
* `self.run()` - Method, which is called on `run`.

### Encoder options

You can add options to the encoder, read about them [here](/docs/development/options).

## Examples

You can always refer to the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/encoders) which contains some encoders and rely on them.
We will be glad if you first explore already existing encoders before writing new ones.