---
layout: default
title: Installation
parent: Getting started
nav_order: 1
---

This guide provides step-by-step instructions on setting up the required components and installing the HatSploit Framework on your system.

## System requirements

Before proceeding with the installation, please ensure your system meets the following basic requirements:

* A Unix-like operating system is necessary for running the HatSploit Framework. This includes systems such as Linux or macOS.
* Python version `>= 3.7` must be installed on your system to ensure compatibility with the framework.

## Installing Python

In most cases, Unix-like operating systems come with Python pre-installed, so you may not need to install it manually. However, if Python is not already installed or if you need to ensure that the correct version is present, follow the instructions below.

For **apt-based Unix-like systems** (such as Ubuntu or Debian), you can use the following command to install Python 3 and its package manager `pip`:

```shell
apt-get install -y python3 python3-pip
```

This command will ensure that both Python 3 and the `pip` package manager are installed and up to date, which are essential for managing the framework's dependencies.

## Installing HatSploit

To install the latest stable release of the HatSploit Framework, you can execute the following command. This command will pull the framework directly from the official GitHub repository and install it via `pip`:

```shell
pip3 install git+https://github.com/EntySec/HatSploit
```

Running this command will ensure that you have the most recent version of HatSploit installed, complete with all the necessary dependencies.

Once the installation is complete, you will be ready to start using the HatSploit Framework for your penetration testing and security analysis tasks.
