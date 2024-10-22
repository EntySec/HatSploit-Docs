---
layout: default
title: Writing Encoders
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

from hatsploit.lib.core.encoder import Encoder


class HatSploitEncoder(Encoder):
    def __init__(self):
        super().__init__({
            'Name': "",
            'Encoder': "",
            'Authors': (
            ),
            'Description': "",
            'Arch': None,
        })

        self.sample = Option('SAMPLE', None, "Sample option.",
                             required=False, advanced=False)

    def __call__(self):
        """ Method that is called when encoder is used first time.

        This method can be removed and often is useless, but it MUST
        be used if:

            1. You want to manipulate options pre-defined by Kits (e.g. hide them, set them, lock them)

        Otherwise just delete this method from your encoder.
        """

        return

    def run(self):
        """ Method that is called when this encoder is executed.

        Payload that is passed to this encoder is available at self.payload
        and this method should always return the value (processed payload).
        """

        return self.payload
```

**Note:** Every encoder should inherit from the `Encoder` class (`hatsploit.lib.encoder`). If this inheritance is missing, the encoder will not be loaded properly by HatSploit.

### Encoder architecture (`Arch`)

Encoder architecture defined the payload architecture that is compatible with this encoder. For payload to work with your encoder, it should have the exact same architecture. For now, HatSploit encoders may accept these architectures:

* **ARCH_X64** - x86_64 CPU little-endian
* **ARCH_X86** - x86 (i386, i486, i686) little-endian
* **ARCH_AARCH64** - Aarch64 (arm64) little-endian
* **ARCH_MIPSLE** - MIPS 32-bit little-endian
* **ARCH_MIPSBE** - MIPS 32-bit 
* **ARCH_ARMLE**
* **ARCH_ARMBE**

### Encoder options

You can add options to the encoder, read about them [here](/docs/development/options).

## Examples and Best Practices

If you are new to writing encoders for HatSploit, it is highly recommended that you review existing encoders in the [main repository](https://github.com/EntySec/HatSploit/tree/main/hatsploit/encoders). These existing encoders can serve as valuable references for understanding the structure and functionality of encoders within the framework.

We encourage you to explore these resources and learn from them before developing new encoders. This practice will help you follow consistent patterns and ensure the best integration with HatSploit's functionality.
