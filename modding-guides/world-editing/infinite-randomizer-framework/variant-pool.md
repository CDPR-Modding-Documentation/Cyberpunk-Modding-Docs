# Variant Pool

Variant Pools contain the replacement resource paths, appearances and weights and target one category each.\
Variant Pools carry a `.json` extension and are located in \``bin\x64\plugins\cyber_engine_tweaks\mods\InfiniteRandomizerFramework\data\variantPools`.\
Each Variant Pool can only contain one resource type which must match the resource type of the category it's targeting.

The Root Object has the following properties:

| Property | Explanation                                                       | Required                               |
| -------- | ----------------------------------------------------------------- | -------------------------------------- |
| name     | Unique Identifying Name                                           | Yes                                    |
| enabled  | Current State                                                     | Yes                                    |
| category | Target Category Name                                              | Yes                                    |
| variants | List Of Resources That Will Be Replacing Elements In The Category | Yes, Must Contain At Least One Variant |

Each variant in the variants list has the following structure:

| Property     | Explanation                                                        | Required                  |
| ------------ | ------------------------------------------------------------------ | ------------------------- |
| resourcePath | Resource Path Of The Resource                                      | Yes                       |
| weight       | Relative Bias Towards This Entry. This Value Must Be Non Negative. | No, Defaults To 1         |
| appearance   | Resources Appearance                                               | No, Defaults to "default" |

{% hint style="warning" %}
Appearances are ignored for `worldTerrainMeshNode` and `worldStaticDecalNode`.
{% endhint %}

The weight is not a fixed percentage but rather a relative bias that depends on the amount of entries and their weights. \
For example a variant with a weight of 2 will be picked twice as often as a variant with a weight of 1, while two variants with an equal weight will be equally likely to be picked.\
Do keep in mind that Cyberpunk uses a lot of instanced nodes for meshes leading to some resources being replaced together as they are part of the same node. This is not something that can easily be changed.

An example Variant Pool:

```json
{
    "name": "Vanilla-MagazinesOpen",
    "enabled": true,
    "category": "MagazinesOpen",
    "variants": [
        {
            "resourcePath": "base\\environment\\decoration\\misc\\paper\\magazine\\magazine_k_open.mesh",
            "appearance": "default",
            "weight": 1
        },
        {
            "resourcePath": "base\\environment\\decoration\\misc\\paper\\magazine\\magazine_l_open.mesh",
            "appearance": "default",
            "weight": 1
        },
        {
            "resourcePath": "base\\environment\\decoration\\misc\\paper\\magazine\\magazine_m_open.mesh",
            "appearance": "default",
            "weight": 1
        },
        {
            "resourcePath": "base\\environment\\decoration\\misc\\paper\\magazine\\magazine_n_open.mesh",
            "appearance": "default",
            "weight": 1
        }
    ]
}
```
