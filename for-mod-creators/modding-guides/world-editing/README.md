---
description: Editing the world of Cyberpunk
---

# 🌐 World Editing

This page will give you an overview on how to edit the world of Cyberpunk 2077. &#x20;

For its collection of **guides**, see the child pages in the wiki's navigation tree or click on "Next" at the foot of the page.

* For a guide on how to find the correct streamingsector, see [places.md](../../references-lists-and-overviews/reference-world-sectors/places.md "mention")
* For a list of ineresting sectors on this wiki, see [reference-world-sectors](../../references-lists-and-overviews/reference-world-sectors/ "mention")

## How to change the world?

Rather than blowing up Arasaka Tower or trying to become bomb, we're using [archivexl](../../core-mods-explained/archivexl/ "mention") to edit the contents of [.streamingsector](../../files-and-what-they-do/the-whole-world-.streamingsector.md) files.&#x20;

### Why shouldn't we edit .streamingsector files?

### Exclusivity&#x20;

In Cyberpunk modding, files can only be edited by **one mod at a time**, and that mod will be [the first to reach the file](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects#project-naming-and-mod-load-order). Once you have added a file to your .archive, nobody else can edit it.

### Compatibility

Sector files often change between game versions. Your edited sector file won't know and won't care, so it will overwrite the updated file nonetheless. (See for yourself - try a pre-2.0 version from one of [mana's Apartment Overhauls](https://www.nexusmods.com/users/1630319?tab=user+files) and watch everything explode).

ArchiveXL will modify sectors only if the **number of expected nodes** matches the number of total nodes in the sector. On top of that, for each node affected, a type has to be specified - so if CDPR sneakily switches out one of the nodes that you've been deleted for something else, AXL will notice and refuse to implement your sector modification.

## So how do I actually do it?

Create an `.xl` file in your [Wolvenkit project](https://app.gitbook.com/s/-MP\_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-projects)'s resources folder. It has to contain the following structure:

```yaml
streaming:
  sectors:
    # an array of sectors, there can be multiple entries
    - path: your\path\from\red_hot_tools\ex_in_terior_99_99_0_0-streamingsector
      expectedNodes: 999
      nodeDeletions:
        # an array of nodes, ordered by type
        - index: 0
          type: worldNodeType
        - index: 1
          type: worldOtherNodeType
      # nodeAdditions:
        # to do: this needs to be documented
```

ArchiveXL will load that file from your game's mod folder and apply the modifications for you.

For more detailed information, see the nested guides, e.g. [world-editing-deleting-objects.md](world-editing-deleting-objects.md "mention")
