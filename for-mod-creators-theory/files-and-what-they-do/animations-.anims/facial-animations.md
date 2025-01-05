# Facial animations

## Summary

Created: Jan 02 2025 by [nutboy](https://app.gitbook.com/u/y772Qw4Ul9cmqXiuTKkTpLxDVzQ2 "mention")\
Last documented update: Jan 02 2025 by [nutboy](https://app.gitbook.com/u/y772Qw4Ul9cmqXiuTKkTpLxDVzQ2 "mention")

This page will explain how facial animations are selected within the files, and how they hang together.

### Wait, this is not what I want!

* For a guide on creating a custom NPC, check [amm-custom-npcs](../../../modding-guides/npcs/amm-custom-npcs/ "mention")
* For a guide on creating an even more custom NPC, check [npv-v-as-custom-npc](../../../modding-guides/npcs/npv-v-as-custom-npc/ "mention")

## entAnimatedComponent

The very base for any animations is the entAnimatedComponent with the name of `face_rig`. \
It is defined per appearance in the [.app file](../appearance-.app-files/), where you can find it inside the `components` array:

TODO: put screenshot
