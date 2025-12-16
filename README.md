# Nil OS - lightweight OS | Secured by EVADE

Nil OS is a lightweight, modular, and highly customizable operating system based on [**Root Core**](https://github.com/SlizR/root_core) Linux. 
> **Note! Root Core does not use a Unix-like system! It uses a custom launch system similar to Linux's Timmy Core. Nil OS uses Root Core, but with a modified structure: the underlying system is .sb modules rather than .gz (although Root Core has been modified slightly to accommodate the .img > initrfs.img system).
It is designed for minimal resource usage, fast boot times, and maximum user control over both the runtime environment and the persistent storage model.**

> **WARNING!**

> All previous versions before 6.6 are not working, there are updates, but version 6.4 has a different architecture and does not have a GUI/UI, version 6.5 was not tested and it turned out to be a problem with the kernel and screen, and after version 6.5, 6.6 was also not working, after correction it is working**

Nil OS provides an extensible architecture suitable for embedded systems, experimental Linux environments, custom live distributions, and minimalistic desktop setups.

## How is this OS better than other micro OS?

1. **Support and weekly updates**
2. **OTA updates**
3. **UI/GUI, although support for low-end hardware is the same**
4. **OS history is not just "done and done"**
5. **Saved files are available on disk from where they were downloaded (I inserted the OS on a flash drive into my computer, made edits, and retrieved everything from the flash drive, but nothing changed or saved on the PC).**
6. **System: I inserted a flash drive with the operating system (Nil OS) into the computer, made changes, and all the data was saved to the flash drive, and nothing changed or was saved on the PC. (EVADE Security Service Feature)**
7. **Security updates with every update thanks to** *Secured by EVADE* **(EVADE Security)**

### EVADE Security

- [**EVADE**](https://github.com/SlizR/EVADE) Security - A system for protecting multiple operating systems for **writing to local computers** **(Full OS Isolation on a flash drive)** abbreviation:
- **E**xternal **V**ault **A**ccess **D**efense **E**ngine - **EVADE**

---
# All OS status
| OS Name (code name) | Version | UI/GUI | Is it supported? | Released? | Status | Development |
|:---|:---:|:---:|:---:|:---:|:---:|:---|
| 6.4 | v6.4 | UI | Yes | No | Not working | 100% |
| 6.5 | v6.5 | UI | Yes | No | Not working | 100% |
| 6.6 | v6.6 | UI & GUI | Yes | Yes | Stable | 100% |
| shore | v6.7 | UI & GUI | - | No | Development... | 20% |
---

## Features

### Lightweight Core

* Built on Micro Core Linux technologies.
* Small footprint for fast boot and low memory consumption.
* Fully modular structure with optional `.img` (initrfs.img update) extensions.

### Custom Boot Experience

* Integrated animated ASCII boot screen.
* User hostname/name overlay.
* Terminal: name>>> (For user) or $> (For root)
* Millisecond‑accurate boot time display.
* Optional auto‑saving scripts and OTA update system.

### Persistence and Storage Model

* Automated file saving via `filetool.sh -b`.
* Optional background autosave scripts (e.g., every 2 minutes).
* Full control of core filesystem through custom `initrfs.img`.

### Extendable Userland

* Custom commands located in `/usr/local/bin` (e.g., `info`, `help`, `update`, `updateinfo`, `fortune`).
* Edited via the permanently stored system directory initrfs.img.
* Simple Bash/Fluxbox environment intended for experimentation.

---

## Directory Structure

```
nil/
├── boot/
│   ├── initrfs.img           # Initramfs (Compressed CPIO archive)
│   ├── vmlinuz               # Linux kernel
│   ├── isolinux.bin          # ISOLINUX bootloader (for BIOS)
│   ├── isolinux.cfg          # ISOLINUX bootloader menu configuration
│   ├── vesamenu.c32          # Menu module (for graphical mode)
│├── EFI/
│   │   └── Boot/
│   │        ├── bootx64.efi   # EFI bootloader (for 64-bit UEFI)
│   │        └── syslinux.cfg  # EFI/SYSLINUX bootloader configuration
│   ├── ... (c32, mbr, extlinux) # Additional boot components
│   └── bootinst.sh         # Script for writing to USB/HDD
│
├── changes/
│└── (empty)                # Changes to the running system are saved here
│
└── modules/
├── 01-core.sb            # The core of the system (SquashFS), including /etc, /bin, /lib
├── 01-firmware.sb        # Firmware for hardware (Wi-Fi, GPU, etc.)
├── 02-xorg.sb            # X.Org graphics server
├── 03-desktop.sb         # Desktop (WM, panel, basic Utilities)
├── 04-apps.sb            # Additional Applications
└── 05-chromium.sb        # Large Applications (e.g., Browser)
```

---

## Requirements

* **x64/x86** architecture
* ***Minimum** computer specifications:*

### Processor

Minimum processor: **Intel Pentium (or equivalent), 32-bit (i686) or 64-bit (x86_64)**
Recommended processor: **Any modern processor (1 GHz+)**

### Video Card

Minimum video card: **VESA-compatible graphics card**
Recommended video card: **A graphics card with 3D acceleration support (for modern browsing)**

### RAM

Minimum RAM to run: **512 MB**
Recommended RAM to run: **1 GB or higher**

### Disk

Minimum storage to run: **512 MB (ISO: ~440,2 MB, with an additional 71,8 MB for system data)**
Recommended amount Storage space for launch: **No limitation (Above 512 MB makes sense only for saving data)**

---

## Goals

Nil OS aims to provide:

* A clean, minimal Linux base system.
* Fast boot for real hardware and virtual machines.
* Full user control over startup scripts and system persistence.
* An educational platform for users learning OS internals.
