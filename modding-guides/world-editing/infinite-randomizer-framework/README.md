---
description: Root Documentation for Infinite Randomizer Framework (IRF)
icon: arrows-rotate-reverse
---

# Infinite Randomizer Framework

Infinite Randomizer Framework picks up where frameworks like 4x/8x Poster / Magazine Frameworks left off. \
It is available on [GitHub](./) and Soon Nexus.

Instead of relying on removal and readdition of nodes via ArchiveXL which is fragile, inflexible and creates conflicts between mods implementing the framework IRF replaces resource paths as they load.\
This change of the approach fixes all major issues present in the existing frameworks and has added benefits like the replaced nodes being different every time they are loaded creating a more dynamic and variable environment. IRF supports `.mi` (decals), `.ent` and `.mesh` resources which are directly loaded by streaming sectors.

IRFs benefits as a list:

* Implementing Mods Don't Conflict
* Version Independent
* Different Randomization On Every Load
* Weighted Distribution
* Supports Modded Streaming Sectors
* Supports `.mi` (decals), `.ent` and `.mesh` resources
* Configurable Source And Replacement Pools
* Easy To Implement (Doesn't Force Any Project Structure, Resources Just Need To Be Registered)
* Backwards Compatible (Mods Made For Existing Frameworks Will Work With IRF)

For Implementation Guidelines see [variant-pool.md](variant-pool.md "mention") and [category.md](category.md "mention").
