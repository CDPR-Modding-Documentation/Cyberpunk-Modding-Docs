---
description: Adding CrystalCoat to your custom vehicle
---

# 🌈 CrystalCoat™

## Background

CrystalCoat™ works in a unique way: they make use of Inkwidgets

Inkwidgets are used to create in-game UI - like car interior UI, in-game computers, etc

This is important to understand because if you're hearing inkwidgets for the first time - you have to understand, this is not what they are traditionally used for. The game cleverly hacked inkwidgets to use as a dynamic material. Imagine car paint but it's made of tiny LEDs. So while it's brilliant in theory, it has its own challenges when adding to a custom vehicle.

CrystalCoat is made possible with two core components:

1. The core inkwidget: this consists of two `inkImageWidget` : `primaryColor` and a `secondaryColor` painted on a mask texture
2. The Crystal Coat .mt ( `base\vehicles\common\materials\vehicle_modding_destruction.mt`): this multilayer shader works behind the scenes to load/unwrap the above inkwidget onto the car part, whereas traditional inkwidgets would need a separate submesh - CrystalCoat inkwidgets don't.

## How to add Crystal Coat

### .ent

In your vehicle's .ent file, add a new appearance for Crystal Coat

<figure><img src="../../.gitbook/assets/image (393).png" alt=""><figcaption></figcaption></figure>

We also need an entEffectSpawnerComponent for Crystal Coat fx effects. You can copy paste this as-is from the Aerondight .ent (`base\vehicles\sport\v_sport1_rayfield_aerondight__basic_01.ent`): `EffectSpawner3546`

<figure><img src="../../.gitbook/assets/image (394).png" alt=""><figcaption></figcaption></figure>

### .app

Define the appearance that you just created in the .ent: You can duplicate your default appearance to start with.&#x20;

#### Updating mesh appearances

* For all the meshes that will change color, we need to add a new mesh appearance that uses the .mt I mentioned earlier
* To do this, simply duplicate your default mesh appearance, add a new `customizable` material entry, and copy-paste the material definition from for eg. `base\vehicles\sport\v_sport1_rayfield_aerondight\entities\meshes\v_sport1_rayfield_aerondight__ext01_hood_a_01.mesh`



<figure><img src="../../.gitbook/assets/image (396).png" alt=""><figcaption><p><code>customizable</code> material entry. Remember to add your vehicle's MLmask and MLsetup paths</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (395).png" alt=""><figcaption><p>adding new mesh appearance. Note that I only set the <code>customizable</code> material for submeshes that need to change color</p></figcaption></figure>

* Remember to update the material values with your custom vehicle's mlsetup and mlmask paths
* Set the `customizable` material entry for all the submeshes that change color



#### Adding `WorldWidgetComponent`

* Go to Aerondight's .app file (`base\vehicles\appearances\sport\rayfield_aerondight__basic.app`) and find its customizable appearance ( appearances > player\_01\_customizable\_01)
* Copy and paste all `WorldWidgetComponent`s related to Crystal Coat (all of them will start with `visual_customization_`) to your customizable appearance
* Update the `parentTransform` and `meshTargetBinding`for each of the components to the respective car part in your appearance as needed (they don't necessarily need to match one to one: for e.g., you can use the fuel\_cap WorldWidgetComponent for something that's not a fuel cap)

<figure><img src="../../.gitbook/assets/image (397).png" alt=""><figcaption></figcaption></figure>

### .yaml / tweak edits

Add the following to your vehicle's tweak:

```
hasVisualCustomization: true
customizableAppearance: <theAppearanceNameYouFilledInStepOne>
```

That's it! Install and launch - and you should see _something_ happen.

## Addressing issues

Unless you're extremely lucky, you should start seeing issues. Roughly there are two buckets of issues:

### Glitches

What this is: Crystal Coat paint glitching to black or something in certain angles or certain TPP camera views

There are a few known causes and way to fix this:

* You have more than 10 `WorldWidgetComponent`s
  * The game currently for whatever reason (likely for resource management) glitches if you have more than 10 `WorldWidgetComponent`s defined and used in your customizable appearance
  * To address this, for now, you can try joining meshes like the fuelcap doesn't need to be a separate mesh, it can be part of the body so you can save 1 WorldWidgetComponent
