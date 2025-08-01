---
description: How to get mods working on the MacOS build of Cyberpunk 2077
---

# Modding on MacOS

{% hint style="info" %}
## Modding Support on MacOS (or Lack Thereof)

At the time of writing, the only framework mod that is unofficially supported on the MacOS build of Cyberpunk 2077 is [redscript](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg_/) starting with the 0.5.29 build. As such, the only mods that are supported on MacOS are pure **redscript-only** mods (i.e. no Codeware, no ArchiveXL, etc.)

Additionally, due to the security features built into MacOS, modding the game is possible, but much more annoying. You'll get a lot of scary-looking warnings and permission requests, but this is normal. Don't worry! We'll go through all of them here.
{% endhint %}

## Getting Started

{% stepper %}
{% step %}
### Download redscript for MacOS

Find the latest release on the [GitHub Releases](https://github.com/jac3km4/redscript/releases/) for redscript

{% hint style="warning" %}
Be sure to download `redscript-v0.5.xx-macos.zip` , NOT `redscript-cli-aarch64-darwin` !
{% endhint %}
{% endstep %}

{% step %}
### Install redscript to Your Game Directory

Copy the contents of the zip/folder to your Cyberpunk 2077 install folder (the one with `Cyberpunk2077.app`). The default locations can be found here:

* Steam: `~/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/`
* AppStore: `/Applications/Cyberpunk 2077/`&#x20;
{% endstep %}

{% step %}
### Unblock redscript in MacOS

Open the Terminal app and run the following command to tell MacOS redscript is safe to run:

* Steam:

```
xattr -r -d com.apple.quarantine ~/Library/Application\ Support/Steam/steamapps/common/Cyberpunk\ 2077/engine/tools
```

* AppStore:

```
xattr -r -d com.apple.quarantine "/Applications/Cyberpunk 2077/engine/tools/
```
{% endstep %}
{% endstepper %}

## Running Cyberpunk 2077 on MacOS with redscript

The MacOS build of Cyberpunk 2077 will not start redscript automatically like the Windows build. Therefore, any redscript mods you install will not be included in the game automatically. You have three options:

### 1. Run the Included Bash Script to Start Cyberpunk 2077

* From Finder, double click the `launch_modded.sh` file in the `Cyberpunk 2077` folder

or

* From Terminal, `cd` to your Cyberpunk 2077 folder (the same as before) and run `./launch_modded.sh`&#x20;

### 2. Manually Run redscript, Then Launch Normally

### 3. ~~REDACTED~~

😏 (more to come)
