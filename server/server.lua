AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source

    local playername = GetPlayerName(source)
    local serverName = Config.serverName
    local volume = Config.volume
    local sayings = Config.sayings
    local videoID = Config.videoID
    local staff = Config.staff
    local news  = Config.news

    deferrals.handover({
        playername = playername,
        servername = serverName,
        volume = volume,
        sayings = sayings,
        videoID = videoID,
        staff = staff,
        news = news
    })
end)