* Angled meshes
  * Sometimes, or even randomly, certain meshes that are angled like door meshes for instance, can have a persistent glitch effect that comes and goes in certain angles
  * To address this, first try 'breaking' the component name
    * Crystal Coat identifies different car parts by looking at their component names, which are standard and common across cars like `door_fl_a`, etc
    * So for example, if you're facing glitches on your left door, try renaming your `door_fl_a` entPhysicalMeshComponent > `door_fl_a_broken`
    * Remember to update `parentTransform` and `meshTargetBinding` for the corresponding `WorldWidgetComponent` and see if this fixes your issue
    * If it does, rememeber to also update the `destruction` > `detachableParts` tweak record in your vehicle's tweak file since the door component name is now different

### Artifacts

What this is: rectangluar or something artifacts on the paint OR inconsistent or incorrect direction of gradient colors

To fix this, we need to understand how the core inkwidget functions

To do this let's look at the Crystal Coat inkwidget (`WorldWidgetComponent` > `widgetResource` > `base\gameplay\vehicles\visual_customization\vvc_car_appearance_widget.inkwidget`)

Click into the "Widget Preview" tab > Export inkWidget as XML > save and open the XML file

The XML file (although currently Wkit doesn't support editing XML > inkwidget) will give you a good overview of how the inkwidget functionally works.

There are a lot of components (that aren't really needed -- we will see this in the next section) however the most important section is this one:

<figure><img src="../../.gitbook/assets/Screenshot 2024-03-30 202343.png" alt=""><figcaption></figcaption></figure>

Here we see two `InkImageWidgets` being defined for the two colors that can be set for Crystal Coat. We also see a `textureAtlas` -> this is the mask which defines how the color is painted and controlled further with the `layout` and `renderTransform` values.

This is primarily what we're concerned with. The artifacts originate from these masks and any other color gradient issues as well

For most custom vehicles, it makes sense to have only one color i.e primaryColor as the customizable option. While it is possible to define both and somehow adjust the layout values to get the correct orientation, I have not tried that so let's focus on making this inkwidget paint ONLY the primaryColor

{% hint style="info" %}
Tip if you're looking to customize this further and/or get correct gradients with secondaryColor: use the `uvchecker.inkatlas` (this is already defined in the inkwidget) as a mask to see how the inkwidget wraps around a car part

![](../../.gitbook/assets/Cyberpunk\_2077\_Screenshot\_2024.03.06\_-\_17.12.42.38.png)
{% endhint %}

To do this, go back to the edit view and go to `libraryItems > Root > package > inkWidgetLibraryItemInstance > gameController`

You should see `primaryColor` and `secondaryColor`&#x20;

From here you need to swap the mask with a completely white mask, adjust the layout an d renderTransform values so that primaryColor occupies the entire space. Then you need to make secondaryColor disappear similarly: you can delete the textureAtlas value and make the size = 1,1 which should make it disappear.

If you don't want to do all of this, feel free to download this inkwidget where I've already done all of this: [https://www.nexusmods.com/cyberpunk2077/mods/13947](https://www.nexusmods.com/cyberpunk2077/mods/13947)

{% hint style="info" %}
Remember to update the `widgetResource` path in every `WorldWidgetComponent` to the custom inkwidget in your project
{% endhint %}

You can see a demonstration of this primaryColor-only functionality in this custom vehicle mod:  [https://www.nexusmods.com/cyberpunk2077/mods/13396](https://www.nexusmods.com/cyberpunk2077/mods/13396)&#x20;

Note - you might also notice glitchAnims (and a dedicated an .inkanim file): these are used when the car gets hit by a bullet or collission. Feel free to remove or tweak thos as well.

### Color accuracy

As of 2.12a, the base color (i.e. defined in the mlsetup of the `customizable` mesh appearance) of the vehicle has a heavy influence on the final Crystal Coat color

For eg, if your base color is white, then it's impossible to get accurate darker colors. And vice versa.

This is unfortunately not a problem that can be fixed in the core inkwidget, and needs messing with the shader itself which this mod by ShinnPL does: [https://www.nexusmods.com/cyberpunk2077/mods/13685](https://www.nexusmods.com/cyberpunk2077/mods/13685) by (likely) changing how the inkwidget/crystal coat shaders work under the hood

## Changing the GUI

The Crystal Coat GUI is primary controlled via this Inkwidget: `base\gameplay\gui\widgets\notifications\vehicle_visual_customization.inkwidget`

If you want to load a custom GUI for your custom vehicle, you can use this redscript:

```
// Script thanks to hgyi56!

native func Log(const text: script_ref<String>) -> Void
native func LogWarning(const text: script_ref<String>) -> Void
native func LogError(const text: script_ref<String>) -> Void

native func LogChannel(channel: CName, const text: script_ref<String>)
native func LogChannelWarning(channel: CName, const text: script_ref<String>) -> Void
native func LogChannelError(channel: CName, const text: script_ref<String>) -> Void

public class Utils_CC_YOUR_CUSTOM_VEHICLE_NAME extends ScriptableSystem {

  public static func Get(gi: GameInstance) -> ref<Utils_CC_YOUR_CUSTOM_VEHICLE_NAME> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"Utils_CC_YOUR_CUSTOM_VEHICLE_NAME") as Utils_CC_YOUR_CUSTOM_VEHICLE_NAME;
  }
  
  public func RemoveBlankSpecialCharacters(string: String) -> String {
    return StrReplaceAll(string, " ", " ");
  }
  
  public func IsTargetVehicle(vehicle: ref<VehicleObject>) -> Bool {

    if IsDefined(vehicle) {
      let vehicleRecord: ref<Vehicle_Record>;
      let gi: GameInstance = vehicle.GetGame();

      VehicleComponent.GetVehicleRecord(vehicle, vehicleRecord);
      
      // We are getting the whole string including the manufacturer here (e.g. "Makigai MaiMai P126") so ensure to set Manufacturer record enumName properly in your tweak/yaml file if custom vehicle mod
      let vehicleModelName: String = Utils_CC_YOUR_CUSTOM_VEHICLE_NAME.Get(gi).RemoveBlankSpecialCharacters(s"\(vehicleRecord.Manufacturer().EnumName()) \(GetLocalizedTextByKey(vehicleRecord.DisplayName()))");
      
      // Uncomment this debug statement to see what the actual model name is in the CET console
      // LogChannel(n"DEBUG", s"!!!! model -> \(vehicleModelName)");
      
      // Replace this with your model name
      let customVehicleCheck_one: String = "YOUR CUSTOM VEHICLE NAME";

      if Equals(customVehicleCheck_one, vehicleModelName) {
        return true;
      }
    }

    return false;
  }
}

@wrapMethod(PopupsManager)
private final func SpawnVehicleVisualCustomizationSelectorPopup() -> Void {
    let player: ref<PlayerPuppet> = this.GetPlayerControlledObject() as PlayerPuppet;
    let gi: GameInstance = player.GetGame();

    // Check if player is mounted on vehicle AND if the player is on your custom or target vehicle
    if IsDefined(player.m_mountedVehicle)
    && Utils_CC_YOUR_CUSTOM_VEHICLE_NAME.Get(gi).IsTargetVehicle(player.m_mountedVehicle) {
        // Here we just redfine the SpawnVehicleVisualCustomizationSelectorPopup function with the path swapped to our custom inkwidget
        LogChannel(n"DEBUG", s"we are in custom gui!!!");
        let data: ref<inkGameNotificationData> = new inkGameNotificationData();
        data.notificationName = n"misterchedda\\v_custom_misterchedda_ferrari_testarossa\\textures\\crystal_coat_212\\gui\\vehicle_visual_customization.inkwidget";
        data.queueName = n"VehicleVisualCustomization";
        data.isBlocking = true;
        data.useCursor = true;
        this.m_vehicleVisualCustomizationSelectorToken = this.ShowGameNotification(data);
        this.m_vehicleVisualCustomizationSelectorToken.RegisterListener(this, n"OnVehicleVisualCustomizationCloseRequest");
        this.m_blackboard.SetBool(this.m_bbDefinition.Popup_CarColorPicker_IsShown, true);
    }
    else {
        // This is not our target vehicle so we don't want to modify anything. Let things run as is
        wrappedMethod();
    }
}

```

Script credits thanks to [hgyi56](https://www.nexusmods.com/cyberpunk2077/users/192432410)

### How to edit the Crystal Coat GUI

* You can replace assets by adding the respective .inkatlases to your project and linking them inside the inkwidget (fool proof of way of doing this is by converting the inkwidget to JSON, CTR + F and replace paths)
  * This way you can replace the default car preview with your own, remove the Rayfield logo, etc. You can also change the text by editing the Lockey
* To remove the secondary color picker, CTR + F in the inkwidget JSON for `inkCircleInnerWidget`, `colorPickerInner`, `pointerTargetSelectedInner`, `inner-circle`, `gradient_circle_inner`, `color_wheel_inner`, `CirclesInner` and set their `opacity` values: 0. Also set the `isInteractive` value to 0 (wherever it is set to 1 for the mentioned). You can then adjust the outer color picker as well, replace it with maybe a thicker color wheel like so in the inkatlas file:
  * ![](<../../.gitbook/assets/Screenshot 2024-03-30 174000.png>)

This gui inkwidget is also available at [https://www.nexusmods.com/cyberpunk2077/mods/13947](https://www.nexusmods.com/cyberpunk2077/mods/13947)
