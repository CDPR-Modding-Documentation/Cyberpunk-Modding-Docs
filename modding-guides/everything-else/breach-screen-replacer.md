---
description: How to replace a game video with your own (mp4 to bk2)
---

# Video Replacer - Breach Screen

## Summary

**Published:** April 2024 by @DBK\
**Last documented update:** Sep 20 2025 by [mana vortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide will show you how to replace the Breach Screen with your own custom video by creating a `.bk2` video from an `.mp4`.

Other video formats will not be covered in this guide.

{% hint style="info" %}
Keep in mind that the Breach Screen is limited to 10 seconds and will play in a loop.
{% endhint %}

## Tools needed:

* WolvenKit
* RAD Video Tools
* Your own custom video (length <= 10 seconds)

## Step 1: Convert your MP4 video file

Download and install [_RAD Video Tools_](https://www.radgametools.com/bnkdown.htm) (no assistance with this, you can do it)

1. Open _RAD Video Tools_ and browse your _video file_ that that will replace the _Breach Screen_

<figure><img src="../../.gitbook/assets/image (242).png" alt=""><figcaption></figcaption></figure>

2. Select the video file and click _Bink it!_

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-02 190658.png" alt=""><figcaption></figcaption></figure>

3. As destination file name, you put the name of your video and the extension bk2 (e.g  _splash\_logo.bk2_)&#x20;
4. Click _Bink_

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-02 190955.png" alt=""><figcaption></figcaption></figure>

5. After the conversion is done, your newly created file will be next to your custom video

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-02 191443.png" alt=""><figcaption></figcaption></figure>

6. Click Done and you have your own video converted to bk2 format and ready to replace the original one

## Step 2: Create a mod

1. Open WolvenKit and [create a new project](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#create-a-new-wolvenkit-mod-project)
2. Find the A[sset Browser](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser)
3. Find _splash\_logo.bk2_ in the following location:

```
base\movies\fullscreen\e3_2020_loading\
```

4. Add that file to your Project and your project should look like this

<figure><img src="../../.gitbook/assets/image (240).png" alt=""><figcaption></figcaption></figure>

5. Select _`splash_logo.bk2`_ and right-click it&#x20;
6. Select "Open in Explorer". This will open Windows Explorer in the correct folder.
7. Copy your own converted video in this location and replace the original one
8. Go back to WolvenKit and save you changes
9. Now you are ready to [install the mod](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/menu/toolbar#install-mod). You can do this from the Wolvenkit toolbar:

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-02 192526 (1).png" alt=""><figcaption></figcaption></figure>

## Test and HYPE

If you did everything correctly, you should now have your very own custom Breach Screen.

{% hint style="success" %}
Congratulations! You are now a modder!
{% endhint %}

## Troubleshooting

### My video is cut off!

The video can't be longer than 10 seconds - there was a box at the beginning of the guide telling you about this.

### My video is black!

You most likely ran into a conversion issue. If you manage to fix it, please [update this guide](https://app.gitbook.com/invite/-MP5ijqI11FeeX7c8-N8/IZreyNnVlImKaeMtoJLY)!
