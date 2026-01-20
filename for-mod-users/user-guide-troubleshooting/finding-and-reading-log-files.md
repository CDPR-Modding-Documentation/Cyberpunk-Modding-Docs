---
description: This page will tell you how to find the right log file for your problem.
---

# Finding and Reading Log Files

## Summary

Last documented update: January 19th, 2026 by [minnierylands](https://app.gitbook.com/u/VSIYzNHUyRPaBCk2ExHhQzpPfo82 "mention")

This section has a list of log files by framework. If you've arrived here from one of the troubleshooting channels on [Discord](https://discord.gg/redmodding), the file you're supposed to find is most likely in this list.

If you aren't looking for a particular log file, please proceed to [the next section](finding-and-reading-log-files.md#finding-the-log-files).

***

## A List Of Framework Logfiles

{% hint style="info" %}
The paths below are given **relative** to your [**Cyberpunk 2077 install directory**](#user-content-fn-1)[^1]**.**
{% endhint %}

<table><thead><tr><th width="294">Name of framework</th><th>Path to log file</th></tr></thead><tbody><tr><td>redscript</td><td><code>r6\logs\redscript_rCURRENT.log</code></td></tr><tr><td>red4ext</td><td><code>red4ext\logs\red4ext.log</code></td></tr><tr><td>ArchiveXL</td><td><code>red4ext\plugins\ArchiveXL\ArchiveXL.log</code></td></tr><tr><td>TweakXL</td><td><code>red4ext\plugins\TweakXL\TweakXL.log</code></td></tr><tr><td>Cyber Engine Tweaks</td><td><code>bin\x64\plugins\cyber_engine_tweaks\cyber_engine_tweaks.log</code></td></tr><tr><td>REDmod</td><td><code>tools\redmod\bin\REDmodLog.txt</code></td></tr></tbody></table>

***

## Finding The Log Files

If you don't want to download and run script files from the internet, you can go [here](finding-and-reading-log-files.md#alternatively-by-hand) and complete the steps by hand. Otherwise:

1. Go to DocPresto's [github repository](https://github.com/DoctorPresto/Cyberpunk-Helper-Scripts/blob/main/FindAllErrors.bat) and click the download button:

<figure><img src="../../.gitbook/assets/download_from_github.png" alt=""><figcaption><p>You can download any file from github like that</p></figcaption></figure>

2. This will download a .bat script (it should be called `findAllErrors.bat` or similar)
3. Move it to your [**Cyberpunk game folder**](#user-content-fn-1)[^1]
4. Double-click it
5. The script will show you two options.
   1. **Option 1 (recommended):** Delete all old log files
      1. Type 1 and press Enter. The script will delete all old log files for you.
      2. Wait until the game has started (the script will do that as well)
      3. Do whatever you need to do to make your problem appear
      4. Start the script again
   2. Option 2: Scan log files
      1. The script will scan your cyberpunk directory and open a .txt file with anything it finds, separated by file.
      2. You can now look at [#making-sense-of-them](finding-and-reading-log-files.md#making-sense-of-them "mention") to understand the individual error messages, or go back to the discord channel where people told you to grab this script.

***

### Alternatively: By Hand

Browse to your [**Cyberpunk game folder**](#user-content-fn-1)[^1] and use the windows search to search for `*.log.`

{% hint style="warning" %}
Make sure to include the asterisk and the dot: \*`.log`, as you will otherwise see files you don't care about.
{% endhint %}

{% hint style="info" %}
Make sure to run this [**in the game's root folder**](#user-content-fn-1)[^1], unless you have already narrowed down the problem (e.g. if it's a CET mod, you can run this search in `bin\x64\plugins\cyber_engine_tweaks`).
{% endhint %}

The list of results should look like this:

<figure><img src="../../.gitbook/assets/userguide_logs.png" alt=""><figcaption><p>This will give you a long list of log files</p></figcaption></figure>

{% hint style="info" %}
You can sort this list by `file size`, `name`, or `date modified` by clicking on the corresponding header.
{% endhint %}

With a few exceptions, log files **have the name of their mod**. If they don't, check what folder they're in.

***

## There's Too Many Of Them!

If you're drowning in log files and have no idea how to filter them, you can **delete** **or remove** them. Don't worry, they will be re-created on next launch.

{% hint style="danger" %}
Don't delete anything that isn't Type: `Text Document` ending in `.log`! Doing that will break other mods or even your entire install.
{% endhint %}

Now, restart your game and do whatever you did to make the error appear. Then, search the Cyberpunk directory for `*.log` again.

***

## Finding The Relevant Log File

{% hint style="info" %}
You can ignore files that

* Have a `date modified` older than your last game launch: they won't have any information about your problem
* Have a size of 0: they're empty, the mod in question never initialized.
{% endhint %}

1. Sort the files by `size` (if you just deleted them) or by `date modified` (if you didn't)
2. Open each of the files in a text editor (such as Notepad, it's installed with Windows). The relevant information will be at the very bottom.
3. You are looking for lines with `error` or `warning`. If you want to see what they look like, scroll down to the [next section](finding-and-reading-log-files.md#making-sense-of-them).
   1. If the log file doesn't have any, ignore it. Close it and proceed to the next file.
   2. You found errors: Congratulations, you've found at least silver. Check [here](finding-and-reading-log-files.md#error) for how to proceed.
   3. You found warnings: These _might_ indicate that you're on to something, but don't let them panic you. If the mod is doing what it should, just ignore them. You can [start troubleshooting](finding-and-reading-log-files.md#warning) already, or keep looking for errors.

***

## Making Sense Of Them

### Error

{% hint style="success" %}
There's definitely something going on here, you're on the right track!
{% endhint %}

Errors look like this:

```
[2023-04-15 12:04:18.956] [error] |Something| Some Explanation
[2023-04-14 20:28:18 UTC+01:00] [1234] [ErrorSource]  DoSomething(): Error ! Some Explanation: Some Details
```

An error in the log files almost always means something exploded in a way nobody has planned for.

* If the file is **directly** in `bin\x64\plugins\cyber_engine_tweaks`, that means CET is broken and you need to [troubleshoot it](./#dealing-with-a-broken-mod).
* If the file is **in a subfolder** of `bin\x64\plugins\cyber_engine_tweaks`, you have found a broken mod, but CET mods won't break the game. In this case, treat it like a [warning](finding-and-reading-log-files.md#warning).
* If the log is anywhere else, you have found [something to troubleshoot](./#dealing-with-a-broken-mod).

***

### Warning

{% hint style="info" %}
If the mod with the warnings is working, you can ignore them.\
If the game is crashing or if you can't find any errors, you can try the [bisect method](./#bisecting) or [troubleshoot it](./#dealing-with-broken-mods) and hope you're lucky.
{% endhint %}

If your warning isn't listed below, use your own best judgement.

#### Field with this name is already defined

```
[WARN - Thu, 13 Apr 2023 21:54:13 +0200] At Path\to\Cyberpunk 2077\r6\scripts\something.reds:1234:1:
@addField(inkScrollArea)
^^^
field with this name is already defined in the class, this will have no effect
```

This **might** indicate that a Redscript mod is loaded twice. Search the Cyberpunk root folder the mod name and make sure you have no duplicates. If you're uncertain about this, try the [bisect method](./#bisecting) on your `r6` folder.

[^1]: The directory where your game is installed. It's most likely called Cyberpunk 2077. Contains the folders archive, bin, engine… and the REDprelauncher.exe
