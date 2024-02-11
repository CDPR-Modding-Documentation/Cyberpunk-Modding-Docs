tutorial_mod = {
	description = "just manas custom tweaks, nothing to see here, move along",
	rootPath = "tutorial_mod",
	showUI = false
}

-- this mod is up-to-date with Cyberpunk 2.1.1

function tutorial_mod:new()
	
	setmetatable(tutorial_mod, self)	
	
	-- reading it from the global namespace is really inefficient. Put stuff into 
	-- local variables if you plan on frequently using them and if they don't go bad
	-- (e.g. stateful stuff that you need to re-query or re-refresh often)
	self.transactionSystem = nil  
	function getTransactionSystem()
		if not self.transactionSystem then self.transactionSystem = Game.GetTransactionSystem() end
		return self.transactionSystem
	end
	
	self.player = nil  
	function getPlayer()
		if not self.player then self.player = Game.GetPlayer() end
		return self.player
	end
	
	-- we're setting this in the hook when the equipment system gets loaded
	self.equipmentSystem = nil
	
	-- this is a helper function to add a certain item to your inventory.
	function addItemToInventory(itemIdString, shouldEquip) 
		local item = getTransactionSystem():GetItemDataByTDBID(getPlayer(), itemIdString)
		
		local itemID -- we need this to equip the item, in case we want that
		if IsDefined(item) then
			itemID = item:GetID()
			else
			itemID = ItemID.FromTDBID(itemIdString)
			self.transactionSystem:GiveItem(self.player, itemID, 1)
		end
		
		-- the second check is unnecessary because we're only calling this function after
		-- equipmentSystem has been set, but better safe than sorry
		if not shouldEquip or not self.equipmentSystem then return end 
		
		-- now let's equip it
		self.equipmentSystem:GetPlayerData(self.player):EquipItem(itemID)
		
	end
	
	-- This function registers a hotkey to toggle a game setting on and off. 
	registerHotkey("toggle_lights", "Toggle Bright Lights", function()
		print("tutorial_mod - hotkey toggle_lights used")
		local currentLight = tonumber(GameOptions.GetFloat("Rendering", "ForcedExposureAvgLum")) 
		local newLightState = 1 == currentLight and 0 or 1 -- if 1 == currentLight then set 0 else set 1
		GameOptions.SetFloat("Rendering", "ForcedExposureAvgLum", newLightState) 
	end)
	
	
	-- this function registers your mod. 
	registerForEvent('onInit', function()
		
		print("tutorial_mod -  on init started")
		
		-- wait until the player is fully loaded
		ObserveAfter('EquipmentSystem', 'OnPlayerAttach', function(equipmentSystem)
			print("tutorial_mod - equipment system and player initialized")
			
			-- keep this around so we can use it across the mod
			self.equipmentSystem = equipmentSystem
			
			-- sets Albedo multiplier to its exact value (so you can see how to do this)
			GameOptions.SetFloat("Editor/Characters/Hair", "AlbedoMultiplier", GameOptions.GetFloat("Editor/Characters/Hair", "AlbedoMultiplier"))
			
			-- always equip legendary strongarms
			addItemToInventory('Items.StrongArmsLegendary', true)
		end)
		
		print("tutorial_mod -  on init done")
	end)
	
	
	return tutorial_mod
end

return tutorial_mod:new()
