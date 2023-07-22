# Gendered preview icons

This is a sub-page of "[your own preview icons](./)". It only contains information on how to set up gendered variants. For a general step-by-step guide, refer to the parent page.

## How to do it

For this, delete the icon properties above and create UIIcon records. They need to follow this naming pattern:

```
UIIcon.clothing_ENTITYNAME_APPEARANCENAME_SUFFIXES_VISUALTAGS
```

### Wait, what?

`ENTITYNAME,` `APPEARANCENAME`, `SUFFIXES` and `VISUALTAGS`above are placeholders for the corresponeding fields in your YAML.&#x20;

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
