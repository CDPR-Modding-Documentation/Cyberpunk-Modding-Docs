---
description: Heroes, villains, the extended cast and innocent bystanders
---

# NPCs and their files

## Summary

**Last documented update**: January 6 2024 by [manavortex](https://app.gitbook.com/u/NfZBoxGegfUqB33J9HXuCs6PVaC3 "mention")

This page collects paths to .ent and .app files for various NPCs, as long as somebody considered them interesting enough to document them here.

{% hint style="info" %}
Don't forget: To quickly find somebody's entry, you can use your browser's search function (`Ctrl+F`).
{% endhint %}

### Wait, this isn't what I want!

* To change NPC appearances, see [appearances-change-the-looks](../../../modding-guides/npcs/appearances-change-the-looks/ "mention")
* To create custom NPCs, see [amm-custom-npcs](../../../modding-guides/npcs/amm-custom-npcs/ "mention")
* To create V as an NPC, see [npv-v-as-custom-npc](../../../modding-guides/npcs/npv-v-as-custom-npc/ "mention")
* To find the files of an AMM NPC, check the sub-page [finding-files-amm-npcs.md](finding-files-amm-npcs.md "mention")

***

## Where to find…

CDPR's system of character classification is completely arbitrary and often contains redundancies. If you are looking for a character's files, you're generally much better-off to just [search for it in Wolvenkit](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/usage/wolvenkit-search-finding-files).

If you can't find a character's .ent file, search for variations of their name — e.g. Johnny is `silverhand`, Viktor is `ripperdoc`. Sometimes, it is easier to find the .app file first, and then get the .ent file by using [Find files using this](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this).

{% hint style="info" %}
Major NPCs have their own .app files: \
`base\characters\appearances\main_npc\`.&#x20;

Others are not so lucky - e.g., Mamá Welles is lobbed in with the other valentino goons: \
`base\characters\appearances\gang\gang__valentinos_wa.app`
{% endhint %}

## Character files

You can find the corresponding .app file by right-clicking on the .ent file and selecting [Find files using this](https://app.gitbook.com/s/-MP_ozZVx2gRZUPXkd4r/wolvenkit-app/editor/asset-browser#find-files-using-this "mention"). If that doesn't help, search for entFileName.app (e.g. `silverhand.app`)

### Primary characters

<table data-full-width="false"><thead><tr><th width="187">Character</th><th width="260">Entity File Path</th><th width="306">remark</th></tr></thead><tbody><tr><td>Johnny Silverhand</td><td><code>base\characters\entities\main_npc\silverhand.ent</code></td><td></td></tr><tr><td>Judy</td><td><code>base\quest\secondary_characters\judy.ent</code></td><td>Judy has two .ent files, and the one one under <code>secondary_characters</code> seems to be her main one.</td></tr><tr><td>Panam</td><td><code>base\quest\primary_characters\panam.ent</code></td><td></td></tr><tr><td>Evelyn</td><td><code>base\quest\primary_characters\evelyn.ent</code></td><td></td></tr><tr><td>Misty</td><td><code>base\quest\tertiary_characters\misty.ent</code></td><td></td></tr><tr><td>Jackie</td><td><code>base\quest\secondary_characters\jackie.ent</code></td><td>The app file is named <code>jackie_welles.app</code></td></tr><tr><td>River</td><td><code>base\quest\primary_characters\sobchak.ent</code></td><td>The .ent file is still named after his concept character. The app file is named <code>river_ward.app</code></td></tr><tr><td>Kerry</td><td><code>base\quest\tertiary_characters\kerry.ent</code></td><td>The app file is named <code>kerry_eurodyne.app</code></td></tr><tr><td>Alt Cunningham</td><td><code>base\quest\secondary_characters\alt.ent</code></td><td></td></tr><tr><td>Goro Takemura</td><td><code>base\quest\primary_characters\takemura.ent</code></td><td>The .app file is called <code>goro_takemura.app</code></td></tr><tr><td>Rogue</td><td><code>base\quest\secondary_characters\rogue.ent</code></td><td></td></tr><tr><td>Yorinobu</td><td><code>base\quest\secondary_characters\yorinobu.ent</code></td><td>The .app file is named <code>yorinobu_arasaka.app</code></td></tr><tr><td>Hanako</td><td><code>base\quest\secondary_characters\hanako.ent</code></td><td></td></tr><tr><td>Saburo</td><td><code>base\quest\tertiary_characters\saburo.ent</code></td><td>The .app file is named <code>saburo_arasaka.app</code></td></tr><tr><td>Viktor</td><td><code>base\quest\tertiary_characters\victor_vector.ent</code></td><td><code>victor_vektor.app</code></td></tr><tr><td>President Myers</td><td>ep1\characters\entities\main_npc\president_myers.ent</td><td></td></tr><tr><td>Songbird</td><td>ep1\characters\entities\main_npc\songbird.ent</td><td></td></tr><tr><td>Reed</td><td>ep1\characters\entities\main_npc\reed.ent</td><td></td></tr><tr><td>Kurt Hansen</td><td>ep1\characters\entities\main_npc\kurt.ent</td><td></td></tr><tr><td>Lizzy Wizzy (PL version)</td><td>ep1\characters\entities\main_npc\celebrity_chrome_ep1.ent</td><td></td></tr><tr><td>Alex</td><td>ep1\characters\entities\main_npc\alex.ent</td><td></td></tr><tr><td></td><td></td><td></td></tr></tbody></table>

### Secondary characters

<table data-full-width="false"><thead><tr><th width="187">Character</th><th width="260">Entity File Path</th><th width="306">remark</th></tr></thead><tbody><tr><td>Meredith</td><td><code>base\quest\tertiary_characters\stout.ent</code></td><td>The app file is named <code>meredith_stout.app</code></td></tr><tr><td>Dex</td><td><code>base\quest\secondary_characters\dex.ent</code></td><td></td></tr><tr><td>Smasher</td><td><code>base\characters\entities\boss\adam_smasher.ent</code></td><td>The app file is named <code>boss_adam_smasher_mm.app</code></td></tr><tr><td>T-Bug</td><td><code>base\quest\tertiary_characters\tbug.ent</code></td><td></td></tr><tr><td>Claire</td><td><code>base\quest\tertiary_characters\claire.ent</code></td><td>The .app file is called <code>clair.app</code> (sic)</td></tr><tr><td>Placide</td><td><code>base\quest\tertiary_characters\placide.ent</code></td><td></td></tr><tr><td>Saul </td><td><code>base\quest\secondary_characters\saul.ent</code></td><td></td></tr><tr><td>Mitch</td><td><code>base\quest\tertiary_characters\mitch.ent</code></td><td></td></tr><tr><td>US Cracks</td><td><p>sq017_red_menace.ent</p><p>sq017_purple_force.ent</p><p>sq017_blue_moon.ent</p></td><td>The band shares one .app file, you can find it under <code>us_cracks_band.app</code></td></tr><tr><td>Lizzy Wizzy</td><td><code>base\quest\tertiary_characters\lizzy_wizzy.ent</code></td><td>The .app file is named <code>celebrity_chrome.app</code></td></tr><tr><td>Mama Welles</td><td><code>base\quest\tertiary_characters\mama_welles.ent</code></td><td><code>gang__valentinos_wa.app</code><br><code>(_sq018__mama_welles)</code></td></tr><tr><td>Mr. Blue Eyes</td><td><code>base\quest\main_quests\epilogue\q203\characters\q203_mr_x.ent</code></td><td><p>You can find his appearance as <code>_q003_gman</code> in </p><p><code>citizen__corporat_ma.app</code></p></td></tr></tbody></table>

### Fixers

<table data-full-width="false"><thead><tr><th width="187">Character</th><th width="260">Entity File Path</th><th width="306">remark</th></tr></thead><tbody><tr><td>Dex</td><td><code>base\quest\secondary_characters\dex.ent</code></td><td></td></tr><tr><td>Wakako Okada</td><td><code>base\open_world\fixers\wakako\characters\wakako_okada.ent</code></td><td></td></tr><tr><td>Mr. Hands</td><td><code>ep1\characters\entities\main_npc\mr_hands.ent</code></td><td><code>service__fixer_ma.app</code></td></tr><tr><td>Dakota Smith</td><td><code>base\open_world\fixers\dakota\characters\dakota_smith.ent</code></td><td></td></tr><tr><td>Dino</td><td><code>base\open_world\fixers\dyno\characters\dyno.ent</code></td><td>The .app file is called <code>dino.app</code></td></tr><tr><td>Muamar Reyes</td><td><code>base\open_world\fixers\el_capitan\characters\muamar_reyes.ent</code></td><td>The .app file is called <code>capitan_reyes.app</code></td></tr><tr><td>Regina Jones</td><td><code>base\open_world\fixers\reggie\characters\reggie.ent</code></td><td>The .app file is called <code>service__fixer_wa.app</code></td></tr><tr><td>Padre</td><td><code>base\open_world\fixers\padre\characters\padre.ent</code></td><td>The .app file is called <code>sebastian_perez.app</code></td></tr></tbody></table>

### Also starring (a.k.a. "Wait, who?")

Characters who have very little screen time

<table data-full-width="false"><thead><tr><th width="187">Character</th><th width="260">Entity File Path</th><th width="306">remark</th></tr></thead><tbody><tr><td>8ug8ear</td><td><code>base\open_world\street_stories\heywood\vista_del_rey\sts_hey_rey_09\characters\sts_hey_rey_09_net.ent</code></td><td>The .app file is called <code>8ug8ear.app</code></td></tr><tr><td>Cheri Nowlin</td><td><code>base\quest\main_quests\part1\q105\characters\q105_yakuza_manager.ent</code></td><td>You can find her appearance as <code>_q105__yakuza_receptionis</code> in <code>service_sexworker_wa.app</code></td></tr><tr><td>Rita Wheeler</td><td><code>base\quest\tertiary_characters\lizzies_bouncer.ent</code></td><td>You can find her appearance as <code>_beyond_bouncer_01</code> in <code>gang_mox_wa.app</code></td></tr><tr><td>Rachel Casich</td><td><code>base\quest\side_quests\sq023\characters\sq023_rachel.ent</code></td><td><code>service__specialist_wa.app</code><br><code>(_sq023__bd_producer)</code></td></tr><tr><td>Kirk</td><td><code>base\quest\tertiary_characters\fixer_kirk.ent</code></td><td><code>service__fixer_ma.app</code><br><code>(_q000__kirk_sawyer)</code></td></tr><tr><td>Lizzy Wizzy</td><td><code>base\quest\tertiary_characters\lizzy_wizzy.ent</code></td><td>The app file is called <code>celebrity_chrome.app</code></td></tr></tbody></table>

### Anonymous characters

Characters who don't even have names (but who are interesting regardless)

<table data-full-width="false"><thead><tr><th width="187">Character</th><th width="260">Entity File Path</th><th width="306">remark</th></tr></thead><tbody><tr><td>Ripperdocs</td><td>service__ripperdoc_ma.ent<br>service__ripperdoc_mb.ent<br>service__ripperdoc_wa.ent</td><td><code>service__ripperdoc_ma.app</code><br><code>service__ripperdoc_mb.app</code><br><code>service__ripperdoc_wa.app</code></td></tr><tr><td>Trauma Team</td><td>corpo__traumateam_ma.ent</td><td><code>corpo__traumateam_ma.app</code></td></tr><tr><td>Maxtac</td><td>corpo__max_tac_ma.ent<br>max_tac_mb.ent<br>max_tac_wa.ent</td><td><code>max_tac.app</code><br><code>max_tac_mb.app</code><br><code>max_tac_wa.app</code></td></tr><tr><td>NCPD</td><td><p>corpo__ncpd_ma.ent</p><p>corpo__ncpd_mb.ent<br>corpo__ncpd_wa.ent</p></td><td></td></tr><tr><td>Militech goons</td><td>corpo__militech_ma.ent<br>corpo__militech_mah.ent<br>corpo__militech_mb.ent<br>corpo__militech_wa.ent</td><td>mah seems to be the heavies (soldier types)</td></tr><tr><td>Netwatch</td><td>corpo__netwatch_ma.ent</td><td></td></tr><tr><td>Kangtao </td><td>corpo__kangtao_ma.ent<br>corpo__kangtao_mah.ent</td><td>mah seems to be the heavies (soldier types)</td></tr><tr><td>Arasaka</td><td>corpo__arasaka_ma.ent<br>corpo__arasaka_mah.ent<br>corpo__arasaka_mb.ent<br>corpo__arasaka_mm.ent<br>corpo__arasaka_wa.ent</td><td>mah seems to be the heavies (soldier types)</td></tr><tr><td>Barghest</td><td>gang__kurtz_army_ma.ent<br>gang__kurtz_army_mb.ent<br>gang__kurtz_army_wa.ent</td><td></td></tr><tr><td>Black Ops </td><td>corpo__black_ops_ma.ent<br>corpo__black_ops_mb.ent<br>corpo__black_ops_wa.ent</td><td></td></tr></tbody></table>

There are `_ep1_` variants of a bunch of the generic corpos that can be found in the ep1 files, not sure how they differ from the basegame versions. (ie corpo\_\_ep1\_ncpd\_ma.ent)
