---
description: How to edit the in-game Main Menu and Pause Menu
---

# Main Menu and Pause Menu editing

<figure><img src="../../../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

## File paths



Open WolvenKit and create a New Project&#x20;

* on the new Project go to Asset Browser and find the the following paths:

First Path is for the Main Menu (after the Breaching Screen)

```
base\gameplay\gui\fullscreen\main_menu\singleplayer_menu.inkwidget
```

The Second Path is for Pause Menu when you press ESC:

```
base\gameplay\gui\fullscreen\pause_menu\pause_menu.inkwidget
```

Add both files to your new Project.



**Editing the files:**

Select the Inkwidget that you want to edit and choose "open this file" option

This guide is valid for both files (main menu and pause menu)

<div align="left">

<figure><img src="../../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

</div>

From here move to the new open window were we are going to start editing our menu and you should see something like this:

<figure><img src="../../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

#### Button Size:

Follow this exact file structure and here you can change the button size:

<figure><img src="../../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2023-11-24 232341.png" alt=""><figcaption></figcaption></figure>

Change the values to Negative side to make the buttons smaller or to Positive to make them bigger.



**Button Spacing**:

Same rule apply as Button Size and the path for it can be fond here:

<figure><img src="../../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2023-11-24 232317.png" alt=""><figcaption></figcaption></figure>

Again, change the values to Negative side to make the spacing smaller or to Positive to make the spacing bigger.



**Button Inner Shadow:**

Same rule apply as the other two and the path for it can be found here:

<figure><img src="../../../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2023-11-24 232300.png" alt=""><figcaption></figcaption></figure>

Here change the values to negative ones (except Right value - Changing that will make the shadow to not fill the button on the right side) as we want the inner button drop shadow to fit inside button rectangle.



**Inner Writing Font Size:**

Same rule apply as the others and the path for it can be found here:

<figure><img src="../../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/Screenshot 2023-11-25 160303.png" alt=""><figcaption></figcaption></figure>

Here is entirely up to you, how big or small you want the font (default size is 50) and as usual, bigger number makes the font bigger and smaller number makes the font smaller



_**If everything is done correctly, you should end up with something like this:**_

![](<../../../.gitbook/assets/Screenshot 2023-11-25.png>)&#x20;
