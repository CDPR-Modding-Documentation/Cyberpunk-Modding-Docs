---
description: How to get mods working on the MacOS build of Cyberpunk 2077
---

# Modding on macOS

{% hint style="danger" %}
This guide is currently a work in progress.
{% endhint %}

{% hint style="info" %}
#### Modding Support on MacOS (or Lack Thereof)

At the time of writing, the only framework mod that is unofficially supported on the MacOS build of Cyberpunk 2077 is [redscript](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/-McniwB8YOK2HnJ7SYg_/) starting with the 0.5.29 build. As such, the only mods that are supported on MacOS are pure **redscript-only** mods (i.e. no Codeware, no ArchiveXL, etc.)

Additionally, due to the security features built into MacOS, modding the game is possible, but much more annoying. You'll get a lot of scary-looking warnings and permission requests, but this is normal. Don't worry! We'll go through all of them here.
{% endhint %}

## Getting Started

{% stepper %}
{% step %}
**Download redscript for macOS**

Find the latest release on the [GitHub Releases](https://github.com/jac3km4/redscript/releases/) for redscript

{% hint style="warning" %}
Be sure to download `redscript-vX.X.XX-macos.zip` , NOT `redscript-cli-aarch64-darwin` !
{% endhint %}
{% endstep %}

{% step %}
**Install redscript to your game directory**

Copy the contents of the zip/folder to your Cyberpunk 2077 install folder (the one with `Cyberpunk2077.app`). The default locations can be found here:

* GOG: `/Applications/Cyberpunk 2077/`
* Steam: `~/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/`
* App Store: `/Applications/Cyberpunk2077.app/Contents/Data/`
{% endstep %}

{% step %}
**Unblock redscript in macOS**

Open the Terminal app and run the following command to tell MacOS redscript is safe to run:

* GOG:

```bash
xattr -r -d com.apple.quarantine "/Applications/Cyberpunk 2077/engine/tools/"
```

* Steam:

```bash
xattr -r -d com.apple.quarantine "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/engine/tools/"
```

* App Store:

```bash
xattr -r -d com.apple.quarantine "/Applications/Cyberpunk2077.app/Contents/Data/engine/tools/"
```
{% endstep %}

{% step %}
**Download input loader for macOS**

Find the latest release on the [GitHub Releases](https://github.com/risner/cyberpunk2077-input-loader-mac/releases/) for redscript
{% endstep %}

{% step %}
**Install input loader to your game directory**

Copy the contents of the zip/folder to your Cyberpunk 2077 install folder (the one with `Cyberpunk2077.app`). The default locations can be found here:

* GOG: `/Applications/Cyberpunk 2077/`
* Steam: `~/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/`
* App Store: `/Applications/Cyberpunk2077.app/Contents/Data/`
{% endstep %}

{% step %}
**Make sure your script is executable**

* GOG:

```bash
chmod +x "/Applications/Cyberpunk 2077/launch_modded.sh"
```

* Steam:

```bash
chmod +x "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/launch_modded.sh"
```

* App Store:

```bash
chmod +x "/Applications/Cyberpunk2077.app/Contents/Data/launch_modded.sh"
```
{% endstep %}
{% endstepper %}

## Running Cyberpunk 2077 on macOS with redscript

The MacOS build of Cyberpunk 2077 will not start redscript automatically like the Windows build. Therefore, any redscript mods you install will not be included in the game automatically, but you don't have to run the script every time, only with new mods or updates **to let them compile**. You have three options:

### 1. Link bash script to your game client

_a) GOG:_

1. Launch GOG Galaxy → **Cyberpunk 2077 → More → Manage Installation → Configure → Add another executable / arguments**
2.  Locate the game path and ensure to select the script

    ```
    /Applications/Cyberpunk 2077/launch_modded.sh
    ```
3. Press **Select an executable to link,** ensure **Default executable** is **checked** and press **OK**.

Now GOG Galaxy will run your script whenever you press **Play**.

_b) Steam:_

Steam does not let you choose a different executable on macOS, so the workaround is to temporarily replace the top-level launcher with the script.

1. Rename the executable inside `Cyberpunk2077.app` :

```bash
mv "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077.app/Contents/MacOS/Cyberpunk2077" \
   "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077.app/Contents/MacOS/Cyberpunk2077_real"
```

2. Using your preferred text editor (use `TextEdit` if you do not have another one), update `launch_modded.sh` so it uses a fixed macOS path, changes into the game directory before running the tools, and launches the renamed executable:

```bash
#!/usr/bin/env bash
game_dir="$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077"

cd "$game_dir" || exit 1

"$game_dir/engine/tools/scc" -compile "$game_dir/r6/scripts"
perl "$game_dir/engine/tools/inputloader.pl"
exec "$game_dir/Cyberpunk2077.app/Contents/MacOS/Cyberpunk2077_real" "$@"
```

Save the file with `Command` + `S`.

3. Rename the launch script to executable:

```bash
mv "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/launch_modded.sh" \
   "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077"
```

4. Make sure it's executable:

<pre class="language-bash"><code class="lang-bash"><strong>chmod +x "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077"
</strong></code></pre>

If you want to undo this later, restore the original launcher and put the script back:

```bash
mv "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077.app/Contents/MacOS/Cyberpunk2077_real" \
   "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077.app/Contents/MacOS/Cyberpunk2077"

mv "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/Cyberpunk2077" \
   "$HOME/Library/Application Support/Steam/steamapps/common/Cyberpunk 2077/launch_modded.sh"
```

_c) App Store_

Some values within `launch_modded.sh` will need to be edited for it to launch the game correctly.

1. Adjust `launch_modded.sh` to these changes using preferable text editor (use `Text Edit`, if you don't have any):

* Locate following lines:

```bash
"$game_dir/Cyberpunk2077.app/Contents/MacOS/Cyberpunk2077"
```

* Replace it with following:

```bash
"$game_dir/../MacOS/Cyberpunk2077"
```

2. Make sure it's executable:

<pre class="language-bash"><code class="lang-bash"><strong>chmod +x "/Applications/Cyberpunk2077.app/Contents/Data/launch_modded.sh"
</strong></code></pre>

Be sure the script opens with Terminal by default, right click `launch_modded.sh` → Show info → Open with: → Select 'Terminal'

3. _(Optional)_ Create a shortcut to open more easily

```bash
ln -s "/Applications/Cyberpunk2077.app/Contents/Data/launch_modded.sh" "/Applications/Cyberpunk 2077 Modded"
```

### 2. Run the Included Bash Script to Start Cyberpunk 2077

* From Finder, double click the `launch_modded.sh` file in the `Cyberpunk 2077` folder

or

* From Terminal, `cd` to your Cyberpunk 2077 folder (the same as before) and run `./launch_modded.sh`

### 3. Manually run redscript, then launch the game normally

😏 (more to come)
