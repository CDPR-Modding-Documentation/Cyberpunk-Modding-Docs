# Effects modding

## Summary

**Published**: Jul 12 2024 by @고양이\
**Last documented edit**: Jul 12 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

### Wait, this is not what I want!

* See [effects-explained.md](../../../for-mod-creators-theory/files-and-what-they-do/effects-explained.md "mention") for the theory
* See [effect-components.md](../../../for-mod-creators-theory/files-and-what-they-do/components/documented-components/effect-components.md "mention") for effect explanations by component
* See [fx-material-properties.md](../../../for-mod-creators-theory/materials/configuring-materials/fx-material-properties.md "mention") for animated _materials_
* While explosions are definitely effects, lights are something else => [lights-explained.md](../../../for-mod-creators-theory/files-and-what-they-do/lights-explained.md "mention")
* To **position** effects, see [amm-light-components.md](../custom-props/amm-light-components.md "mention") -> [#placing-your-light-components](../custom-props/amm-light-components.md#placing-your-light-components "mention")

## CET Script

This script extracts all the VFX names from TweakDB and prints them in the CET Console along with their TweakDB record they are attached to; these can be reused for buffs & status effects.

```
local GetVFX = function(self)
	local VFX = {}
	local loops = TweakDB:GetRecords('gamedataStatusEffectFX_Record')
	for i,v in ipairs(loops) do
		local recordID = v:GetRecordID().value
		local thisVFX = TweakDB:GetFlat(recordID..'.name').value
		VFX[thisVFX]=recordID
	end
	
	loops = TweakDB:GetRecords('gamedataEffector_Record')
	for i,v in ipairs(loops) do
		local recordID = v:GetRecordID().value
		local thisVFX = TweakDB:GetFlat(recordID..'.vfxName')
		if thisVFX ~= nil then
			thisVFX = thisVFX.value
			VFX[thisVFX]=recordID
		end
	end
	for k,v in pairs(VFX) do
		local theString = 'VFX: '..tostring(v)..'=>'..tostring(k)
		print(theString)
	end;
end;
GetVFX()

```

## Recommended mods

FX player ([Nexus](https://www.nexusmods.com/cyberpunk2077/mods/8194)) is a CET mod that lets you play game effects.&#x20;

## To select and identify effect files used in different ways

As we progress through the game, we encounter many effects, such as those seen in Cyberspace. Since I don't yet know everything, I'll show you the process of creating a mod.

Firstly, we choose the effect we want to import. I found an effect I want to use for overclocking during the Somewhat Damaged quest, and the quest code is Q305\_bunker. Navigate to the asset browser and search for related items, focusing on extracting the effect files.

<figure><img src="../../../.gitbook/assets/image (471).png" alt=""><figcaption><p>fxLibrary.lua</p></figcaption></figure>

To confirm if this effect is what I'm looking for, I need the [FX player](https://www.nexusmods.com/cyberpunk2077/mods/8194) mod. Based on the Cyberpunk installation folder, go to bin\x64\plugins\cyber\_engine\_tweaks\mods\FxPlayer\modules and confirm that fxLibrary.lua operates in the same format.&#x20;

Copy the file path of the desired effect to play these files in-game using CET (Cyber Engine Tweaks).

<figure><img src="../../../.gitbook/assets/image (472).png" alt=""><figcaption></figcaption></figure>

