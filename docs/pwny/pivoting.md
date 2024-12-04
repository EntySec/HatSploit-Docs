---
layout: default
title: Pivoting in Pwny
parent: Pwny
nav_order: 3
---

Pivoting is an essential part of any cyber attack. This is the way how attackers can access other resources inside the internal network.

## Port forwarding

Pwny provides a simply utilizable command `portfwd` that allows you to manage port forwarding rules. It works by forwarding traffic from internal network to your network.

```entysec
pwny:/Users/felix felix$ portfwd
usage: portfwd [-h] [-l] [-d ID] [-L HOST] [-P PORT] [-p PORT] [-r HOST]

Manage port forwarding.

options:
  -h, --help          show this help message and exit
  -l, --list          List existing forwarding rules.
  -d ID, --delete ID  Delete existing forwarding rule by ID.
  -L HOST             Local host to listen on (optional).
  -P PORT             Local port to listen on (optional).
  -p PORT             Remote port to connect to.
  -r HOST             Remote host to connect to.
```

In the below scenario we are prompted to forwarding traffic from SSH server located in the internal network and access it from the outside.

```entysec
pwny:/Users/felix felix$ portfwd -L 127.0.0.1 -P 5555 -r 10.10.10.2 -p 22
[*] Adding rule tcp://10.10.10.2:22...
[+] Rule activated as 0!
pwny:/Users/felix felix$ portfwd -l

Forwarding rules:

    ID    Rule
    0     127.0.0.1:5555 -> 10.10.10.2:22
```

Now, lets try and connect to the forwarded server:

```bash
felix@Felixs-MacBook-Air ~ % ssh -l pi 127.0.0.1 -p 5555
The authenticity of host '[127.0.0.1]:5555 ([127.0.0.1]:5555)' can't be established.
ECDSA key fingerprint is SHA256:qApomy8EzoqEBPMaWb+DF6Faz5vXVpRU6vUtLRhh9VE.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[127.0.0.1]:5555' (ECDSA) to the list of known hosts.
Password:
pi@raspberry:~$
```

Next, as we don't need this forwarding rule anymore, we can just flush it.

```entysec
pwny:/Users/felix felix$ portfwd -d 0
[*] Flushing rule 0...
[-] TCP listener is not started!
[+] Rule 0 deleted!
```
