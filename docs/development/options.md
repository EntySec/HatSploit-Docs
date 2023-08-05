---
layout: default
title: Options
parent: Development
nav_order: 6
---

Options can be both module-defined and kit-defined.

## Module-defined

### Declaration

Options can be defined for modules, payloads and encoders. They are variables that user can `set` before executing the module, payload or encoder.

To declare an option, you should select the specific data type that this option should accept. These are available options:

* `Option` - any value
* `IPv4Option` - IPv4
* `IPv6Option` - IPv6
* `IPOption` - both IPv4 and IPv6
* `MACOption` - MAC address
* `IPv4CIDROption` - IPv4 CIDR
* `IPv6CIDROption` - IPv6 CIDR
* `PortOption` - network port number
* `PortRangeOption` - range of network ports
* `NumberOption` - both integer and float
* `IntegerOption` - integer
* `FloatOption` - float
* `BooleanOption` - yes or no
* `PayloadOption` - payload name
* `EncoderOption` - encoder name
* `SessionOption` - session ID

Option should be declared inside `__init__` method of module and have this syntax:

```python
self.myvar = IPv4Option("127.0.0.1", "IP address.", True)
```

First argument is a default value, second is the description and third is a flag, which makes this option required or optional.

If you want to make an option **advanced**, so it won't be displayed with all other options, do this:

```python
self.myvar = IPv4Option("127.0.0.1", "IP address.", False, True)
```

Forth argument is a flag, which makes an option advanced or regular.

Acknowledge that you can hide an option by setting `visible` to `False`

```python
self.myvar.visible = False
```

### Usage

You can get option value inside the module by just accessing `self.myvar.value`, considering that `self.myvar` is a declaration of an option.

## Kit-defined

Kit-defined options are options that come with the kit. They still can be modified and accessed by the module.

For example, if your module exploits `ADB` which is an Android Debug Bridge, you can use `ADB` kit. This way you won't need to declare any options related to host and port. Kit will declare them for you.

You can read more about kits in kits section.