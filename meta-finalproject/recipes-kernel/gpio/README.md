# GPIO Kernel Driver Bitbake Recipe

This Bitbake recipe adds a GPIO kernel driver to your Yocto project. It is based on the example provided in the [GPIO-in-Linux-Device-Driver](https://github.com/Embetronicx/Tutorials) repository and integrates the kernel module into your Yocto build process.

## Summary

- **Recipe Name:** `gpio`
- **License:** MIT
- **Version Control Source:** [GitHub - EmbeTronicx Tutorials](https://github.com/Embetronicx/Tutorials)

The recipe is designed to compile and install a GPIO kernel driver and a corresponding init script for system startup.

## Description

This Bitbake recipe builds and installs a GPIO kernel driver and the necessary startup script to control GPIO on Linux. It supports building a kernel module as part of a Yocto build process. Additionally, it installs the kernel module to the appropriate directory and adds an init script (`gpio_load`) to `/etc/init.d/` for proper startup configuration.

## Features

- **Kernel Module:** Builds a kernel module from source and installs it under `/lib/modules/${KERNEL_VERSION}/extra/`.
- **Initialization Script:** Installs an initialization script `gpio_load` to `/etc/init.d/` for module loading during boot.
- **Custom Banner:** Displays a custom banner message during the Bitbake build process.

## Usage

1. **Recipe Configuration:**
   This recipe is designed to be included in your Yocto project via `meta-finalproject` layer or as an individual recipe.
   
2. **Dependencies:**
   - The recipe depends on the `virtual/kernel` package, ensuring that the appropriate kernel is available during the build process.
   
3. **Recipe Build Process:**
   To use this recipe in your Yocto project, simply add it to your build environment:

   ```bash
   bitbake <your-image-target>
   ```

4. **Installation Paths:**
   - The kernel module will be installed under `/lib/modules/${KERNEL_VERSION}/extra/`.
   - The init script will be placed under `/etc/init.d/`.

## Recipe Structure

### Variables

- **`MODULE_NAME`**: The name of the kernel module. By default, it is set to `kernel-module-driver`.
- **`MODULE_INSTALL_PATH`**: Specifies where the kernel module will be installed on the target system.
  
### Key Tasks

- **`do_compile`**: This task compiles the GPIO kernel module using the kernel's build system.
- **`do_install`**: This task installs the kernel module to the target system and places the initialization script in `/etc/init.d/`.

### SRC_URI

- **Main Source**: The recipe pulls the GPIO driver source code from a GitHub repository.
- **Local Files**: It also includes a `LICENSE` file and an init script (`gpio_load`).

### Custom Banner

A custom banner is displayed during the Bitbake process, indicating that the recipe is being executed.

```bash
***********************************************
*                                             *
*     GPIO recipe created by bitbake-layers    *
*                                             *
***********************************************
```

## License

This recipe and the GPIO kernel driver are licensed under the MIT License. See the `LICENSE` file for full details.

## Installation

After building and installing the image, you can find the GPIO kernel module in `/lib/modules/${KERNEL_VERSION}/extra/` and the `gpio_load` script in `/etc/init.d/`.

To load the GPIO kernel module on startup, the system will use the `gpio_load` script during the boot process.

## Example

Once the system is booted and the module is loaded, you can control the GPIO pins through the kernel interface. For more information on how to use the GPIO functionality, refer to the documentation in the `Tutorials` repository.

---

This recipe ensures the GPIO kernel driver is seamlessly integrated into your Yocto-based system, allowing GPIO control for embedded applications.