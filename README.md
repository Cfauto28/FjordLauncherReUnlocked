# <img src="./program_info/org.Cfauto28.FjordLauncherReUnlocked.svg" alt="Fjord Launcher logo" width="96"/> Fjord Launcher ReUnlocked

Fjord Launcher ReUnlocked is a soft **fork** of Fjord Launcher Unlocked, which is a soft fork of Fjord Launcher, which is a soft fork of [Prism Launcher](https://github.com/PrismLauncher/PrismLauncher). It is **not** endorsed by nor affiliated with Fjord Launcher or Prism Launcher.

- No DRM

- [Support for alternative auth servers](doc/alternative-auth-servers.md)

See [doc/alternative-auth-servers.md](doc/alternative-auth-servers.md) for a non-exhaustive list of alternative authentication servers.

## Having a problem with the launcher?

**Do not** open an issue in the Prism Launcher repo, and **do not** ask about Fjord Launcher in the Prism Launcher Discord server. Instead, ask in #fjord-launcher in our [Matrix space](https://matrix.to/#/#unmojang:matrix.org), or [open an issue](https://github.com/Cfauto28/FjordLauncherReUnlocked/issues), in this repository.

## Install

### Nix

This repository contains a Nix flake:

```Shell
nix run github:Cfauto28/FjordLauncherReUnlocked
```

See [nix/README.md](nix/README.md) for details.

### Nightlys

You can get the builds from either the [actions workflow](https://github.com/Cfauto28/FjordLauncherReUnlocked/actions/workflows/build.yml) (Requires a Github account) or [nightly.link](https://nightly.link/Cfauto28/FjordLauncherReUnlocked/workflows/build/develop?preview)

## Building

To build the launcher yourself (required for macOS support), follow the [instructions on the Prism Launcher website](https://prismlauncher.org/wiki/development/build-instructions), but clone this repo instead.

## Notes

- You can easily use a custom version of Loki or authlib-injector on an instance. Select the instance in the main window, go to the Version tab, delete any Yggdrasil Agents if present, click "Add Agents", and select your Yggdrasil Agent JAR. If your JAR is not correctly identified, make sure the `Agent-Class` or `Premain-Class` field in the JAR's MANIFEST.MF matches either `moe.yushi.authlibinjector.Premain` or `org.unmojang.loki.Loki`.
