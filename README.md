# anka-packer-templates

Hashicorp [Packer](https://www.packer.io/) templates for building Veertu [Anka](https://veertu.com/technology/) virtual machine images.

## Requirements
1. [Install `asdf`](https://github.com/asdf-vm/asdf) for tool version management (Recommended)
2. Install Veertu Anka Flow
   ```
   brew install anka-flow
   ```
3. License Anka Flow
   ```
   sudo anka license activate <key>
   ```
4. Install Packer (<= `v1.4.5`, See [packer-builder-veertu-anka#16](https://github.com/veertuinc/packer-builder-veertu-anka/issues/16)) 
   ```
   asdf plugin-add packer && asdf install packer 1.4.5
   ```
5. Install [Packer Builder for Anka](https://github.com/veertuinc/packer-builder-veertu-anka)
6. Ensure you have the macOS Catalina installer locally at `/Applications/Install macOS Catalina.app`
7. To build the Xcode image, ensure `$FASTLANE_USER` and `$FASTLANE_PASSWORD` are set in your local dev environment. [Fastlane](https://github.com/fastlane/fastlane) uses Apple Developer credentials to fetch Xcode from developer.apple.com.
   ```
   export FASTLANE_USER=johnny@appleseed.com && export FASTLANE_PASSWORD=p@$$WorD
   ```

## Notes

VPN software is known to interfere with VM interaction; please disable it before continuing.

## Build

- All images are ultimately based on a vanilla image, which must be build first:

  ##### :warning: Requires 30GB free disk space and takes ~30 minutes!
  ```
  packer build macos-vanilla-10.15.json
  ```

- To build the general CI image (Uses Vanilla as base):

  ##### :warning: Requires 30GB free disk space and takes ~30 minutes!
  ```
  packer build macos-vanilla-10.15.json
  ```

- To build the Xcode image (Uses CI as base):

  ##### :warning: Requires 40GB free disk space and takes ~45 minutes!
  ```
  packer build macos-xcode-10.15.json
  ```
