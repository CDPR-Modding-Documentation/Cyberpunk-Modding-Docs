---
description: This page covers all supported nodes / what each object type in WB does
---

# Supported nodes

{% hint style="success" %}
If there is some type of node / a property of a node which is not currently supported, but you want it, voice your wishes either on [GitHub](https://github.com/justarandomguyintheinternet/CP77_entSpawner), or in the #world-editing channel on the modding discord
{% endhint %}

## Entity

* All Entity type nodes support [Entity Instance Data](features-and-guides/entity-instance-data.md) editing (Changing any component's value)
* Related guides: [Devices](../devices/)

<table data-full-width="true"><thead><tr><th width="144">Variant Name</th><th width="298">Purpose</th><th width="308">Notes</th><th>Node Name (In Engine)</th></tr></thead><tbody><tr><td>Entity Template</td><td>Spawns an entity from a given <code>.ent</code> file. Appearance is configurable.</td><td>---</td><td><code>worldEntityNode</code></td></tr><tr><td>Entity Record</td><td>Spawns an entity from a given TweakDB record. Must be used for vehicles.</td><td>Movement update is slow, does not spawn if player is not standing on the ground.</td><td><code>worldPopulationSpawnerNode</code></td></tr><tr><td>Device</td><td>Same as Entity Template, but allows defining device connections to other entities. Used extensively to handle anything where two or more entities need to be able to communicate.</td><td>Connections are not previewed in the editor, only work once converted to native world edit.</td><td><code>worldDeviceNode</code></td></tr></tbody></table>

## Mesh

* Mesh nodes are used for most visible things, as they support scaling, and entities are overkill if nothing else but a visible mesh is needed

<table data-full-width="true"><thead><tr><th width="135">Variant Name</th><th width="391">Purpose</th><th width="281">Notes</th><th>Node Name (In Engine)</th></tr></thead><tbody><tr><td>Static Mesh</td><td>Places a static mesh, from a given .mesh file. Does not have any collision, but has an option to generate a fitting collider shape.</td><td>---</td><td><code>worldMeshNode</code></td></tr><tr><td>Rotating Mesh</td><td>Same as Static Mesh, but allows defining an axis and speed around which it will rotate.</td><td>---</td><td><code>worldRotatingMeshNode</code></td></tr><tr><td>Cloth Mesh</td><td>Same as Static Mesh, but has simulated cloth physics (E.g. Curtains)</td><td>Does not have simulated physics until converted to native world edit.</td><td><code>worldClothMeshNode</code></td></tr><tr><td>Dynamic Mesh</td><td>Places a mesh with simulated rigid-body physics. Not destructible.</td><td>---</td><td><code>worldDynamicMeshNode</code></td></tr></tbody></table>

## Deco

<table data-full-width="true"><thead><tr><th width="181">Variant Name</th><th>Purpose</th><th>Notes</th><th>Node Name (In Engine)</th></tr></thead><tbody><tr><td>Decals</td><td>Places a decal on the nearest surface, from a given <code>.mi</code> file, scalable and options for alpha and flipping.</td><td>---</td><td><code>worldStaticDecalNode</code></td></tr><tr><td>Particles</td><td>Plays a particle system, from a given <code>.particle</code> file.</td><td>---</td><td><code>worldStaticParticleNode</code></td></tr><tr><td>Effects</td><td>Plays an effect, from a given <code>.effect</code> file.</td><td>---</td><td><code>worldEffectNode</code></td></tr><tr><td>Static Audio Emitter</td><td>Plays a sound from a single point.</td><td>---</td><td><code>worldStaticSoundEmitterNode</code></td></tr><tr><td>Water Patch</td><td>Places a water patch, with physics / swimmability.</td><td>Does not have physics / reactivity until converted to native world edit.</td><td><code>worldWaterPatchNode</code></td></tr><tr><td>Fog Volume</td><td>Places a fog volume of variable size.</td><td>Sometimes not visible until converted to native world edit, due to light channels.</td><td><code>worldStaticFogVolumeNode</code></td></tr></tbody></table>

## Collision

<table data-full-width="true"><thead><tr><th width="148">Variant Name</th><th width="538">Purpose</th><th width="50">Notes</th><th>Node Name (In Engine)</th></tr></thead><tbody><tr><td>Collision Shape</td><td>A scalable collision shape, can be a box, capsule or sphere. Options to choose the material, affecting impact effect.</td><td>---</td><td><code>worldCollisionNode</code></td></tr></tbody></table>

## Lights

<table data-full-width="true"><thead><tr><th width="123">Variant Name</th><th width="590">Purpose</th><th width="63">Notes</th><th>Node Name (In Engine)</th></tr></thead><tbody><tr><td>Static Light</td><td>Places a static light of type point, spot or area. Lots of controls, such as color, intensity, angles, EV, flicker settings, radius, shadow / fog settings and more.</td><td>---</td><td><code>worldStaticLightNode</code></td></tr></tbody></table>

## AI

<table data-full-width="true"><thead><tr><th width="128">Variant Name</th><th width="347">Purpose</th><th>Notes</th><th>Node Name (In-Engine)</th></tr></thead><tbody><tr><td>AI Spot</td><td>Defines a spot at which NPCs use a workspot. Must be used together with a community node.</td><td>---</td><td><code>worldAISpotNode</code></td></tr><tr><td>Community</td><td>A collection of NPCs, with their phases, time periods and assigned spots.</td><td>Build must be converted to native world edit before community takes effect</td><td><code>worldCompiledCommunityAreaNode_Streamable</code></td></tr></tbody></table>

## Area

* All area type nodes work the same, [requiring an outline to be defined](features-and-guides/setting-area-outlines.md) using a group of outline markers
* None of the area nodes functionality (E.g. Restrictions) are previewed, for them to take effect the build needs to be converted to native world edit

<table data-full-width="true"><thead><tr><th width="121">Variant Name</th><th width="564">Purpose</th><th width="61">Notes</th><th>Node Name (In-Engine)</th></tr></thead><tbody><tr><td>Outline Marker</td><td>Places a marker for an outline. Automatically connects with other outline markers in the same group, to form an outline. The parent group can be used to reference the contained outline.</td><td>---</td><td>Is not a real node</td></tr><tr><td>Trigger Area</td><td>General purpose node for an area with an associated trigger. Triggers supported: Interior, Location, Quest Notifier, Prevention, Vehicle Forbidden, Content Block</td><td>---</td><td><code>worldTriggerAreaNode</code></td></tr><tr><td>Ambient Area</td><td>Trigger used for modifying the soundstage. E.g. Muffling outdoor sounds while in an interior, or playing spatial ambient sounds.</td><td>---</td><td><code>worldAmbientAreaNode</code></td></tr><tr><td>Kill Area</td><td>Instantly kills the player when inside the area.</td><td>---</td><td><code>gameKillTriggerNode</code></td></tr><tr><td>Prevention Free Area</td><td>Prevents police from entering the area. Does not clear wanted level.</td><td>---</td><td><code>worldPreventionFreeAreaNode</code></td></tr><tr><td>Water Null Area</td><td>Removes the underwater effect, and swimmability from the area. Does not remove the water mesh.</td><td>---</td><td><code>worldWaterNullAreaNode</code></td></tr><tr><td>Dummy Area</td><td>Spawns a dummy area, which can be used for <a href="../devices/creating-security-areas.md">getting an outline for a gameStaticAreaShapeComponent</a>.</td><td>---</td><td>Is not a real node</td></tr></tbody></table>

## Meta

<table data-full-width="true"><thead><tr><th width="148">Variant Name</th><th width="421">Purpose</th><th width="179">Notes</th><th>Node Name (In-Engine)</th></tr></thead><tbody><tr><td>Occluder</td><td>Places an occluder of variable size and shape, which will cause anything completely behind it to not be rendered.</td><td>---</td><td><code>worldStaticOccluderMeshNode</code></td></tr><tr><td>Reflection Probe</td><td>Places a reflection probe of variable size. Can be used to make indoors have appropriate base lighting.</td><td>---</td><td><code>worldReflectionProbeNode</code></td></tr><tr><td>Static Marker</td><td>Places a static marker node. Useful if you need a NodeRef as a reference point. Usually best placed in an AlwaysLoaded Sector.</td><td>---</td><td><code>worldStaticMarkerNode</code></td></tr><tr><td>Spline Point</td><td>Places a point of a spline. Automatically connects with other spline points in the same group, to form a path. The parent group can be used to refernce the contained spline.</td><td>Works the same way as <a href="features-and-guides/setting-area-outlines.md">area outlines</a>.</td><td>Is not a real node</td></tr><tr><td>Spline</td><td>Basic spline with auto-tangents, which can be referenced using its NodeRef.</td><td>---</td><td><code>worldSplineNode</code></td></tr></tbody></table>
