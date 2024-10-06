---
description: Overview of hair related things
---

# Cheat Sheet: Hair

Summary

**Published**: November 04 2022 by @manavortex\
**Last documented update**: Oct 06 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

{% hint style="info" %}
You can find previews of hair styles and -colors under [cheat-sheet-character-creator.md](../cheat-sheet-character-creator.md "mention")
{% endhint %}

This page will give you an overview for working with Cyberpunk's hair material.&#x20;

* There is a modding guide for how to [replace-a-hair-mods-slot.md](../../../modding-guides/npcs/guides-all-about-hair/replace-a-hair-mods-slot.md "mention")
* For a guide on how to add hair to Cyberpunk, check [basic-hairstyle-replacement-tutorial.md](../../../modding-guides/npcs/guides-all-about-hair/basic-hairstyle-replacement-tutorial.md "mention")
* For a more detailed explanation of the hair shader, see [hair-and-skin-material-properties.md](../../materials/configuring-materials/hair-and-skin-material-properties.md "mention")
* If you want to change an NPC's hair instead, you can check [this](../../../modding-guides/npcs/npv-v-as-custom-npc/npv-creating-a-custom-npc.md#hair) or [this](../../../modding-guides/npcs/appearances-change-the-looks/#safely-adding-components) guide.
* To look up hairstyles in more detail, you can use [NoraLee's excellent NPV part picker](https://noraleedoes.neocities.org/npv/npv\_part\_picker)

<figure><img src="https://lh7-us.googleusercontent.com/RI9Ee_FGHg0wskRK3SlVVpxbU5WuK7H0o0FDip15fb59vaJq8EfHmLshv5BoN-arccmH1kF7oYlp1fZL9jR6xWXb33NQDWol_1v44AFx7pOmTXzmbqn5syIkHVSTDMw60YH0PlAtQn8qtF1hz-iGHYo" alt="" width="563"><figcaption><p>credit to this <a href="https://www.reddit.com/r/cyberpunkgame/comments/t4nsi9/my_written_guide_on_how_to_make_hairstyles_in/">Reddit</a> post.</p></figcaption></figure>

<figure><img src="https://lh7-us.googleusercontent.com/mdAHWojzo5xwy3ThQ4wv3RrxCY7eHCcbAcxJ2CAP1lmDqB77t3SBJe2saznl3n9bVS3eI-qtY4pOzu-NezU7r16hE9aD3vg-Iqe7xqsTPNU2YycCC6965KK3pR7FAmeWof9Ei3CMr22ENEyeetGLjHI" alt="" width="563"><figcaption><p>credit to this <a href="https://www.reddit.com/r/cyberpunkgame/comments/t4nsi9/my_written_guide_on_how_to_make_hairstyles_in/">Reddit</a> post.</p></figcaption></figure>

## Name of meshes by index

These names correspond to the `mesh` files.&#x20;

To find a hair's control files, check the next section: [#hair-control-files-by-index](hair.md#hair-control-files-by-index "mention")

{% hint style="info" %}
Many hairs have different meshes if cyberware\_01 is used. In this case, the alternative file name will be given in _italics_.
{% endhint %}

All the files below can be found under the following subfolder:&#x20;

```
base\characters\common\hair\<hair name default variant>\<hair name as given>.mesh
```

To quickly find physics-enabled hair, you can use the Wolvenkit Search with the following query:

<pre><code><strong>base\characters\common\hair > .animgraph > _wa_ // female body gender
</strong>base\characters\common\hair > .animgraph > _ma_ // male body gender
</code></pre>

<table data-full-width="false"><thead><tr><th width="73" data-type="number">01</th><th width="328">Femme frame</th><th width="341">Masc frame</th></tr></thead><tbody><tr><td>1</td><td>hh_033_wa__player<br><em>hh_033_pwa__player_cyberware_01</em></td><td>hh_145_ma__v_short</td></tr><tr><td>2</td><td>hh_059_wa__voodoo_02<br><em>hh_059_pwa__voodoo_02_cyberware_01</em></td><td>hh_053_ma__kerry_eurodyne_common<br><em>hh_053_pma__kerry_eurodyne_common_cyberware_01</em></td></tr><tr><td>3</td><td>hh_034_wa__militech_agent_common</td><td>hh_035_ma__mohawk_tall<br><em>hh_035_pma__mohawk_tall_cyberware_01</em></td></tr><tr><td>4</td><td>hh_089_wa__thompson_common<br><em>hh_089_pwa__thompson_common_cyberware_01</em></td><td>hh_028_ma__corpo_bun<br><em>hh_028_pma__corpo_bun_cyberware_01</em></td></tr><tr><td>5</td><td>hh_090_wa__alt_player</td><td>hh_075_ma__peralez_common</td></tr><tr><td>6</td><td>hh_078_wa__evelyn_common</td><td>hh_036_ma__high_tight<br><em>hh_036_pma__high_tight_cyberware_01</em></td></tr><tr><td>7</td><td>hh_035_wa__mohawk_tall<br><em>hh_035_pwa__mohawk_tall_cyberware_01</em></td><td>hh_059_ma__voodoo_02<br><em>hh_059_pma__voodoo_02_cyberware_01</em></td></tr><tr><td>8</td><td>hh_036_wa__high_tight<br><em>hh_036_pwa__high_tight_cyberware_01</em></td><td>hh_030_ma__punk_idol</td></tr><tr><td>9</td><td>hh_082_wa__afro_bun_bun<br><em>hh_082_pwa__afro_bun_cyberware_01</em></td><td>hh_062_ma__slick_back</td></tr><tr><td>10</td><td>hh_079_pwa__denny</td><td>hh_085_ma__takemura_common</td></tr><tr><td>11</td><td>hh_091_wa__dakota_braid_band</td><td>hh_037_ma__gungho<br><em>hh_037_pma__gungho_cyberware_01</em></td></tr><tr><td>12</td><td>hh_063_wa__messy_bob</td><td>hh_039_ma__punk_shaved<br><em>hh_039_pma__punk_shaved_cyberware_01</em></td></tr><tr><td>13</td><td>hh_042_wa__topknots_band<br><em>hh_042_pwa__topknots_cyberware_01</em></td><td>hh_051_ma__judy_common<br><em>hh_051_pma__judy_common_cyberware_01</em></td></tr><tr><td>14</td><td>hh_999_wa__buzz_cap<br><em>hh_999_pwa__buzz_cap_cyberware_01</em></td><td>hh_999_ma__buzz_cap<br><em>hh_999_pma__buzz_cap_cyberware_01</em></td></tr><tr><td>15</td><td>hh_008_wa__sk8t_or_die<br><em>hh_008_pwa__sk8t_or_die_cyberware_01</em></td><td>hh_025_ma__pompadour<br><em>hh_025_pma__pompadour_cyberware_01</em></td></tr><tr><td>16</td><td>hh_011_wa__demo</td><td>hh_008_ma__sk8t_or_die<br><em>hh_008_pma__sk8t_or_die_cyberware_01</em></td></tr><tr><td>17</td><td>hh_029_wa__misty_common</td><td>hh_011_ma__demo</td></tr><tr><td>18</td><td>hh_040_wa__pixie_bob</td><td>hh_026_ma__rat_tail<br><em>hh_026_pma__rat_tail_cyberware_01</em></td></tr><tr><td>19</td><td>hh_041_wa__valentino_band<br><em>hh_041_pwa__valentino_cyberware_01</em></td><td>hh_027_ma__scavenger</td></tr><tr><td>20</td><td>hh_044_wa__classic</td><td>hh_031_ma__morgan_blackhand</td></tr><tr><td>21</td><td>hh_045_wa__short_spiked<br><em>hh_045_pwa__short_spiked_cyberware_01</em></td><td>hh_032_ma__ripper_doc_common<br><em>hh_032_pma__ripper_doc_cyberware_01</em></td></tr><tr><td>22</td><td>hh_051_wa__judy_common<br><em>hh_051_pwa__judy_common_cyberware_01</em></td><td>hh_040_ma__pixie_bob</td></tr><tr><td>23</td><td>hh_060_wa__voodoo_03<br><em>hh_060_pwa__voodoo_03_cyberware_01</em></td><td>hh_047_ma__swirl_pomp<br><em>hh_047_pma__swirl_pomp_cyberware_01</em></td></tr><tr><td>24</td><td>hh_064_wa__bob_fringe</td><td>hh_048_ma__dual_braids</td></tr><tr><td>25</td><td>hh_068_wa__animals_band</td><td>hh_058_ma__voodoo_01</td></tr><tr><td>26</td><td>hh_081_wa__buns_02</td><td>hh_060_ma__voodoo_03<br><em>hh_060_pma__voodoo_03_cyberware_01</em></td></tr><tr><td>27</td><td>hh_083_wa__ponytail_base_01</td><td>hh_061_ma__midlength_wavy</td></tr><tr><td>28</td><td>hh_083_wa__ponytail_base_01</td><td>hh_065_ma__afro_knots<br><em>hh_065_pma__afro_knots_cyberware_01</em></td></tr><tr><td>29</td><td>hh_077_wa__nomad_02</td><td>hh_068_ma__animals_03_band</td></tr><tr><td>30</td><td>hh_088_wa__corpo_bob</td><td>hh_073_ma__nomad_01</td></tr><tr><td>31</td><td>hh_118_wa__gillean</td><td>hh_082_ma__afro_bun_bun<br><em>hh_082_pma__afro_bun_cyberware_01</em></td></tr><tr><td>32</td><td>hh_115_wa__alanah_common</td><td>hh_089_ma__thompson_common<br><em>hh_089_pma__thompson_common_cyberware_01</em></td></tr><tr><td>33</td><td>hh_121_wa__t_bug_common</td><td>hh_103_ma__common_spikes</td></tr><tr><td>34</td><td>hh_151_wa__judy_variation02_common<br><em>hh_151_pwa__judy_variation02_cyberware_01</em></td><td>hh_120_ma__arasaka_bun_common_01<br><em>hh_120_pma__arasaka_bun_01_cyberware_01</em></td></tr><tr><td>35</td><td>hh_006_wa__demo<br><em>hh_006_pwa__demo_cyberware_01</em></td><td>hh_007_ma__demo<br><em>hh_007_pma__demo_cyberware_01</em></td></tr><tr><td>36</td><td>hh_083_wa__ponytail_base_01</td><td>hh_112_ma__kicinski_player</td></tr><tr><td>37</td><td>hh_093_wa__sumo</td><td>hh_113_ma__iwinski_common</td></tr><tr><td>38</td><td>hh_085_wa__takemura_common</td><td>hh_045_ma__short_spiked<br><em>hh_045_pma__short_spiked_cyberware_01</em></td></tr><tr><td>39</td><td>hh_054_wa__rogue_young_common<br><em>hh_054_pwa__rogue_young_cyberware_01</em></td><td>hh_094_ma__saul_common</td></tr><tr><td>40</td><td>hh_049_wa__thiago_common</td><td>hh_049_ma__thiago_common</td></tr><tr><td>41</td><td>hh_039_wa__punk_shaved<br><em>hh_039_pwa__punk_shaved_cyberware_01</em></td><td>hh_122_ma__roy</td></tr><tr><td>42</td><td>hh_103_wa__common_spikes</td><td>hh_093_ma__sumo_knot</td></tr><tr><td>43</td><td>hh_106_wa__ponytails</td><td>hh_006_ma__demo</td></tr><tr><td>44</td><td>hh_140_wa__short_afro<br><em>hh_140_pwa__short_afro_cyberware_01</em></td><td>hh_140_ma__short_afro<br><em>hh_140_pma__short_afro_cyberware_01</em></td></tr><tr><td>45</td><td>hh_141_wa__afro</td><td>hh_141_ma__afro</td></tr><tr><td>46</td><td>hh_142_pwa__afrohawk<br><em>hh_142_pwa__afrohawk_cyberware_01</em></td><td>hh_142_pma__afrohawk<br><em>hh_142_pma__afrohawk_cyberware_01</em></td></tr><tr><td>47</td><td>hh_143_wa__flat_top<br><em>hh_143_pwa__flat_top_cyberware_01</em></td><td>hh_143_ma__flat_top<br><em>hh_143_pma__flat_top_cyberware_01</em></td></tr><tr><td>48</td><td>hh_144_wa__afro_braid_bun<br><em>hh_144_pwa__afro_braid_bun_cyberware_01</em></td><td>hh_144_ma__afro_braid_bun<br><em>hh_144_pma__afro_braid_bun_cyberware_01</em></td></tr><tr><td>49</td><td>hh_146_wa__dread_undercut<br><em>hh_146_pwa__dread_undercut_cyberware_01</em></td><td>hh_146_ma__dread_undercut<br><em>hh_146_pma__dread_undercut_cyberware_01</em></td></tr><tr><td>50</td><td>hh_999_wa__buzz_cap<br><em>hh_999_pwa__buzz_cap_cyberware_01</em></td><td>hh_999_ma__buzz_cap<br><em>hh_999_pma__buzz_cap_cyberware_01</em></td></tr></tbody></table>

## Colour in files by index

<figure><img src="../../../.gitbook/assets/HAIR COLOR - VISUAL GUIDE - BY LL.png" alt=""><figcaption><p>Hair Colours in CC - Visual Guide by LadyLea</p></figcaption></figure>

<table><thead><tr><th width="150">Colour in CC</th><th>Name in Files</th></tr></thead><tbody><tr><td>1</td><td>05_brown_liquorice</td></tr><tr><td>2</td><td>01_blonde_platinum</td></tr><tr><td>3</td><td>02_red_merlot</td></tr><tr><td>4</td><td>03_ginger_copper</td></tr><tr><td>5</td><td>04_teal_ombre</td></tr><tr><td>6</td><td>06_black_carbon</td></tr><tr><td>7</td><td>07_blonde_golden</td></tr><tr><td>8</td><td>08_blonde_dishwater</td></tr><tr><td>9</td><td>09_blue_sapphire</td></tr><tr><td>10</td><td>10_brown_ombre</td></tr><tr><td>11</td><td>11_red_apple</td></tr><tr><td>12</td><td>12_gray_gunmetal</td></tr><tr><td>13</td><td>13_ginger_strawberry</td></tr><tr><td>14</td><td>14_teal_ash</td></tr><tr><td>15</td><td>15_pink_magenta</td></tr><tr><td>16</td><td>16_pink_rose</td></tr><tr><td>17</td><td>17_blue_steel</td></tr><tr><td>18</td><td>18_blue_red_ombre</td></tr><tr><td>19</td><td>19_cold_white</td></tr><tr><td>20</td><td>20_cyberpunk_yellow</td></tr><tr><td>21</td><td>21_goblin_green</td></tr><tr><td>22</td><td>22_liliac</td></tr><tr><td>23</td><td>23_mermaid_aquamarine</td></tr><tr><td>24</td><td>24_purple_ombre</td></tr><tr><td>25</td><td>25_black_salt_n_pepper</td></tr><tr><td>26</td><td>26_green_toxic</td></tr><tr><td>27</td><td>27_brown_medium</td></tr><tr><td>28</td><td>28_blue_sky</td></tr><tr><td>29</td><td>29_citrus_yellow</td></tr><tr><td>30</td><td>30_dark_purple</td></tr><tr><td>31</td><td>31_green_orange</td></tr><tr><td>32</td><td>32_liliac_ombre</td></tr><tr><td>33</td><td>33_phoenix_fire</td></tr><tr><td>34</td><td>34_purple_blonde</td></tr><tr><td>35</td><td>35_silver_rose</td></tr></tbody></table>

## Hair: Control files by index

Hairs and all their components are assigned and defined via [.app](../../files-and-what-they-do/appearance-.app-files/) and [.ent files](../../files-and-what-they-do/entity-.ent-files/#mesh-component-entity-simple-entity). You can find them in the following folder:

```
base\characters\head\player_base_heads\appearances\entity\hairs 
```

<details>

<summary>How to find these files?</summary>



The last number in the file name matches the first number in the [.mesh file name](hair.md#name-in-files-by-index):

<img src="../../../.gitbook/assets/cheatsheet_hair_entity_lookup.png" alt="" data-size="original">

e.g., if you wanted to edit the entity file for female V's hair 28 `hh_083_wa__ponytail_01`, you could search for&#x20;

```
player_base_heads > hairs > hairs_083
```

or

```
hairs_083 > .app > .pwa
```

</details>

<table data-full-width="false"><thead><tr><th width="73" data-type="number">01</th><th width="371">Femme frame</th><th width="341">Masc frame</th></tr></thead><tbody><tr><td>1</td><td>hh_033_pwa__hairs_151</td><td>hh_037_pma__hairs_145_fpp</td></tr><tr><td>2</td><td>hh_000_pwa__hairs_059<br><em>bhh_000_pwa__hairs_059_cyberware_01</em></td><td>hh_001_pma__hairs_053<br><em>hh_001_pma__hairs_053_cyberware_01</em></td></tr><tr><td>3</td><td>hh_034_pwa__hairs_006<br><em>hh_034_pwa__hairs_006_cyberware_01</em></td><td>hh_002_pma__hairs_035<br><em>hh_002_pma__hairs_035_cyberware_01</em></td></tr><tr><td>4</td><td>hh_003_pwa__hairs_89<br><em>hh_003_pwa__hairs_89_cyberware_01</em></td><td>hh_003_pma__hairs_028<br><em>hh_003_pma__hairs_028_cyberware_01</em></td></tr><tr><td>5</td><td>hh_004_pwa__hairs_090</td><td>hh_004_pma__hairs_075</td></tr><tr><td>6</td><td>hh_078_wa__evelyn</td><td>hh_005_pma__hairs_036<br><em>hh_005_pma__hairs_036_cyberware_01</em></td></tr><tr><td>7</td><td>hh_035_pwa__hairs_083_braid_01</td><td>hh_006_pma__hairs_059<br><em>hh_006_pma__hairs_059_cyberware_01</em></td></tr><tr><td>8</td><td>hh_036_pwa__hairs_093</td><td>hh_007_pma__hairs_030</td></tr><tr><td>9</td><td>hh_008_pwa__hairs_082<br><em>hh_008_pwa__hairs_082_cyberware_01</em></td><td>hh_008_pma__hairs_062</td></tr><tr><td>10</td><td>hh_009_pwa__hairs_079</td><td>hh_009_pma__hairs_085</td></tr><tr><td>11</td><td>hh_010_pwa__hairs_091</td><td>hh_010_pma__hairs_037<br><em>hh_010_pma__hairs_037_cyberware_01</em></td></tr><tr><td>12</td><td>hh_011_pwa__hairs_063</td><td>hh_011_pma__hairs_039<br><em>hh_011_pma__hairs_039_cyberware_01</em></td></tr><tr><td>13</td><td>hh_012_pwa__hairs_042<br><em>hh_012_pwa__hairs_042_cyberware_01</em></td><td>hh_012_pma__hairs_051<br>hh_012_pma__hairs_051_cyberware_01</td></tr><tr><td>14</td><td><p>hh_013_pwa__hairs_999</p><p><em>hh_013_pwa__hairs_999_cyberware_01</em></p></td><td>hh_014_pma__hairs_025<br><em>hh_014_pma__hairs_025_cyberware_01</em></td></tr><tr><td>15</td><td>hh_008_pwa__hairs_082</td><td>hh_014_pma__hairs_025<br><em>hh_014_pma__hairs_025_cyberware_01</em></td></tr><tr><td>16</td><td>hh_011_pwa__hairs_063</td><td>hh_015_pma__hairs_008<br><em>hh_015_pma__hairs_008_cyberware_01</em></td></tr><tr><td>17</td><td>hh_029_pwa__hairs_088</td><td>hh_016_pma__hairs_011</td></tr><tr><td>18</td><td>hh_040_pwa__hairs_049</td><td>hh_017_pma__hairs_026<br><em>hh_017_pma__hairs_026_cyberware_01</em></td></tr><tr><td>19</td><td>hh_041_pwa__hairs_039</td><td>hh_018_pma__hairs_027</td></tr><tr><td>20</td><td>hh_044_pwa__hairs_140</td><td>hh_019_pma__hairs_031</td></tr><tr><td>21</td><td>hh_045_pwa__hairs_141</td><td>hh_020_pma__hairs_032<br><em>hh_020_pma__hairs_032_cyberware_01</em></td></tr><tr><td>22</td><td>hh_021_pwa__hairs_051<br><em>hh_021_pwa__hairs_051_cyberware_01</em></td><td>hh_021_pma__hairs_040</td></tr><tr><td>23</td><td>hh_022_pwa__hairs_060<br><em>hh_022_pwa__hairs_060_cyberware_01</em></td><td>hh_022_pma__hairs_047<br><em>hh_022_pma__hairs_047_cyberware_01</em></td></tr><tr><td>24</td><td>hh_023_pwa__hairs_064</td><td>hh_023_pma__hairs_048</td></tr><tr><td>25</td><td>hh_024_pwa__hairs_068</td><td>hh_024_pma__hairs_058</td></tr><tr><td>26</td><td>hh_025_pwa__hairs_081</td><td>hh_025_pma__hairs_060<br><em>hh_025_pma__hairs_060_cyberware_01</em></td></tr><tr><td>27</td><td>hh_027_pwa__hairs_083_straight_01<br>hh_035_pwa__hairs_083_braid_01</td><td>hh_026_pma__hairs_061</td></tr><tr><td>28</td><td>hh_027_pwa__hairs_083_straight_01<br>hh_026_pwa__hairs_083_bulb_01</td><td>hh_027_pma__hairs_065</td></tr><tr><td>29</td><td>hh_028_pwa__hairs_077</td><td>hh_028_pma__hairs_068</td></tr><tr><td>30</td><td>hh_029_pwa__hairs_088</td><td>hh_029_pma__hairs_073</td></tr><tr><td>31</td><td>hh_030_pwa__hairs_118</td><td>hh_030_pma__hairs_082<br><em>hh_030_pma__hairs_082_cyberware_01</em></td></tr><tr><td>32</td><td>hh_031_pwa__hairs_115</td><td>hh_031_pma__hairs_089<br><em>hh_031_pma__hairs_089_cyberware_01</em></td></tr><tr><td>33</td><td>hh_032_pwa__hairs_121</td><td>bhh_032_pma__hairs_103</td></tr><tr><td>34</td><td>hh_033_pwa__hairs_151<br><em>hh_033_pwa__hairs_151_cyberware_01</em></td><td>hh_033_pma__hairs_120<br><em>hh_033_pma__hairs_120_cyberware_01</em></td></tr><tr><td>35</td><td>hh_034_pwa__hairs_006<br><em>hh_034_pwa__hairs_006_cyberware_01</em></td><td>hh_034_pma__hairs_007<br><em>hh_034_pma__hairs_007_cyberware_01</em></td></tr><tr><td>36</td><td>hh_083_wa__ponytail_bulb_01</td><td>hh_035_pma__hairs_112</td></tr><tr><td>37</td><td>hh_036_pwa__hairs_093</td><td>hh_036_pma__hairs_113</td></tr><tr><td>38</td><td>hh_038_pwa__hairs_085</td><td><p>hh_000_pma__hairs_045</p><p><em>hh_000_pma__hairs_045_cyberware_01</em></p></td></tr><tr><td>39</td><td>hh_039_pwa__hairs_054<br>hh_039_pwa__hairs_054_cyberware_01</td><td>hh_039_pma__hairs_094</td></tr><tr><td>40</td><td>hh_040_pwa__hairs_049</td><td>hh_040_pma__hairs_049</td></tr><tr><td>41</td><td>hh_041_pwa__hairs_039<br><em>hh_041_pwa__hairs_039_cyberware_01</em></td><td>hh_041_pma__hairs_122</td></tr><tr><td>42</td><td>hh_042_pwa__hairs_103</td><td>hh_042_pma__hairs_093</td></tr><tr><td>43</td><td>hh_043_pwa__hairs_106</td><td>hh_043_pma__hairs_006</td></tr><tr><td>44</td><td>hh_044_pwa__hairs_140<br><em>hh_044_pwa__hairs_140_cyberware_01</em></td><td>hh_044_pma__hairs_140<br><em>hh_044_pma__hairs_140_cyberware_01</em></td></tr><tr><td>45</td><td>hh_045_pwa__hairs_141</td><td>hh_045_pma__hairs_141</td></tr><tr><td>46</td><td>hh_046_pwa__hairs_142<br><em>hh_046_pwa__hairs_142_cyberware_01</em></td><td>hh_046_pma__hairs_142<br><em>hh_046_pma__hairs_142_cyberware_01</em></td></tr><tr><td>47</td><td>hh_047_pwa__hairs_143<br><em>hh_047_pwa__hairs_143_cyberware_01</em></td><td>hh_047_pma__hairs_143<br><em>hh_047_pma__hairs_143_cyberware_01</em></td></tr><tr><td>48</td><td>hh_048_pwa__hairs_144<br><em>hh_048_pwa__hairs_144_cyberware_01</em></td><td>hh_048_pma__hairs_144<br><em>hh_048_pma__hairs_144_cyberware_01</em></td></tr><tr><td>49</td><td>hh_049_pwa__hairs_146<br><em>hh_049_pwa__hairs_146_cyberware_01</em></td><td>hh_049_pma__hairs_146<br><em>hh_049_pma__hairs_146_cyberware_01</em></td></tr><tr><td>50</td><td>hh_013_pwa__hairs_999<br><em>hh_013_pwa__hairs_999_cyberware_01</em></td><td>hh_050_pma__hairs_999<br><em>hh_050_pma__hairs_999_cyberware_01</em></td></tr></tbody></table>



## Beards

Beards are only used by mascV. Their entity files can be found in this folder:&#x20;

```
base\characters\head\player_base_heads\appearances\entity\facial_hairs\
```

Any .app files are stored under

```
base\characters\head\player_base_heads\appearances\facial_hairs\
```

Beard morphtargets and the meshes they pull in can be found in the player's basehead folder:

```
base\characters\head\player_base_heads\player_man_average
```

### Beard files by index

<table><thead><tr><th width="97"></th><th></th></tr></thead><tbody><tr><td>01</td><td>hb_000_pma_c__basehead_shadowbase_01</td></tr><tr><td>02</td><td>hb_000_pma_c__basehead_big_beard_afro</td></tr><tr><td>03</td><td>pma__morphs_default</td></tr><tr><td>04</td><td>hb_000_pma_c__basehead_handlebar_stache</td></tr><tr><td>05</td><td>hb_000_pma_c__basehead_jesse_beard</td></tr><tr><td>06</td><td>hb_000_pma_c__basehead_maelstrom_full</td></tr><tr><td>07</td><td>hb_000_pma_c__basehead_big_beard</td></tr><tr><td>08</td><td>hb_000_pma_c__basehead_short_afro</td></tr><tr><td>09</td><td>hb_000_pma_c__basehead_thick_beard_afro</td></tr><tr><td>10</td><td>hb_000_pma_c__basehead_fu_manchu</td></tr><tr><td>11</td><td>hb_000_pma_c__basehead_logan</td></tr><tr><td>12</td><td>hb_000_pma_c__basehead_patmc</td></tr></tbody></table>

### Beard component names

Any beard uses the same two components, `beard` and `beard_shadow_01`.&#x20;

Beard 01 will **only** use the shadowbase.
