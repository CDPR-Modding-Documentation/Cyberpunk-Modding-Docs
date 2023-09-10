---
description: Unbundling mods with CLI
---

# Legacy: Analysing other mods with Wolvenkit Console

{% hint style="warning" %}
This technique is outdated as of 2023. If you don't have a very good reason why you need Wolvenkit console, then you should [stick to the GUI](./#step-1-switch-to-mod-browser).
{% endhint %}

## wolvenkit.cli.exe

{% hint style="warning" %}
You need to download the **WolvenKit.Console** version for this, rather than the regular one.&#x20;
{% endhint %}

1. **Optional, but recommended:** Make sure that your downloaded .archive is inside a folder with no other items.
2. Open WIndows Command _(press Windows+R and type `cmd`, then press enter)._&#x20;
3. Drag and drop WolvenKit.cli.exe into the command window
4. Type a space
5. Type `unbundle -p`
6. Type another space
7. Drag and drop the archive you downloaded into the command window.

You will now see something like

```
"C:/Path/to/Wolvenkit.cli.exe" unbundle -p "D:/Path/to/subdir/downloaded.archive"
```

{% hint style="danger" %}
If your paths contain spaces or special characters, make sure that they are surrounded by quotation marks as in the example above, or the command **will** fail.
{% endhint %}

If you press enter now, WolvenKit will unpack the archive, putting the contents into the same directory.&#x20;

<pre><code>- Path
  - to
<strong>    - subdir
</strong>        archive.archive
        - base

</code></pre>

{% hint style="success" %}
You can now copy the extracted folders to your WolvenKit project's `archive` folder.
{% endhint %}
