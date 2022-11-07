# Finding Materials for Assets

## Where are the multilayered files?

Thank you @86maylin#6375 on Discord for this answer! [Check out their answer](https://discordapp.com/channels/717692382849663036/1021886502709493881/1022477944842629121) for an example on jacket\_04 asset.

**In this example** I'm wanting to change the shade of blue on the man version of _Light XX Punch! Heat-Resistant Biker Turtleneck_, so I need to find its layer files.

<mark style="background-color:yellow;">**F**</mark>irst head over to [fandom](https://cyberpunk.fandom.com/wiki/Cyberpunk\_2077\_Clothing) and find the BaseID for the turtleneck. I don't know of a mod that will get this information in-game, but that would be amazing if one is ever made. The fandom site has images that match the images in the game, so it's a pretty quick way to find things.

![](<../../.gitbook/assets/image (7) (1).png>)

<mark style="background-color:yellow;">**I**</mark>n Wolvenkit's Asset Browser search for the "base" portion of the turtleneck's BaseID. For Shirt\_02\_rich\_01, the base portion is Shirt\_02.

{% hint style="info" %}
Wolvenkit does recursive searching in the Asset Browser that is based on the folder you have selected in the Asset Browser. To reduce clutter in your search results, try selecting a folder relatively deep in the folder structure. For example, for player clothes select _base\characters\appearances\player\items_.
{% endhint %}

![](<../../.gitbook/assets/image (15).png>)

<mark style="background-color:yellow;">**L**</mark>ook at the file names in the results listing for an \*.ent file with a name that best fits the asset you're looking for. In this case, the asset is a long sleeved turtleneck and the most similar file name that matches the description is t1\_shirt\_02.ent.

<mark style="background-color:yellow;">**R**</mark>ight click the t1\_shirt\_02.ent file and select Open without adding to the project. In the file viewer, select the Entity Preview tab and make sure the asset looks like the Light XX Punch! Heat-Resistant Biker Turtleneck.

![](<../../.gitbook/assets/image (1) (1).png>)

<mark style="background-color:yellow;">**B**</mark>ack in the Asset Browser, search again for t1\_shirt\_02 but look for the app (appearance) file instead. For easier results, search for t1\_shirt\_02.app. Right click the app file and open it without adding it to the project.&#x20;

![](<../../.gitbook/assets/image (20).png>)

<mark style="background-color:yellow;">**E**</mark>xpand the appearances definition and notice that the appearance's name is listed on the right side of the list. Scroll through the appearances list and find one with a name that matches the "specific" portion of the turtleneck's BaseID. For Shirt\_02\_rich\_01, the specific portion is rich\_01. I am looking for the man version of that appearance, so I need to find one ending in _m_ or _ma_ (man average).

![](<../../.gitbook/assets/image (3) (2).png>)

<mark style="background-color:yellow;">**E**</mark>xpand appearance 25, then expand the components definitions, and for this asset there was only one mesh component. The meshAppearance value should correctly describe the asset we're looking for, in this case it correctly describes a blue and white shirt. At the end of the mesh value click the blue-arrowed icon to open the mesh in a new tab.

![](<../../.gitbook/assets/image (21).png>)

<mark style="background-color:yellow;">**E**</mark>xpand the mesh's appearances list and find the appearance that matches the meshAppearance from the previous step. Expand the appearance's chunkMaterials definition and take note of any material that may hold the information we're wanting to use.

![](<../../.gitbook/assets/image (14) (1).png>)

<mark style="background-color:yellow;">**C**</mark>lose the appearances list, then scroll down and expand the localMaterialBuffer definition and then the materials definition. Take notice how the material's names are displayed on the right. At the bottom of the list is material 25 for the blue\_white material.

![](<../../.gitbook/assets/image (17).png>)

<mark style="background-color:yellow;">**E**</mark>xpand the material 22  and then expand values to find the multilayered files. That's it! Too easy right?

![](<../../.gitbook/assets/image (22) (1).png>)

a
