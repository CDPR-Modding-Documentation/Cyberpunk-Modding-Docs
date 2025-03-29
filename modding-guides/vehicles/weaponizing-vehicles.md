---
description: How to weaponize a custom vehicle
icon: raygun
---

# Weaponizing vehicles

### Using a weaponised car as base

If you're using a weaponized vehicle as a base for your custom vehicle, then you probably don't need this guide. At most, you just need to change the position of the visual gun meshes and the placement of the gun itself which can be done in `vehicle_slots`in the ent file. Or if you're looking to add rockets to a turret-only vehicle, then read on



### Using a non weaponised car as base

To convert a normal non-weaponised car to weaponised, you need to



**Entity changes**

* Convert the entity type to \`vehicleArmedCarBaseObject\` instead of the default car base object
  * To do this, you'll have to convert the .ent file to JSON and make the edit there and then convert back to JSON
* Modify .ent slots (`vehicle_slots`component in ent) to add weapons (look at a vanilla weaponized vehicle for reference. should be fine to copy paste. The only thing to change here is the transform values)
* Move the effectspawner component as well - again copy paste this from a base vehicle (for the muzzle shoot effect etc)



**.app changes**

* For all appearances, you need to add these visual tags (copy paste from a vanilla weaponized vehicle .app)

<figure><img src="../../.gitbook/assets/image (615).png" alt=""><figcaption></figcaption></figure>

**Tweak changes**

* Append entries to \`weapons\[]\` array in tweak: depending on what you're adding (turrets/rockets - again look at a vanilla weaponized car and just copy paste)
* Modify `vehDataPackage` > \`driverCombat\` as mentioned by boe here: [https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/4gzcGtLrr90pVjAWVdTc/\~/changes/1103/for-mod-creators/modding-guides/vehicles/windows-and-doors-opening-+-mountedweapons-clue](https://app.gitbook.com/o/-MP5ijqI11FeeX7c8-N8/s/4gzcGtLrr90pVjAWVdTc/~/changes/1103/for-mod-creators/modding-guides/vehicles/windows-and-doors-opening-+-mountedweapons-clue)

That's it! add visual gun meshes in the .app and place them properly (They dont do anything in particular other than looking cool)
