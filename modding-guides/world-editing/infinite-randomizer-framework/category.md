# Category

Categories contain the source resource paths and appearances that will be replaced by a variant from any Variant Pool targeting it.\
Just like Variant Pools they must contain only one resource type to be valid and also carry a `.json` extension and are located in `bin\x64\plugins\cyber_engine_tweaks\mods\InfiniteRandomizerFramework\data\categories`.

The Root Object has the following properties:

| Property | Explanation                      | Required                           |
| -------- | -------------------------------- | ---------------------------------- |
| name     | Unique Identifying Name          | Yes                                |
| entries  | List Of Resources To Be Replaced | Yes, Must Contain At Least 1 Entry |

The Entry Object has the following structure:

| Property     | Explanation                  | Required            |
| ------------ | ---------------------------- | ------------------- |
| resourcePath | Resource Path To Be Replaced | Yes                 |
| appearance   | Appearance To Filter For     | No, Defaults To Any |

{% hint style="warning" %}
Appearances are ignored for `worldTerrainMeshNode` and `worldStaticDecalNode`.
{% endhint %}

The resource path has to match before the appearance is checked and the appearance simply acts as an additional filter to narrow down replacement.

{% hint style="warning" %}
When adding entities to a category don't forget to add the "default" value as well if you are filtering by appearance.&#x20;
{% endhint %}

An example snippet:

```json
{
  "name": "VendingMachine-A",
  "entries": [  
    {
      "appearance": "vending_machines_a_orgiatic",
      "resourcePath": "base\\gameplay\\devices\\vending_machines\\vending_machine_1.ent"
    },
    {
      "appearance": "vending_machines_vending_machine_a",
      "resourcePath": "base\\gameplay\\devices\\vending_machines\\vending_machine_1.ent"
    }
  ]
}
```
