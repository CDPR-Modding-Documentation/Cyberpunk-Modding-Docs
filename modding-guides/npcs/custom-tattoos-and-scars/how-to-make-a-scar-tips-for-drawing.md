---
description: >-
  This tuto will teach you how do a scar in the software of your choice. I will
  give you some basic idea on how to create scar,
---

# How to make a scar (tips for drawing)

## **Summary**

**Published**: Feb 29 2024 by Yggnire, initial guide by Yggnire\
**Last documented edit**: Feb 29 2024 by Yggnire

I will give you some basic idea on how to create scar, I encourage you to use these basics and explore as many possibilities as possible. Don't hold on to what I'm going to explain to you.&#x20;

Have fun.

## Level of difficulty

**The ability to read**: mandatory, because I'm not gonna lie — this is gonna be difficult otherwise.\
**Knowing how to use a drawing software** : recommended, because this guide will not cover it.

#### Expected time to complete

\- as long as it takes you to create a scar that you like

## Prerequisites :

* [ ] A drawing software like Clip Paint Studio, Photoshop or [photopea.com](https://www.photopea.com/)
* [ ] Some time and patience to create scars
* [ ] A graphic tablet (hightly recommended)

<mark style="color:red;">**I use the software CLIP STUDIO PAINT but you can do it with the one you want.**</mark>



I'm gonna do the scar on the normal map (bumpmap) first.

<div align="left">

<figure><img src="../../../.gitbook/assets/image (322).png" alt="" width="124"><figcaption></figcaption></figure>

</div>

&#x20;I take a RED color like this :

<div align="left">

<figure><img src="../../../.gitbook/assets/image (321).png" alt=""><figcaption></figcaption></figure>

</div>

## Handmade scar :&#x20;

I use a wet watercolors brush for the natural scar



Do the base of your scar :&#x20;

<div align="left">

<figure><img src="../../../.gitbook/assets/image (323).png" alt="" width="346"><figcaption><p>A simple line</p></figcaption></figure>

</div>

Then pimp it , you can erase or add some pieces to your scar with your brush

<div align="left">

<figure><img src="../../../.gitbook/assets/image (325).png" alt="" width="296"><figcaption><p>I have cut and add new parts on the scar to give a more random look</p></figcaption></figure>

</div>

Now copy paste your scar and change the color to GREEN, place the layer below the red one and move it a few pixels to the side you want.

{% tabs %}
{% tab title="1" %}
<figure><img src="../../../.gitbook/assets/image (328).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Zoom" %}
<figure><img src="../../../.gitbook/assets/image (329).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

Now copy paste your scar on the skin textures

<div align="left">

<figure><img src="../../../.gitbook/assets/image (330).png" alt="" width="177"><figcaption></figcaption></figure>

</div>

<div align="left">

<figure><img src="../../../.gitbook/assets/image (331).png" alt="" width="283"><figcaption></figcaption></figure>

</div>

Use the Pipette tools and take the skin color, use the "Lock Transparent Pixels" parameters OR you can use `CTRL+U` to modify the color as you wish, do the same for the GREEN layer, personally I use a  lighter color for the red layer and a darker color for the green layer

<div align="left">

<figure><img src="../../../.gitbook/assets/image (333).png" alt=""><figcaption></figcaption></figure>

</div>

<div align="left">

<figure><img src="../../../.gitbook/assets/image (334).png" alt="" width="336"><figcaption></figcaption></figure>

</div>

Good job, you have your first scar ! Now do magic with wkit and go see your scar in-game



In-game appearance

{% tabs %}
{% tab title="1" %}
<figure><img src="../../../.gitbook/assets/image (335).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="2" %}
<figure><img src="../../../.gitbook/assets/image (336).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="3" %}
<figure><img src="../../../.gitbook/assets/image (337).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}





## Baked Normal map scar

In this part of the tuto I will show you a different way to do a scars (with better in-game results)

To begin you will need the diffuse map :&#x20;

<div align="left">

<figure><img src="../../../.gitbook/assets/image (498).png" alt="" width="188"><figcaption></figcaption></figure>

</div>

Draw your scar : I know this is not a simple scar if I have done this one, it's to show you what we can do with baked normal map.

<div align="left">

<figure><img src="../../../.gitbook/assets/image (499).png" alt="" width="375"><figcaption></figcaption></figure>

