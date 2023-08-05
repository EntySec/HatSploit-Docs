---
layout: default
title: Writing encoders
parent: Development
nav_order: 3
---

Encoders are intended to encode payloads, evade malware detection techniques or obfuscate code.
After deciding what your encoder should do, take this template and edit it for your needs.

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