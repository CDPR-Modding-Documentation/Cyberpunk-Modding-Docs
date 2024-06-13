---
description: Preserved for posterity - do not use this
---

# Archived: Registering the body tag

{% hint style="danger" %}
With ArchiveXL 1.14, this information is outdated. It will be preserved for posterity, but you should use the current method under [.](./ "mention") instead.
{% endhint %}

In any of the files you modded, check your `components`:

#### Does any of them have a type that's called something with `morphtargetComponent`?

**Yes:**\
Add a **tag** with the exact name of your body in this component's tag array (for our example, `NewBody`)

**No:**\
Add a new component (of any type) and give it the following name:\
`Body:NewBody`

{% hint style="warning" %}
If you edit the leg component for female V, you must change both the regular and the flat feet component:\
`base\characters\common\player_base_bodies\appearances\l0_000_base__full.app`\
`base\characters\common\player_base_bodies\appearances\l0_000_base__cs_flat.app`
{% endhint %}

#### If you can't make it work

The files below have been confirmed to work — make the changes stated above to each of them:

```
base\characters\common\player_base_bodies\appearances\l0_000_base__cs_flat.app
base\characters\common\player_base_bodies\appearances\l0_000_base__full.app
base\characters\common\player_base_bodies\appearances\l0_000_base_fpp__cs_flat.app
base\characters\common\player_base_bodies\appearances\l0_000_base_fpp__full.app 
```

#### The following .app files are used to register Body Tags for Male V:

```
base\characters\common\player_base_bodies\appearances\t0_000_base__full.app
base\characters\common\player_base_bodies\appearances\t0_000_base__full_censored.app
base\characters\common\player_base_bodies\appearances\t0_000_fpp__full.app
base\characters\common\player_base_bodies\appearances\t0_000_fpp__full_censored.app
```

#### &#x20;Test

After packing your project, [check if the body tag registers](archived-registering-the-body-tag.md#checking-the-current-body-mod) by running the CET command.

If yes, you're good to go!

If not and you have used a **component**, check if it's added to the playerPuppet, either via CET:&#x20;

```
print(GetPlayer():FindComponentByName("Body:NewBody"))
```

or via [RedHotTools](../../../modding-tools/redhottools/):

<figure><img src="../../../../.gitbook/assets/AXL_body_checking_component.png" alt=""><figcaption></figcaption></figure>
