---
description: Editing and Replacing videos in CyberPunk 2077 with
---

# Videos: .bk2 Editing





<figure><img src="../../../.gitbook/assets/image (672).png" alt="" width="433"><figcaption></figcaption></figure>





This wiki page is about the .bk2 file format used in the game, and how to edit them.

## TL;DR

The .bk2 file format is used in many games including Cyberpunk 2077. It stands for [Bink 2 By Rad Tools ](https://www.radgametools.com/bnkmain.htm)and needs to be used to extract and recompress the video that you want to replace.&#x20;

It is recommended to export to MP4 (recommended) or single frames using. \
Converting to back to .bk2 requires a [byte offset](videos-.bk2.md#byte-offset-requirement) for the video to appear in the game.

## Prerequisites

* WolvenKit (obviously)
* RAD Video Tools (available [here](https://www.radgametools.com/bnkdown.htm), 2mo)

## Selecting A Video File

[Searching in the asset browser](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/usage/wolvenkit-search-finding-files) for .bk2 files will get you every video in the game. For this example we will be using the boxing video (q001\_boxinggame.bk2)&#x20;

For this tutorial, visit Viktor's RipperDoc, the boxing video consistantly plays on his screen.&#x20;

<figure><img src="../../../.gitbook/assets/image (660).png" alt=""><figcaption></figcaption></figure>

[Add](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/editor/asset-browser#adding-files-to-projects) `q001_boxinggame.bk2` to your project

### Locating video file on your computer

Click Open In Windows Explorer   &#x20;

<figure><img src="../../../.gitbook/assets/image (661).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (662).png" alt=""><figcaption></figcaption></figure>

### Give it a Play

<figure><img src="../../../.gitbook/assets/image (663).png" alt="" width="365"><figcaption></figcaption></figure>

Converting to a common file format

<figure><img src="../../../.gitbook/assets/image (667).png" alt=""><figcaption></figcaption></figure>

1. Open RAD Video Editor and browse to (`\source\archive\base\movies\fluff`)&#x20;
2. Select File
3. Convert

### Output Options



<figure><img src="../../../.gitbook/assets/image (666).png" alt=""><figcaption></figcaption></figure>



1. Convert&#x20;
2. Defaults to MP4, keep it.

### Video Specifications:

**Length:** Should match **the converted .mp4**

**Export:** MP4

**Size:** 480p

**FPS:** 15fps is the game speed, 30fps is possible, but not recommended.&#x20;

<figure><img src="../../../.gitbook/assets/image (669).png" alt=""><figcaption></figcaption></figure>



<figure><img src="../../../.gitbook/assets/image (670).png" alt=""><figcaption></figcaption></figure>

<mark style="color:$danger;">**You must export to Bink 2.**</mark>

## Byte Offset requirement

For reasons unknown, CyberPunk requires the **4th byte** of your .bk2 file to to be changed to: `6A`

Once your bk2 file has been created, you will need to edit the file with a hex editor.&#x20;

[HxD](https://mh-nexus.de/en/hxd/) is a good windows solution that is free. <br>

![](<../../../.gitbook/assets/image (671).png>)

Change the 4th byte to 6A and save to: `source\archive\base\movies\fluff`



### [Install Your Mod](https://wiki.redmodding.org/wolvenkit/wolvenkit-app/menu/toolbar#install-mod)

Since the working directory is RAW, there is no need to import.





Notes:

[YouTube Video](https://www.youtube.com/watch?v=FUtSw5VsNzI) for more on RAD Tools.&#x20;

[Discord](https://discord.gg/redmodding) community.



### <mark style="color:green;">Python Script</mark>: Automate byte offset all .bk2 files

This will automatically change the byte offset in all your .bk2 files at once in the cwd and subdirs. <br>

```python
import os
import glob

def modify_fourth_byte(file_path):
    """
    Opens a file in read/write binary mode and overwrites 
    the 4th byte (index 3) with 0x6A.
    """
    try:
        # Print the filename as processing begins
        print(f"Working on: '{file_path}'...", end=" ", flush=True)

        # Check file size before opening
        file_size = os.path.getsize(file_path)
        
        if file_size < 4:
            print(f"\nSkipping: File is only {file_size} bytes (needs at least 4).")
            return

        with open(file_path, "r+b") as f:
            # Navigate to 4th byte (index 3) and overwrite
            f.seek(3)
            f.write(bytes([0x6A]))
            
        print("Done (4th byte set to 0x6A).")
        
    except PermissionError:
        print(f"\nError: Permission denied for '{file_path}'.")
    except Exception as e:
        print(f"\nAn unexpected error occurred with '{file_path}': {e}")

def main():
    # Use recursive glob pattern to find files in all subdirectories
    # '**/*.bk2' tells glob to look in current and all sub-folders
    bk2_files = glob.glob("**/*.bk2", recursive=True)

    if not bk2_files:
        print("No .bk2 files found in the current directory or subdirectories.")
        return

    print(f"Found {len(bk2_files)} file(s) across all directories. Starting processing...")

    for file_path in bk2_files:
        modify_fourth_byte(file_path)

    print("-" * 30)
    print("Batch processing complete.")

if __name__ == "__main__":
    main()
```



Authors note: Thank you to `Dark Fortune Teller on` [Discord](https://discord.gg/redmodding)&#x20;



