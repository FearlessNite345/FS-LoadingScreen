AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source

    local playername = GetPlayerName(source)
    local serverName = Config.serverName
    local volume = Config.volume
    local sayings = Config.sayings
    local videoID = Config.videoID

    deferrals.handover({
        playername = playername,
        servername = serverName,
        volume = volume,
        sayings = sayings,
        videoID = videoID,
    })
end)

exports['FS-Lib']:VersionCheck('FS-LoadingScreen', 'fearlessnite345/fs-loadingscreen')
