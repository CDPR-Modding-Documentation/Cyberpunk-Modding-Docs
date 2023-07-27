# Gendered preview icons

This is a sub-page of "[your own preview icons](./)" and only contains information on how to hook up gendered variants once you already have the files. If you aren't quite there yet, refer to the other guide first.

## Requirements:

This will not work unless your item is using the corresponding **suffix**.\
Without it, the game has no way to tell male and female items apart.

```yaml
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
```

{% hint style="info" %}
If you want to know more about this, you can read up here: [#what-are-suffixes](../../../files-and-what-they-do/entity-.ent-files.md#what-are-suffixes "mention")

If you don't have a gendered item yet, see the original ArchiveXL guide, section "[adding a male instance](../../items-equipment/adding-new-items/#adding-a-male-instance)".
{% endhint %}

## How to do it

By adding an `icon` property to your item's yaml, you're telling ArchiveXL to create an UIIcon record for you. The generated records will be the same for all genders, variants and tags.

If you want to use a gendered preview picture, you can create a more specific record yourself. In this case, you can **delete** the icon entry from your item.

Its name will follow this schema:

```
UIIcon.clothing_ENTITYNAME_APPEARANCENAME_SUFFIXES_VISUALTAGS
```

### Wait, what?

`ENTITYNAME,` `APPEARANCENAME`, `SUFFIXES` and `VISUALTAGS`above are placeholders for the corresponeding fields in your YAML.&#x20;

{% hint style="info" %}
You can look up the actual names of the created records in CET's Tweak Browser and simply copy them to your .yaml
{% endhint %}

For example, if you have the following item:

```yaml
Items.my_custom_shirt_redwhite:
  $base: Items.GenericInnerChestClothing
  entityName: my_custom_shirt_factory_name
  appearanceName: appearance_root_entity_white_red
  appearanceSuffixes: [ itemsFactoryAppearanceSuffix.Gender ]
```

… then you'd define a preview image like this:

```yaml
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_white_red_Female_:
    $type: UIIcon
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pwa.inkatlas
    atlasPartName: slot_01
    
UIIcon.clothing_my_custom_shirt_factory_name_appearance_root_entity_white_red_Male_:
    $type: UIIcon
    atlasResourcePath: tutorial\torso\my_custom_shirt\ops\preview_icons_pma.inkatlas
    atlasPartName: slot_01
```

The trailing underscore separates the empty visual tags from the suffixes entry.

{% hint style="info" %}
Your items won't need an icon record anymore, the assignment now happens by magic!
{% endhint %}
