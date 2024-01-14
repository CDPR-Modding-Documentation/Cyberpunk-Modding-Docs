---
description: This page needs some serious love. Maybe you're the one to give it?
---

# Hair Material Properties

## Summary

**Created:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 14 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page documents the hair shader its properties.&#x20;

* For an **explanation** of material properties and further links, see [.](./ "mention")

## The hair material

The cyberpunk hair shader can be found under `base\materials\hair.mt`.

Hair properties are collected in `.hp` (hair profile) files. Each hair profile has two greyscale maps and a gradient.&#x20;

It does not use a normal map.

## Creating your own hair colours

The person who best understands hair is **island dancer** on [discord](https://discord.com/channels/717692382849663036/786891742829215745/1133043174017859714), who has created a [Wolvenkit Project (fully set-up)](https://mega.nz/file/PQkF1CTY#6NCK-V7--Fr3Vf7nCU\_FN5Y8j-h3tcTUyzFh36A96o4) with something like 45 different hair profiles. You can export the profiles through the [wolvenkit-blender-io-suite](../../modding-tools/wolvenkit-blender-io-suite/ "mention"): look up [#hair-profiles-.hp](../../modding-tools/wolvenkit-blender-io-suite/wkit-blender-plugin-import-export.md#hair-profiles-.hp "mention")

## Properties

### Gradient

A gradient with hair colour information. This is used to color individual strands via the ID map.

### ID(entity)

Maps the individual hair strands by colour: Value <=> position on the gradient

### Flow

Controls "bending" direction of hair by assigning a colour to the strand.&#x20;

### FlowStrength

A multiplier how strongly this should affect hair



For more information, you can read up on a conversation by the expert [here](https://discord.com/channels/717692382849663036/786891742829215745/1133043174017859714).

