local firstSpawn = false

AddEventHandler("playerSpawned", function()
	if not firstSpawn then
		ShutdownLoadingScreenNui()
		if Config.useCanXSpawnSelector then
			TriggerServerEvent('CanX-SpawnSelector:OpenSpawner')
		end
		firstSpawn = true
	end
end)
