# TweakDB

A couple different TweakDB records (also called groups) can be used to create a vehicle. The YAML .tweak files shown the examples here can be processed by [WolvenKit ](https://github.com/WolvenKit/WolvenKit)to create a .bin that can be loaded into the game with [TweakDBext](https://github.com/WopsS/TweakDBext). The `groups` section creates the record, and the flats are automatically generated from that.

In addition to adding the record, the `Vehicle.vehicle_list.list` flat (`array:TweakDBID`) must be updated with the TweakDBID of the new record (`Vehicle.vehicle_template` is the TweakDBID of the template, as an example), and `Vehicle.vehicle_list.initially_unlocked_list` (`array:TweakDBID`) can be added to for that vehicle to be available upon the start of the game.

\`\`
