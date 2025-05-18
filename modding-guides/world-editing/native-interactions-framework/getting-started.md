---
description: This page covers the basics of adding a new interaction
---

# Getting Started

## Creating Project

* All interactions are organized intro projects, you usually have one project per mod
* To create a new project, go to the `Projects` tab
* Enter a name, then hit the save icon to create and load a new project

<figure><img src="../../../.gitbook/assets/NIFProjects.png" alt="" width="563"><figcaption><p>Creating, managing and editing existing projects</p></figcaption></figure>

{% hint style="success" %}
In this guide, "loading" a project means loading it to edit, as any project installed will be active by default
{% endhint %}

## Adding Interactions

* To add an interaction, make sure you have loaded a project by pressing the "Load" icon to the left of it's name in the `Projects` tab
* Switch to the `Edit Project` Tab
* Now select the type of interaction from the dropdown, add a name, and hit the plus icon to add it
  * New interactions will be placed at the player's feet

<figure><img src="../../../.gitbook/assets/NIFAddNew.gif" alt="" width="267"><figcaption><p>Add a new interaction</p></figcaption></figure>

## Edit Interactions

* Information on how to edit an interaction and what it's properties do, can be found here:
  * [Interaction Settings](interaction-settings.md)

## Sharing Creations

* For each project, an equally named `.json` file is created in the mod's folder:
* `Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\nativeInteractions\projects\projectName.json`
* To publish your mod, simply include the project's JSON file, and add NIF as requirement

{% hint style="success" %}
Project files for sharing can be found in

`Cyberpunk 2077\bin\x64\plugins\cyber_engine_tweaks\mods\nativeInteractions\projects`
{% endhint %}