</div>

Save your scar as a .PNG.

It's time for the baking part, you will need a bump map converter, I use [CrazyBump](https://www.youtube.com/watch?v=x\_5suERXhRw\&list=PLKC44ub7XfxmFwTiVLIvgcahWheRXiFGO) which is the best in my opinion I will teach you how to convert your diffuse map with Crazy Bump.

Download it and when you are in , click on "Open photograph from file".&#x20;

<figure><img src="../../../.gitbook/assets/image (500).png" alt=""><figcaption></figcaption></figure>

Choose your png file of the diffuse map.

<figure><img src="../../../.gitbook/assets/image (503).png" alt=""><figcaption></figcaption></figure>

Choose a shape, personally I will pick the right one

<figure><img src="../../../.gitbook/assets/image (504).png" alt=""><figcaption></figcaption></figure>

Make those sliders slide the way you want and then "save normals to file"

<figure><img src="../../../.gitbook/assets/image (506).png" alt=""><figcaption></figcaption></figure>

Now you will need to go on WolvenKit, replace with "Replace Texture" your normal map with the new one you just baked.



{% tabs %}
{% tab title="Replace" %}
<figure><img src="../../../.gitbook/assets/image (508).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Result" %}
<figure><img src="../../../.gitbook/assets/image (509).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

The image should turn green, if not, go in the "import tab" and select "TEXG\_Multilayer\_Normal"&#x20;

<mark style="color:red;">**OR**</mark>  "TEXG\_Generic\_Normal" and import it, it should fix the problem.

<figure><img src="../../../.gitbook/assets/image (510).png" alt=""><figcaption></figcaption></figure>

You can now "Save" the image&#x20;

<figure><img src="../../../.gitbook/assets/image (511).png" alt=""><figcaption></figcaption></figure>

You can now open the saved file with your drawing software, and select the scar.

<figure><img src="../../../.gitbook/assets/image (512).png" alt="" width="356"><figcaption></figcaption></figure>

Copy and paste it on the normal map of the game



{% tabs %}
{% tab title="Copy paste" %}
<figure><img src="../../../.gitbook/assets/image (513).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Rough Edges" %}
<figure><img src="../../../.gitbook/assets/image (514).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Smoothen Edges" %}
<figure><img src="../../../.gitbook/assets/image (515).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

You can see that the copy paste isn't smooth and have created rough edges, you will have to erase them with a smooth brushe.

When you are done with this part, you can save your file as a .PNG, keep it for later.



Now that the diffuse and the normal map are done , there remains one map to do, the roughness map.

**`Note that the roughness map is not really necessary for creating the scar BUT it brings more realism to it.`**



With a roughness map, you can give differents textures just by changing the colors you are using, see the examples :&#x20;



{% tabs %}
{% tab title="Colors" %}
<figure><img src="../../../.gitbook/assets/image (516).png" alt=""><figcaption><p>Blue : Water <br>Yellow/green : Gold/Steel<br>Red/Purple : Matte </p></figcaption></figure>
{% endtab %}

{% tab title="In-game (with nothing below) " %}
<figure><img src="../../../.gitbook/assets/image (517).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="In-game (with a red dot below)" %}
<figure><img src="../../../.gitbook/assets/image (518).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}



You will have to copy the scar made on the diffuse map and paste it on the roughness map.

<figure><img src="../../../.gitbook/assets/image (519).png" alt=""><figcaption></figcaption></figure>

Now you have to change the colors to make them match with their elements



{% tabs %}
{% tab title="My result" %}
<figure><img src="../../../.gitbook/assets/image (520).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="Explanation" %}
<figure><img src="../../../.gitbook/assets/image (522).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}

You can now replace all the textures by your textures in Wkit. Export and Import and then see the result in-game.



{% tabs %}
{% tab title="1" %}
<figure><img src="../../../.gitbook/assets/image (523).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="2" %}
<figure><img src="../../../.gitbook/assets/image (524).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="3" %}
<figure><img src="../../../.gitbook/assets/image (525).png" alt=""><figcaption></figcaption></figure>
{% endtab %}

{% tab title="4" %}
<figure><img src="../../../.gitbook/assets/image (526).png" alt=""><figcaption></figcaption></figure>
{% endtab %}
{% endtabs %}
