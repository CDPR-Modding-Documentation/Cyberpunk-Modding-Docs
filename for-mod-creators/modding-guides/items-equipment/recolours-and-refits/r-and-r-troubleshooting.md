---
description: The troubleshooting section for the Recolours & Refits guide
---

# R\&R: Troubleshooting

## Summary <a href="#summary" id="summary"></a>

**Created by @manavortex**\
**Published September 30 2023**

This page is a part of the [Recolours and Refit guide](broken-reference). It will&#x20;

{% hint style="info" %}
The troubleshooting steps below will be expanded as people follow this guide and run into problems. If you encounter anything not on the list,&#x20;

* make sure to double-check the guide — did you complete all required steps in the correct order?
* find @manavortex on the [REDmodding Discord](https://discord.gg/redmodding), for example in #mod-dev-chat
{% endhint %}

## Import/Export

You can check [exporting-and-importing-meshes](../../../3d-modelling/exporting-and-importing-meshes/ "mention") or see[troubleshooting-your-mesh-edits.md](../../../3d-modelling/troubleshooting-your-mesh-edits.md "mention") for general troubleshooting.

### I can't import my file back

#### Have you moved any files?&#x20;

File paths are [how Wolvenkit knows](http://127.0.0.1:5000/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/import-export#file-structure) which files belong together. If you have moved files, do this:

1. Export the target file again&#x20;
2. Overwrite the exported file in your project's `raw` folder with your changes
3. Import back&#x20;

## MLSetupBuilder

You can find tool-specific troubleshooting on [MLSB's wiki page](../../../modding-tools/mlsetup-builder/#troubleshooting).

### I can't build a depot

That's okay, you can still [complete the guide without a full depot](./#netrunner-suit-preview), or you can check [MLSetupBuilder's wiki page](../../../modding-tools/mlsetup-builder/#extract-a-partial-depot) for more instructions.



## Refitting

### My mesh is string cheese!

You either need to [import garment support](r-and-r-refitting-step-by-step.md#step-7-importing-into-wolvenkit), or [delete the parameters](../../../3d-modelling/troubleshooting-your-mesh-edits.md#my-mesh-is-string-cheese-exploding-vertices-a-puddle-on-the-floor).

