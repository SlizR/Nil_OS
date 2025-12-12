# Nil OS - lightweight OS | Secured by EVADE

Nil OS is a lightweight, modular, and highly customizable operating system based on [**Root Core**](https://github.com/SlizR/root_core) Linux.
It is designed for minimal resource usage, fast boot times, and maximum user control over both the runtime environment and the persistent storage model.

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

## Features

### Lightweight Core

* Built on Micro Core Linux technologies.
* Small footprint for fast boot and low memory consumption.
* Fully modular structure with optional `.gz` (core.gz update) extensions.

### Custom Boot Experience

* Integrated animated ASCII boot screen.
* User hostname/name overlay.
* Terminal name>>> or root>>>
* Millisecond‑accurate boot time display.
* Optional auto‑saving scripts and OTA update system.

### Persistence and Storage Model

* Automated file saving via `filetool.sh -b`.
* Optional background autosave scripts (e.g., every 2 minutes).
* Full control of core filesystem through custom `core.gz`.

### Extendable Userland

* Custom commands located in `/usr/local/bin` (e.g., `info`, `help`, `update`, `updateinfo`, `fortune`).
* Edited via the permanently stored system directory core.gz.
* Simple Bash/BusyBox environment intended for experimentation.

---

## Directory Structure

```
NilOS/
├── boot/
│   ├── core.gz        # System base image
│   ├── vmlinuz        # Kernel
|   ├── ...            # ...
│   └── isolinux/      # ISO bootloader
├── cde/
│   ├── onboot.lst     # Extensions loaded on boot
│   ├── optional/      # Additional .tcz packages
│   ├── copy2fs.lst    # Files copied into RAM
│   └── xbase.lst      # X11/desktop components
└── opt/
    ├── welcome.sh     # Animated boot splash
    ├── bootlocal.sh   # Local startup script
    ├── ota.sh         # OTA update logic
    ├── autosave.sh    # Optional autosave daemon
    └── shutdown.sh    # Custom shutdown logic
```

---

## Requirements

* x32-x64/x86 architecture
* Minimum computer specifications:

### Processor

Minimum processor: i486 or i586 compatible
Recommended processor: Any Pentium, Celeron, Athlon, VIA C3, Geode, and other processors

### Video Card

Minimum video card: CPU-based or any VESA 2.0-compliant video card (if you can compress the image to any card)
Recommended video card: Any VESA 2.0-compliant video card or higher

### RAM

Minimum RAM to run: 64 MB
Recommended RAM to run: 128 MB or higher

### Disk

Minimum storage to run: 32 MB (ISO: ~25 MB, with an additional 7 MB for system data)
Recommended amount Storage space for launch: No limitation (Above 32 MB or even 25 MB makes sense only for saving data)

---

## Goals

Nil OS aims to provide:

* A clean, minimal Linux base system.
* Fast boot for real hardware and virtual machines.
* Full user control over startup scripts and system persistence.
* An educational platform for users learning OS internals.
