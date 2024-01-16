AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source

    deferrals.handover({
        name = GetPlayerName(source),
        staffMembers = Config.staffMembers,
        news = Config.news,
        showLogo = Config.showLogo
    })
end)