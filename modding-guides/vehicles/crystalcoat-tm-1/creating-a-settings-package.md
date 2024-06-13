---
cover: ../../../../.gitbook/assets/page14.jpg
coverY: 0
---

# 🧰 Creating a settings package

When you install the mod and you go into the mod settings menu, you will see that you have default values. When you modify these values you can then click on a button to reset all values to default.

These default values are defined by what is written into the script for each field. It is up to you to define default values that you find relevant for your mod.

Some users are community administrators that deploy a collection of mods to a lot of users. They may want to add your mod to their collection, but for some reason they would prefer to customize the default settings for their community.

This is the purpose of this chapter.

## What is a settings package

If you look at the script you will find a `SettingsPackage` class. This class contains the mod settings definition. Default values are what stands after the `=` sign for each field.

<pre class="language-swift"><code class="lang-swift">public class SettingsPackage {

  /////////////////////////
  // GENERAL
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "MyModName")
  @runtimeProperty("ModSettings.category", "MyNickName.MyModName-general-cat")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "MyNickName.MyModName-general-paint_aspect_enabled")
  @runtimeProperty("ModSettings.description", "MyNickName.MyModName-general-paint_aspect_enabled-desc")
<strong>  public let paintAspectEnabled: Bool = false;
</strong>
  @runtimeProperty("ModSettings.mod", "MyModName")
  @runtimeProperty("ModSettings.category", "MyNickName.MyModName-general-cat")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "MyNickName.MyModName-general-paint_aspect")
  @runtimeProperty("ModSettings.description", "MyNickName.MyModName-general-paint_aspect-desc")
  @runtimeProperty("ModSettings.dependency", "paintAspectEnabled")
  @runtimeProperty("ModSettings.displayValues.Metallic", "MyNickName.MyModName-enum-metallic")
  @runtimeProperty("ModSettings.displayValues.Glossy", "MyNickName.MyModName-enum-glossy")
  @runtimeProperty("ModSettings.displayValues.Matte", "MyNickName.MyModName-enum-matte")
<strong>  public let paintAspect: EPaintAspect = EPaintAspect.Metallic;
</strong>  
  ...
</code></pre>

Creating a custom settings package requires to create a new mod just like translations also require to create a standalone mod.

{% hint style="warning" %}
These extension mods shall not contain anything from the original mod otherwise it will cause trouble with updates, and it will also violate intellectual property of the original mod author.
{% endhint %}

When you create a translation mod you simply need to create a XL file and one JSON file per additional language you are providing. This way you don't duplicate anything from the original mod and you won't erase any file from it.

Settings package mod works in a similar way.

## Allow other mods to override your settings

If you want other mods to be able to override your default settings you need to add a few changes to your script. At the top of your file, remember that you have defined a module name. This is what uniquely identifies your mod for any other script.

Right below the module statement, you must add the following code snippet. The `if` line checks if another installed mod is defining a new settings package. If none is installed then the `import` statement won't be executed.

If one is installed then it will replace your `SettingsPackage` class with the one defined into the other mod. You must replace the `MyNickName.MyModName` string by your module name.

<pre class="language-swift" data-line-numbers data-full-width="true"><code class="lang-swift">module MyNickName.MyModName

<strong>@if(ModuleExists("MyNickName.MyModName.SettingsPackage"))
</strong><strong>import MyNickName.MyModName.SettingsPackage.SettingsPackage
</strong></code></pre>

Next, just before the `SettingsPackage` class definition you must add a new line. This line is the opposite of the previous one above. If the settings package mod is not installed then your default class will be used.

<pre class="language-swift" data-line-numbers data-full-width="true"><code class="lang-swift"><strong>@if(!ModuleExists("MyNickName.MyModName.SettingsPackage"))
</strong>public class SettingsPackage {

  /////////////////////////
  // GENERAL
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "MyModName")
  @runtimeProperty("ModSettings.category", "MyNickName.MyModName-general-cat")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "MyNickName.MyModName-general-paint_aspect_enabled")
  @runtimeProperty("ModSettings.description", "MyNickName.MyModName-general-paint_aspect_enabled-desc")
  public let paintAspectEnabled: Bool = false;
  
  ...
</code></pre>

That's it ! Your mod is now able to replace its default settings values with those of another mod. Now you should create a ready-to-use template file that other users will be able to download.

## Create a template script

To do so create a new script file that you will make available for download to your users into a ZIP archive for example `SettingsPackageTemplate.zip`.

In this REDS file you will simply add this content. Use the same module name as your original script except that you add `.SettingsPackage` at the end.

Then the `import` statement loads all the types definition from your original mod so the class below can use these types. And finally the `SettingsPackage` class must be **a exact duplicate** of the original mod's class.

{% hint style="warning" %}
If you update the original mod and you rename / add / remove / change type of any setting field then you must update the template and any user that has created a custom settings package mod must update its mod with your new template.
{% endhint %}

<pre class="language-swift"><code class="lang-swift"><strong>module MyNickName.MyModName.SettingsPackage
</strong>
<strong>import MyNickName.MyModName.*
</strong>
public class SettingsPackage {

  /////////////////////////
  // GENERAL
  /////////////////////////

  @runtimeProperty("ModSettings.mod", "MyModName")
  @runtimeProperty("ModSettings.category", "MyNickName.MyModName-general-cat")
  @runtimeProperty("ModSettings.category.order", "1")
  @runtimeProperty("ModSettings.displayName", "MyNickName.MyModName-general-paint_aspect_enabled")
  @runtimeProperty("ModSettings.description", "MyNickName.MyModName-general-paint_aspect_enabled-desc")
  public let paintAspectEnabled: Bool = false;
  
  ...
</code></pre>

## Create a settings package mod

In order to create a new settings package you need to create a new mod project, then add a script file. You can either create it by following the [previous paragraph](creating-a-settings-package.md#create-a-template-script) or you can simply download the template file made available by the author on the original mod's page.

Rename the REDS file with your new mod name and place it into `resources/r6/scripts/<mod name>/` folder.

Then modify the fields to define the default values. Default values are what stands after the `=` sign of each field. If you need more details on the types used by fields, refer to the original mod's script.

That's it ! Finally package your mod and install it so it will override the default values. When installing or removing a settings package mod, it will erase the custom values defined by the user and revert to the new default values.

{% hint style="info" %}
You can name your custom settings mod as you want because the mod loading order won't matter.
{% endhint %}
