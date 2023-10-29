---
layout: default
title: Session wrapper
parent: Development
nav_order: 8
---

Session wrapper is a class that is being called when new session opens. This class contains all the necessary methods for working with the session. Session wrapper should be defined in the payload, but if not, the default one is used.

**NOTE:** We still highly advise you to use the default session wrapper that is provided by the HatSploit Framework.

## Template

```python
from hatsploit.lib.session import Session


class HatSploitSession(Session):
    def __init__(self):
        super().__init__()

        self.details.update({
            'Post': "",
            'Platform': Platform,
            'Arch': Arch,
            'Type': "",
            'Host': "",
            'Port': None
        })

    def open(self, client):
        pass

    def close(self):
        pass

    def heartbeat(self):
        return False

    def send_command(self, command, output=False):
        return ""

    def download(self, remote_file, local_path):
        pass

    def upload(self, local_file, remote_path):
        pass

    def interact(self):
        pass
```

**NOTE:** All session wrappers should inherit from `Session`, otherwise session wrapper won't be imported.

Let's go through all the necessary methods:

* `self.details` - Is a dictionary containing all necessary information about the session.
* `self.open(client)` - Opens a session for a client.
* `self.close()` - Closes session.
* `self.heartbeat()` - Checks if session is alive.
* `self.send_command(command, output)` - Send command to the session.
* `self.download(remote_file, local_path)` - Download a file from the session.
* `self.upload(local_file, remote_path)` - Upload a file to the session.
* `self.interact()` - Interact with the session.