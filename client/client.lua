local firstSpawn = false							

AddEventHandler("playerSpawned", function ()
	if not firstSpawn then
		ShutdownLoadingScreenNui()
		firstSpawn = true
	end
end)