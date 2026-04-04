# Fjord Launcher ReUnlocked Nix Packaging

## Installing the package directly

After adding `github:Cfauto28/FjordLauncherReUnlocked` to your flake inputs, you can access the flake's `packages` output.

Example:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    fjordlauncherreunlocked = {
      url = "github:Cfauto28/FjordLauncherReUnlocked";

      # Optional: Override the nixpkgs input of fjordlauncher to use the same revision as the rest of your flake
      # Note that this may break the reproducibility mentioned above, and you might not be able to access the binary cache
      #
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, fjordlauncherreunlocked, ... }:
    {
      nixosConfigurations.foo = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix

          (
            { pkgs, ... }:
            {
              environment.systemPackages = [ fjordlauncherreunlocked.packages.${pkgs.system}.fjordlauncherreunlocked ];
            }
          )
        ];
      };
    };
}
```

## Using the overlay

Alternatively, if you don't want to use our `packages` output, you can add our overlay to your nixpkgs instance.
This will ensure Fjord is built with your system's packages.

> [!WARNING]
> Depending on what revision of nixpkgs your system uses, this may result in binaries that differ from the above `packages` output
> If this is the case, you will not be able to use the binary cache

Example:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    fjordlauncherreunlocked = {
      url = "github:Cfauto28/FjordLauncherReUnlocked";

      # Optional: Override the nixpkgs input of fjordlauncherreunlocked to use the same revision as the rest of your flake
      # Note that this may break the reproducibility mentioned above, and you might not be able to access the binary cache
      #
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, fjordlauncherreunlocked, ... }:
    {
      nixosConfigurations.foo = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix

          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [ fjordlauncherreunlocked.overlays.default ];

              environment.systemPackages = [ pkgs.fjordlauncherreunlocked ];
            }
          )
        ];
      };
    };
}
```

## Installing the package ad-hoc (`nix shell`, `nix run`, etc.)

You can simply call the default package of this flake.

Example:

```shell
nix run github:Cfauto28/FjordLauncherReUnlocked

nix shell github:Cfauto28/FjordLauncherReUnlocked

nix profile install github:Cfauto28/FjordLauncherReUnlocked
```

## Installing the package directly (`fetchTarball`)

We use flake-compat to allow using this Flake on a system that doesn't use flakes.

Example:

```nix
{ pkgs, ... }:
{
  environment.systemPackages = [
    (import (
      builtins.fetchTarball "https://github.com/Cfauto28/FjordLauncherReUnlocked/archive/develop.tar.gz"
    )).packages.${pkgs.system}.fjordlauncherreunlocked
  ];
}
```

### Using the overlay (`fetchTarball`)

Alternatively, if you don't want to use our `packages` output, you can add our overlay to your instance of nixpkgs.
This results in Fjord using your system's libraries

Example:

```nix
{ pkgs, ... }:
{
  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball "https://github.com/Cfauto28/FjordLauncherReUnlocked/archive/develop.tar.gz"
    )).overlays.default
  ];

  environment.systemPackages = [ pkgs.fjordlauncherreunlocked ];
}
```

### Installing the package ad-hoc (`nix-env`)

You can add this repository as a channel and install its packages that way.

Example:

```shell
nix-channel --add https://github.com/Cfauto28/FjordLauncherReUnlocked/archive/develop.tar.gz fjordlauncherreunlocked

nix-channel --update fjordlauncherreunlocked

nix-env -iA fjordlauncherreunlocked.fjordlauncherreunlocked

```

## Package variants

This repository offers the following packages:

- `fjordlauncherreunlocked` - The preferred build, wrapped with everything necessary to run the launcher and Minecraft
- `fjordlauncherreunlocked-unwrapped` - A minimal build that allows for advanced customization of the launcher's runtime environment

## Customizing wrapped packages

The wrapped package (`fjordlauncher`) offers some build parameters to further customize the launcher's environment.

The following parameters can be overridden:

- `additionalLibs` (default: `[ ]`) Additional libraries that will be added to `LD_LIBRARY_PATH`
- `additionalPrograms` (default: `[ ]`) Additional libraries that will be added to `PATH`
- `controllerSupport` (default: `isLinux`) Turn on/off support for controllers on Linux (macOS will always have this)
- `gamemodeSupport` (default: `isLinux`) Turn on/off support for [Feral GameMode](https://github.com/FeralInteractive/gamemode) on Linux
- `jdks` (default: `[ jdk21 jdk17 jdk8 ]`) Java runtimes added to `FJORDLAUNCHER_JAVA_PATHS` variable
- `msaClientID` (default: `null`, requires full rebuild!) Client ID used for Microsoft Authentication
- `textToSpeechSupport` (default: `isLinux`) Turn on/off support for text-to-speech on Linux (macOS will always have this)
