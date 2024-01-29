---
description: How to make it iconic
---

# Adding stats and modifiers

## Summary

**Published:** Jan 29 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")\
**Last documented update:** Jan 29 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This guide will show you an example for adding a modifier to an existing game item; in this case, making David's jacket iconic. It will point you towards further reading material in case you want to dig deeper.



## How to mod it

Find [the-cyberpunk-2077-game-directory.md](../../../../for-mod-users/users-modding-cyberpunk-2077/the-cyberpunk-2077-game-directory.md "mention"). Then, create the following text document (you can name it what you want):

```
r6/tweaks/my_improved_item.yaml
```

Paste the following contents into the text document and save it:

```yaml
Items.MQ049_martinez_jacket:
  statModifiers:
    - !append Quality.IconicItem
```

That's it. When you start the game now, the item's quality will be iconic.

## What the fuck did I just do?

You created a tweak edit.
