# CCXL Theory: Switchers

## Summary

**Published:** September 3rd 2025 by [icxrus](https://app.gitbook.com/u/R7jBoGTs0NQ60YSE39s5jrdLiei2 "mention")\
**Last documented edit:** September 3rd 2025 by [icxrus](https://app.gitbook.com/u/R7jBoGTs0NQ60YSE39s5jrdLiei2 "mention")

This page explains how switchers work with the character creator and ArchiveXL. It is currently a work in progress.&#x20;

Originally separated from [ccxl-creating-a-switcher.md](ccxl-creating-a-switcher.md "mention").

### Wait, this is not what I want!

To create your own switcher, check [ccxl-creating-a-switcher.md](ccxl-creating-a-switcher.md "mention") .

For existing vanilla and modded switchers, check [.](./ "mention") .

## What are switchers?

Switchers are the switches shown in the character creator that allow us to change V's physical appearance. There are two different types of _visible_ switcher: those that cycle through text-labeled options such as hairstyles and tattoos—and those that use icons generally depicting color options. Switchers are generally defined within separate .inkcharcustomization files for each gender.

## Types of switchers

### Type 1: Cyclic switchers

<figure><img src="../../../../.gitbook/assets/hairstyle switcher.png" alt=""><figcaption><p>The hairstyle switcher contains text-labeled options. It requires cycling through options</p></figcaption></figure>

There are two types of cyclic switcher—one consists of a _gameuiSwitcherInfo_ that defines index and _options_ and two or more _gameuiAppearanceInfo_'s that contain the corresponding option parameters (the first one usually being the _off_ appearance):

#### gameuiSwitcherInfo

<figure><img src="../../../../.gitbook/assets/switcherInfo options.png" alt=""><figcaption><p>'Options' within the gameuiSwitcherInfo create the options for the switcher, with names pointing to gameuiAppearanceInfo's</p></figcaption></figure>

The other type of cyclic switcher consists of a _gameuiMorphInfo_ with morph names as its options. The chest size switcher for Female body V is an example of this:

#### gameuiMorphInfo

<figure><img src="../../../../.gitbook/assets/chest size switcher.png" alt=""><figcaption><p>The chest size switcher has three options, defined by the morph names.</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/morph names for switcher.png" alt=""><figcaption><p>The second option has no morphName, and is the 'Default' option.</p></figcaption></figure>

### Type 2: Icon switchers

The hair color switcher acts as a cyclic switcher but has icons instead of names:

<figure><img src="../../../../.gitbook/assets/hair color switcher.png" alt=""><figcaption></figcaption></figure>

It can be expanded to show selectable icons.

<figure><img src="../../../../.gitbook/assets/expanded hair color switcher.png" alt="" width="428"><figcaption></figcaption></figure>

The icon switcher does not require a _gameuiSwitcherInfo_ but consists of a single _gameuiAppearanceInfo,_ with its options defined as _**definitions—**_&#x61;ppearance definitions within a .app file:

<figure><img src="../../../../.gitbook/assets/eye color switcher.png" alt=""><figcaption><p>Vanilla eye color switcher consists of gameuiAppearanceInfo with 71 appearance definitions as selectable options. It does NOT have a default 'OFF' option.</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/appearanceInfo definitions.png" alt=""><figcaption><p>Each appearance definition references a definition within the .app file attached as a resource in the gameuiAppearanceInfo </p></figcaption></figure>

### Nested switchers

A switcher can have other switchers as options. These are known as a _nested switchers:_

<div align="center"><figure><img src="../../../../.gitbook/assets/Hairstyle switcher with hair color appInfos.png" alt=""><figcaption><p>The hairstyle switcher controls multiple hair_color switchers which also function as appearance options</p></figcaption></figure></div>

The _uiSlot_ and _uiSlots_ parameters are what make this possible—each switcher or option can occupy one _uiSlot,_ and every _uiSlot_ can have only one _active_ option:

<figure><img src="../../../../.gitbook/assets/hairstyle uiSlot(s).png" alt="" width="563"><figcaption><p>The hairstyle switcher occupies a uiSlot and controls multiple uiSlots</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/hair color ui slot.png" alt="" width="563"><figcaption><p>This hairstyle occupies the hair_color uiSlot</p></figcaption></figure>

This means that every hairstyle has its own _hair color_ switcher. Since each hair color switcher occupies uiSlot 'hair\_color' only one hair color switcher can be active at any time.

## Switcher attributes

A switcher has multiple attributes that make them behave in a certain way:

<table><thead><tr><th width="171.20001220703125">Attribute</th><th width="202.59991455078125">Found in</th><th width="176.4000244140625">Function</th><th width="168.0001220703125">Value type</th></tr></thead><tbody><tr><td>censorFlag</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Listens for active censor, like nudity</td><td></td></tr><tr><td>censorFlagAction</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Activate/Deactivate switchers based on censorFlag</td><td></td></tr><tr><td>defaultIndex</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Index of default switcherOption / morphName / appDefinition</td><td>int</td></tr><tr><td>editTags</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Dictates where a switcher can be used in-game</td><td>NewGame, HairDresser, Ripperdoc</td></tr><tr><td>enabled</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Determines whether switcher is active or inactive by default</td><td>bool</td></tr><tr><td>hidden</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Hides switcher in character creator</td><td>bool</td></tr><tr><td>index</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Determines order of switchers in Character Creator</td><td>int</td></tr><tr><td>link</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Allows a switcher to control the state of other switchers</td><td>string</td></tr><tr><td>linkController</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>The switcher will control other switchers with the same <em>link</em> value</td><td>bool</td></tr><tr><td>localizedName</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>The name, usually a translation entry, that will be shown in-game</td><td>string</td></tr><tr><td>name</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>The name of a switcher or appearance, referenced by switcher options</td><td>string</td></tr><tr><td>onDeactivateOptions</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>Activate/Deactivate other switchers/options when switcher is deactivated</td><td></td></tr><tr><td>options</td><td>gameuiSwitcherInfo</td><td>Creates options for the switcher, referencing names of appearance infos</td><td>string</td></tr><tr><td>definitions</td><td>gameuiAppearanceInfo</td><td>Appearance definition to be referenced in .app file</td><td>string</td></tr><tr><td>morphNames</td><td>gameuiMorphInfo</td><td>Defines the available morphtargets, match these to the values in your .morphtarget</td><td>cName</td></tr><tr><td>resource</td><td>gameuiAppearanceInfo</td><td>Path to .app file</td><td>path</td></tr><tr><td>randomizeCategory</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>The category of a switcher in the randomizer</td><td></td></tr><tr><td>switchVisibility</td><td>gameuiSwitcherInfo</td><td>(More info needed)</td><td>bool</td></tr><tr><td>uiSlot</td><td>gameuiSwitcherInfo<br>gameuiAppearanceInfo<br>gameuiMorphInfo</td><td>The slot which a switcher or option will occupy. Allows only one active option at a time</td><td>string</td></tr><tr><td>uiSlots</td><td>gameuiSwitcherInfo</td><td>The slot(s) a switcher's options will occupy</td><td>string</td></tr></tbody></table>

## Groups

For most appearance additions, the following groups will suffice:

### headGroups

If your switcher is in _headCustomizationOptions,_ you'll want to use these four _headGroups:_

* FPP
* TPP
* TPP\_photomode
* character\_customization

### bodyGroups

If your switcher is in _bodyCustomizationOptions_, you'll want to use these three _bodyGroups_:

* FPP\_Body
* TPP\_Body
* character\_creation (not to be confused with 'character\_customization' in _headGroups_)

### armGroups

If your switcher is in _armsCustomizationOptions_, you'll want to use these armGroups:

Female V:

* holstered\_default\_tpp
* holstered\_default\_fpp
* holstered\_strong\_tpp
* holstered\_strong\_fpp
* unholstered\_strong
* holstered\_nanowire\_tpp
* holstered\_nanowire\_fpp
* unholstered\_nanowire
* holstered\_launcher\_tpp
* holstered\_launcher\_fpp
* unholstered\_launcher
* holstered\_mantis\_tpp
* holstered\_mantis\_fpp
* unholstered\_mantis
* nails
* character\_customization

Male V:

* holstered\_default
* holstered\_strong
* unholstered\_strong
* holstered\_nanowire
* unholstered\_nanowire
* holstered\_launcher
* unholstered\_launcher
* holstered\_mantis
* unholstered\_mantis
* nails
* character\_customization

Each of these holstered and unholstered definitions links to a certain arm cyberware, or none, being equipped by the player. Many of these also have different positioning to each other.&#x20;
