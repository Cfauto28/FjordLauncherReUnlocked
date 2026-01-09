# <img src="./program_info/org.unmojang.FjordLauncher.svg" alt="Fjord Launcher logo" width="96"/> Fjord Launcher ReUnlocked

Fjord Launcher ReUnlocked is a **fork** of Fjord Launcher Unlocked, which is a fork of Fjord Launcher, which is a fork of Prism Launcher. It is **not** endorsed by nor affiliated with Fjord Launcher or Prism Launcher.

## Advantages of this fork over Prism Launcher

- [Support for alternative auth servers](doc/alternative-auth-servers.md)

- Ability to download FTB modpacks from within the launcher

## Having a problem with the launcher?

**Do not** open an issue in the Prism Launcher repo, and **do not** ask about Fjord Launcher in the Prism Launcher Discord server. Instead, ask in #fjord-launcher in their [Matrix space](https://matrix.to/#/#unmojang:matrix.org), or open an issue [here](https://github.com/unmojang/FjordLauncher/issues).


## Building

To build the launcher yourself, follow the instructions on the Prism Launcher website, but clone this repo instead:

- [Here](https://prismlauncher.org/wiki/development/build-instructions/)

## Notes

- You can easily use a custom version of authlib-injector on an instance. Select the instance in the main window, click "Edit" (or Ctrl+I/Command+I), go to the Version tab, click "Add Agents", and select your authlib-injector JAR. If your JAR is not correctly identified as authlib-injector, make sure the `Agent-Class` field in the JAR's MANIFEST.MF is `moe.yushi.authlibinjector.Premain`.

- I'm not going to add anymore features, i'm just going to pull the changes that are made in upstream Fjord Launcher.
