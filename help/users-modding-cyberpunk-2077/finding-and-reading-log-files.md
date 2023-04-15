# Finding and reading log files

## Finding the log files

1. Browse to your **Cyberpunk game folder** and use the windows search to search for `*.log.`

{% hint style="warning" %}
Make sure to include the asterisk and the dot: \*`.log`, as you will otherwise see files that you don't care about.
{% endhint %}

{% hint style="info" %}
Make sure to run this **in the game's root folder**, unless you have already narrowed down the problem (e.g. if it's a CET mod, you can run this search in `bin\x64\plugins\cyber_engine_tweaks`).
{% endhint %}

The list of results should look like this:

<figure><img src="../../.gitbook/assets/userguide_logs.png" alt=""><figcaption><p>This will give you a long list of log files</p></figcaption></figure>

{% hint style="info" %}
You can sort this list by file size, name, or date modified by clicking on the corresponding header.
{% endhint %}

With a few exceptions, log files **have the name of their mod**. If they don't, check what folder they're in.

## There's too many of them!

If you're drowning in log files and have no idea how to filter them, you can **delete** **or remove** them. Don't worry, they will be re-created on next launch.

{% hint style="danger" %}
Don't delete anything that isn't Type: `Text Document` ending in `.log`! Doing that will break other mods or even your entire install.
{% endhint %}

Now, restart your game and do whatever you did to make the error appear. Then, search the Cyberpunk directory for `*.log` again.

## Finding the relevant log file

{% hint style="info" %}
You can ignore files that&#x20;

* have a `date modified` older than your last game launch: they won't have any information about your problem
* have a size of 0: they're empty, the mod in question never initialized.
{% endhint %}

1. Sort the files by `size` (if you just deleted them) or by `date modified` (if you didn't)
2. Open each of the files in a text editor (such as Notepad, it's installed with Windows). The relevant information will be at the very bottom.
3. You are looking for lines with `error` or `warning`. If you want to see what they look like, scroll down to the [next section](finding-and-reading-log-files.md#making-sense-of-them).
   1. If the log file doesn't have any, ignore it. Close it and proceed to the next file.
   2. You found errors: Congratulations, you've  found at least silver. Check [here](finding-and-reading-log-files.md#error) for how to proceed.
   3. You found warnings: These _might_ indicate that you're on to something, but don't let them panic you. If the mod is doing what it should, just ignore them. You can [start troubleshooting](finding-and-reading-log-files.md#warning) already, or keep looking for errors.

## Making sense of them

### Error

{% hint style="success" %}
There's definitely something going on here, you're on the right track!
{% endhint %}

Errors look like this:

```
[2023-04-15 12:04:18.956] [error] |Something| Some Explanation
[2023-04-14 20:28:18 UTC+01:00] [1234] [ErrorSource]  DoSomething(): Error ! Some Explanation: Some Details
```

An error in the log files almost always means that something exploded in a way that nobody has planned for.&#x20;

* If the file is **directly** in `bin\x64\plugins\cyber_engine_tweaks`, that means CET is broken and you need to [troubleshoot it](../../modding-know-how/user-guide-troubleshooting/#dealing-with-a-broken-mod).&#x20;
* If the file is **in a subfolder** of `bin\x64\plugins\cyber_engine_tweaks`, you have found a broken mod, but CET mods won't break the game. In this case, treat it like a [warning](finding-and-reading-log-files.md#warning).
* If the log is anywhere else, you have found [something to troubleshoot](../../modding-know-how/user-guide-troubleshooting/#dealing-with-a-broken-mod).

### Warning

{% hint style="info" %}
If the mod with the warnings is working, you can ignore them.\
If the game is crashing or if you can't find any errors, you can try the [bisect method](../../modding-know-how/user-guide-troubleshooting/#finding-the-broken-mod-bisecting) or [troubleshoot it](../../modding-know-how/user-guide-troubleshooting/#dealing-with-a-broken-mod) and hope that you're lucky.
{% endhint %}

If your warning isn't listed below, use your own best judgement.

#### Field with this name is already defined

```
[WARN - Thu, 13 Apr 2023 21:54:13 +0200] At Path\to\Cyberpunk 2077\r6\scripts\something.reds:1234:1:
@addField(inkScrollArea)
^^^
field with this name is already defined in the class, this will have no effect
```

This **might** indicate that a Redscript mod is loaded twice. Search the Cyberpunk root folder the mod name and make sure that you have no duplicates. If you're uncertain about this, try the [bisect method](../../modding-know-how/user-guide-troubleshooting/#finding-the-broken-mod-bisecting) on your `r6` folder.
