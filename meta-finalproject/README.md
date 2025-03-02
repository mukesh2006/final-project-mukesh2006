# meta-finalproject

`meta-finalproject` is a Yocto layer developed as part of the final project. This layer integrates custom functionality into Yocto-based projects, including recipes and configurations for building specific packages and features.

## Table of Contents

- [Description](#description)
- [Dependencies](#dependencies)
- [Supported Machines](#supported-machines)
- [Usage](#usage)
- [Adding New Recipes](#adding-new-recipes)
- [License](#license)

## Description

This layer serves as the foundation for integrating specific packages and drivers into Yocto projects. It includes:

- **GPIO Kernel Driver:** A custom driver for General Purpose Input/Output (GPIO) functionality.
- **Initialization Script:** An init script to load the GPIO driver during system boot.
- **Custom Banner:** A banner displayed during the Bitbake build process to indicate the execution of the GPIO recipe.

## Dependencies

- **Yocto Project Release:** Compatible with Yocto releases such as Dunfell, Kirkstone, or others.
- **Required Layers:**
  - `meta-openembedded`
  - `meta-yocto`
  - `meta-raspberrypi`

## Supported Machines

This layer has been tested with Raspberry Pi and qemuarm.

## Usage

1. **Add the Layer to Your Yocto Project:**

   To include `meta-finalproject` in your Yocto build:

   - Navigate to your Yocto project directory.
- Modify the `bblayers.conf` file to include the path to `meta-finalproject`.

   Example:
   ```bash
   BBLAYERS += "/path/to/meta-finalproject"
   ```

2. **Build an Image:**

   To build an image incorporating the recipes from `meta-finalproject`:

   ```bash
   bitbake core-image-minimal
   ```

3. **Include Specific Recipes:**

   To include individual recipes, add them to the `IMAGE_INSTALL` variable in your Yocto configuration.

## Adding New Recipes

To extend the functionality of `meta-finalproject`:

1. **Create Recipe Directory:**

   - Under `meta-finalproject/recipes-*`, create a new directory for new package.

2. **Develop the Recipe:**

   - Inside the new directory, create a `.bb` file with the necessary instructions to fetch, build, and install new package.

3. **Update Configuration:**

   - Modify `meta-finalproject/conf/layer.conf` to accommodate new recipe.

4. **Build and Test:**

   - Rebuild your Yocto image and verify that the new recipe integrates seamlessly.

## License

`meta-finalproject` is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---