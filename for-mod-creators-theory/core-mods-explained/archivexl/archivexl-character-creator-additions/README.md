---
description: How to add new items to the character creator
---

# ArchiveXL: Character Creator additions

## Summary

Published: Jan 19 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") and [IslandDancer](https://app.gitbook.com/u/s8gktWvqEZWGRxQIsePwOnEI2Mo2 "mention")\
Last documented edit: Jan 19 2025 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention") and [IslandDancer](https://app.gitbook.com/u/s8gktWvqEZWGRxQIsePwOnEI2Mo2 "mention")

This page groups the individual CCXL addition guides. For a full explanation of the structure, see [ccxl-hairs.md](ccxl-hairs.md "mention").

### Wait, this is not what I want!

To learn more about the character creator, check [files-and-what-they-do](../../../files-and-what-they-do/ "mention") -> [character-creator.md](../../../files-and-what-they-do/character-creator.md "mention")

## Hair materials

The full list of hair style materials as supported by CCXL extension:

| material for chunkmask | parameter name in @context |
| ---------------------- | -------------------------- |
| `@beard`               | `BeardBaseMaterial`        |
| `@braid`               | `BraidBaseMaterial`        |
| `@cap`                 | `CapBaseMaterial`          |
| `@cap01`               | `CapBaseMaterial`          |
| `@curls`               | `CurlsBaseMaterial`        |
| `@dread`               | `DreadBaseMaterial`        |
| `@long`                | `LongBaseMaterial`         |
| `@short`               | `ShortBaseMaterial`        |
| `@brows`               | `BrowsBaseMaterial`        |
| `@lashes`              | `LashesBaseMaterial`       |

{% hint style="info" %}
While `@cap01` falls back to CapBaseMaterial, this is how you can define an extra hair cap texture for `cyberware_01`.&#x20;
{% endhint %}

