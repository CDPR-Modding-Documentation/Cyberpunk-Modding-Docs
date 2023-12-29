---
description: I'm done, what's next?
---

# NPV: Cleanup and troubleshooting

## Re-path your folder

<details>

<summary>Why are we doing this?</summary>

When **packing** a mod, Wolvenkit generates an .archive file with the files in your project's `source` folder. The problem here is that each file can only be **modified once**.&#x20;

Assume both you and your friend make an NPV. They made Alice, you are making Bob. And because your friend was lazy, they didn't complete this step. And since their project is called `Alice_NPV.archive`,  none of your changes will even show!

That's why you'll have to re-path your folder. If you don't, you will ruin someone's day.

</details>

You need to **re-name the template folders**. Unless you want to make more NPVs, it will be enough to re-name `tutorial` to `your_username`. Find a full guide to the process under [moving-and-renaming-in-existing-projects.md](../../everything-else/moving-and-renaming-in-existing-projects.md "mention").

## Troubleshooting

### My NPV breaks AMM!

That's how you know that you have syntax errors in your NPV's `.lua` file. Copy the contents of the file into a [lua validator](https://www.tutorialspoint.com/execute\_lua\_online.php), then run the code and make sure to fix all errors.&#x20;

{% hint style="info" %}
It's usually missing quotation marks or commas. The tool above will give you a line number. Compare the line with the working template and fix the differences.

If you feel stuck, you can ask ChatGPT – just tell it that you're trying to fix LUA code, or it won't know the syntax.
{% endhint %}

### My NPV doesn't spawn!

#### You can't select them in AMM

The error is with your `.lua` file – either it's not in the correct folder, or AMM fails to load it.

#### If you can select the NPV in AMM

If you click on the button, but nothing happens, that means that the game can't find your `.ent` file. The error is between your `.lua` and your `.ent`.&#x20;

Most likely, the path to the .ent file is not correct. If it is, make sure that it has **no upper-case characters**.&#x20;

### Clothes are floating!

For each of the mesh components that aren't moving, expand it and find the `skinning` entry. Make sure that the `bindName` points at `root`:

<figure><img src="../../../../.gitbook/assets/npv_skinning_root.png" alt=""><figcaption></figcaption></figure>

### My NPV loads, but I'm getting a random appearance!

That happens when you're loading an appearance that the game doesn't know about — the problem is between your .lua file and your root entity. The names must match exactly, and must contain not typos or leading/trailing spaces.

<figure><img src="../../../../.gitbook/assets/npv_troubleshooting_lua_ent.png" alt=""><figcaption></figcaption></figure>

If that was not it, double-check the `path` in your lua file and make sure that it points to the correct .ent file, and not to a backup or backup project.&#x20;

{% hint style="info" %}
This particular problem is **always** between those two files. Other mistakes will have other effects.
{% endhint %}

### Another NPV is showing!

This is the reason for the [#re-path-your-folder](npv-cleanup-and-troubleshooting.md#re-path-your-folder "mention") section in this guide. If you want more information, read  [#why-are-we-doing-this](npv-cleanup-and-troubleshooting.md#why-are-we-doing-this "mention"). Otherwise, you can temporarily remove all other NPVs or make sure to complete the re-pathing.

### I'm getting errors in Wolvenkit!

{% hint style="info" %}
You can check the [Troubleshooting](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/getting-started/troubleshooting "mention")page on the Wolvenkit wiki.
{% endhint %}

#### It installs, but doesn't launch

Just install the mod via WKit, launch Cyberpunk the way you normally do.

