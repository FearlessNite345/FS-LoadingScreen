AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source

    local playername = GetPlayerName(source)
    local serverName = Config.serverName
    local volume = Config.volume
    local sayings = Config.sayings

    deferrals.handover({
        playername = playername,
        serverName = serverName,
        volume = volume,
        sayings = sayings,
    })
end)
