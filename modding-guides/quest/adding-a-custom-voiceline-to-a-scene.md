# Adding a custom voiceline to a scene

## Summary

**Created:** September 02 2026 by [@chromoxolon](https://www.nexusmods.com/profile/Chromoxolon)\
**Last documented update:** September 02 2026 by [@chromoxolon](https://www.nexusmods.com/profile/Chromoxolon)

This article will cover all the necessary steps needed to add a custom voice line you created to a scene, replicating the base game logic, meaning no scripting is necessary.\
\
By the end of this article you will know how to convert a **`.wav`** file to **`.wem`** using Wwise and how to successfully integrate it in your scene.

## Requirements

**This article assumes that:**

1. You have a basic understanding of scenes and scene actors.
2. You know how to create and add Dialog lines to a scene.
3. You know how to add a scnDialogLineEvent to a section node.

The points above will not be covered, this article focuses on custom audio specifically.

**Before we begin there are also 3 other requirements:**

1. Having Wwise installed
2. Your custom voiceline of choice in **`.wav`** audio format
3. [ArchiveXL](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/core-mods-explained/archivexl)<br>

**But why?**\
Wwise is the program responsible for playing all the sounds in the game. You can freely download it [here](https://www.audiokinetic.com/en/download/), it will ask you to create an account. We need Wwise because we will use it to convert your voice line to **`.wem`** , which is an audio format that the game can understand and play.

Your voice line also has to be in **`.wav`** because Wwise only imports files in that format. If your voice line is in another audio format like **`.mp3`** you will need to convert it to **`.wav`** first.

{% hint style="info" %}
**Tip:** If you are recording the custom voice lines yourself, you should generally record/export directly in **`.wav`**. Most recording software should support this option, saving you an extra conversion step, yay!
{% endhint %}

So to summarize we will need Wwise to convert **`.wav`** files to **`.wem`** files, so the game can play them!

Once you have those three requirements, we are ready to proceed!

## Converting .wav to .wem files through Wwise

If your **Wwise** installation was successful you can find the program in your system as **Wwise Launcher**. Let's go ahead and launch it.

<figure><img src="../../.gitbook/assets/custom voicelines - 1.png" alt=""><figcaption></figcaption></figure>





Once open you will notice that the program window is called **AudioKinetic Launcher**. Go ahead and click on the tab called **`Wwise`.** From here you can install and launch multiple different versions of Wwise without them conflicting with each other. For our particular use case, we specifically need version **2023.1.14.** Select that version from the dropdowns and click **`Install`**.

{% hint style="warning" %}
**info:** This specific version is a hard requirement as it is the one currently used in the game. If you use any other version your audio file might not be recognized at all. Credit goes to **@arman\_iii** for finding this out.
{% endhint %}

<figure><img src="../../.gitbook/assets/custom voice lines - 2.png" alt=""><figcaption></figcaption></figure>

You will now see some checkbox options. Leave everything as default and click **`Next`**.

<figure><img src="../../.gitbook/assets/custom voice lines - 3.png" alt=""><figcaption></figcaption></figure>

You will be presented with an option to choose plugins. Once again leave as default and click **`Install`**.

<figure><img src="../../.gitbook/assets/custom voice lines - 4.png" alt=""><figcaption></figcaption></figure>

Version **2023.1.14** will now install and once ready we can go ahead and launch it.

<figure><img src="../../.gitbook/assets/custom voice lines - 5.png" alt=""><figcaption></figcaption></figure>

Now we have successfully launched Wwise for the first time! You will be greeted by a project launcher window. Let's go ahead and click the **`New...`** button.

<figure><img src="../../.gitbook/assets/custom voice lines - 6.png" alt=""><figcaption></figcaption></figure>

Here we will name our project whatever we want, i named mine **`cyberpunkwav2wem`** for example. You can also change the location of your project if you so desire, although it is not necessary. Leave everything else as default and press the **`OK`** button.

<figure><img src="../../.gitbook/assets/custom voice lines - 7.png" alt=""><figcaption></figcaption></figure>

Now we are going to select **`Project`** in the top menu bar, then open **`Project Settings`.**

<figure><img src="../../.gitbook/assets/custom voice lines - 8.png" alt=""><figcaption></figcaption></figure>

In the **Project Settings** window select the **`Source Settings`** tab and click the box next to the Default Conversion Settings bar.

<figure><img src="../../.gitbook/assets/custom voice lines - 9.png" alt=""><figcaption></figcaption></figure>

Here we will select the **`Vorbis Quality High`** option and click **`OK`**

<figure><img src="../../.gitbook/assets/custom voice lines - 10.png" alt=""><figcaption></figcaption></figure>

As you can see the Default Conversion Settings have now successfully changed to **Vorbis Quality High**. We can now click **`OK`** to close the window.

<figure><img src="../../.gitbook/assets/custom voice lines - 11.png" alt=""><figcaption></figcaption></figure>

Now we will once again select **`Project`** in the top menu bar, then select **`Import Audio Files`.**

<figure><img src="../../.gitbook/assets/custom voice lines - 12.png" alt=""><figcaption></figcaption></figure>

Make sure the **`Import as:`** drop down is set to **Sound SFX**. Then you can click the **`Add Files..`**  button and select the **`.wav`** audio files you want to import. You can import one or several. Before clicking the import button you can preview your chosen files as shown by the green box below. Once you are ready to proceed click the **`Import`** button.

<figure><img src="../../.gitbook/assets/custom voice lines - 13.png" alt=""><figcaption></figcaption></figure>

Now in the **Project Explorer** panel located in the leftside of the screen select the **`ShareSets`** tab. In that tab select **`Vorbis Quality High`** from the list, it should open a panel with the same name. In that panel make sure:

1. **Channels** is set to **Mono**
2. **Sample rate** is set to **48000**
3. **Format** is set to **Vorbis** (it likely already is)

Also all the files we previously imported should also appear in the Audio Source Table confirming you did everything correctly so far. Once everything is ready you can click the **`Convert`** button.

<figure><img src="../../.gitbook/assets/custom voice lines - 14.png" alt=""><figcaption></figcaption></figure>

A small window will popup, just press the **`Convert`** button once more.

<figure><img src="../../.gitbook/assets/custom voice lines - 15.png" alt=""><figcaption></figcaption></figure>

You have now successfully converted your **`.wav`** file to **`.wem`** ! To find the converted files we can open up windows explorer and navigate to your projects directory, likely:

```
C:\Users\YourUser\Documents\WwiseProjects\YourProjectName\.cache\Windows\Voices\English(US)
```

Just swap **`YourUser`** for your actual windows username and **`YourProjectName`** for the project name you chose in the beginning.&#x20;

{% hint style="info" %}
**Reminder:** If you changed the default project directory when creating the project you will have to look there instead.
{% endhint %}

<figure><img src="../../.gitbook/assets/custom voice lines - 16.png" alt=""><figcaption></figcaption></figure>

Copy the **`.wem`** files you converted, we will soon paste them in WolvenKit.&#x20;

{% hint style="warning" %}
**Info:** Any **`.dat`** files in the folder can be ignored.
{% endhint %}

You are now finally done with Wwise. Before you close the program make sure to save your project in case you want to create more **`.wem`** files in the future. This way you can reuse the settings we selected. You can re-open your project at any time, import new **`.wav`** files and quickly convert them to **`.wem`** .

On to wolvenkit now!

## Adding your .wem file to the scene

In your wolvenkit project you should create a folder for voiceovers, usually called **VO**. It would typically be under:

```
archive\mod\yourprojectname\localization\en-us\vo\
```

This is where we are our **`.wem`** audiofiles are going to live.

<figure><img src="../../.gitbook/assets/custom voice lines - 16 (1).png" alt=""><figcaption></figcaption></figure>

Once you have created that folder, hover it with your mouse and click the yellow folder icon button. This will open the windows file explorer in that location.&#x20;

<figure><img src="../../.gitbook/assets/custom voice lines - 17.png" alt=""><figcaption></figcaption></figure>

In the file explorer paste the **`.wem`** files you previously converted or copied. The file should successfully appear in your project as shown below.

<figure><img src="../../.gitbook/assets/custom voice lines - 18.png" alt=""><figcaption></figcaption></figure>

We will now create a **`voiceovermap.json`** file.&#x20;

{% hint style="info" %}
**Info:** This file is responsible for connecting the dialog lines in your scene to their corresponding `.wem` audio files. This means that when the game plays a specific dialog line event from your scene, it will automatically fetch your corresponding audio file voice line and play it alongside too.
{% endhint %}

Select **`File`** in the tool bar, then select **`+New File`** from the dropdown menu. This will open a popup window. In the popup window select a **`.json`** file (you can use the search bar to find it) and click **`Create`.**

<div><figure><img src="../../.gitbook/assets/custom voice lines - 19.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../.gitbook/assets/Screenshot 2026-09-01 231921.png" alt=""><figcaption></figcaption></figure></div>

You will now see a **`.json`** file in your project explorer, make sure to place it in the **VO** folder we recently created and name it something recognizable such as **`voiceovermap.json`**.&#x20;

<figure><img src="../../.gitbook/assets/custom voice lines - 21.png" alt=""><figcaption></figcaption></figure>







Go ahead and open the **`.json`** file and click on the yellow add sign. This will open a popup window with a list. From the list, choose **`locVoiceoverMap`** then click **`Create` .**

<div><figure><img src="../../.gitbook/assets/Screenshot 2026-09-01 232940.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../.gitbook/assets/Screenshot 2026-09-01 233121.png" alt=""><figcaption></figcaption></figure></div>

Then select the newly created entries line and click the add sign once more.

<figure><img src="../../.gitbook/assets/Screenshot 2026-09-01 233822.png" alt=""><figcaption></figcaption></figure>

You will now have your first entry.

Every entry has 3 properties:

1. **femaleResPath** (path to the corresponding female V **`.wem`**)
2. **maleResPath** (path to the corresponding male V **`.wem`**)
3. **stringId** (id of the scene line where you want your voice line to play)

<figure><img src="../../.gitbook/assets/Screenshot 2026-09-01 234447.png" alt=""><figcaption></figcaption></figure>

We will start by filling the ResPaths which are the paths to your **`.wem`** audiofiles. To make it easier for you, you can right click your **`.wem`** file and **`copy the relative path to game file`**.

<figure><img src="../../.gitbook/assets/Screenshot 2026-09-02 143116.png" alt=""><figcaption></figcaption></figure>

If you recorded separate voice lines for both female and male V then you can paste their respective paths in **`femaleResPath`** and **`maleResPath`**. If you just recorded one voice line and want it to play regardless of gender or you just want to test it for now then you can paste the same file path in both. In the example below, the same one is being used.

<figure><img src="../../.gitbook/assets/Screenshot 2026-09-02 143022.png" alt=""><figcaption></figcaption></figure>

Now we must fill the **`stringId`**. This is the **`locstringID`** from the scene line you want to associate your audio with. You can find it by opening your scene, going to the **`Dialog`** tab and expanding the table in the following order:

1. screenplayStore
2. lines
3. your line of choice (which is a scnscreenplayDialogLine)
4. locstringID (this is what you want to copy)

<figure><img src="../../.gitbook/assets/Screenshot 2026-09-02 144139.png" alt=""><figcaption></figcaption></figure>

Go ahead and paste that in the **`stringId`** of the **`voiceovermap.json`**.

<figure><img src="../../.gitbook/assets/Screenshot 2026-09-02 144931.png" alt=""><figcaption></figcaption></figure>

\
We are almost there! We just need to register the **`voiceovermap.json`** in your project's **`archive.xl`** file.

```json
# resources\yourprojecthere.archive.xl
# ...
localization:
  # ...
  vomaps:
    en-us: mod\yourprojecthere\localization\en-us\vo\voiceovermap.json

```

{% hint style="warning" %}
**Remember:** The path and name of the **`.json`** file must be consistent with what you have in your project.
{% endhint %}

In case you don't have an **`archive.xl`** file, one can be created by selecting **`File`** in the tool bar, then select **`+New File`** from the dropdown menu. Select **`ArchiveXL`** in the category and click the **`create`** button.

<div><figure><img src="../../.gitbook/assets/custom voice lines - 19.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../.gitbook/assets/custom voice lines - 20.png" alt=""><figcaption></figcaption></figure></div>

\
**Congratulations!!** Your custom voiceline is successfully registered and it can now be played! Whenever a **scnDialogLineEvent** plays your line, it will now also play your custom voice line alongside!!

