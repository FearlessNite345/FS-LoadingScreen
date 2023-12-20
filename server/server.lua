AddEventHandler('playerConnecting', function(_, _, deferrals)
    local source = source

    deferrals.handover({
        name = GetPlayerName(source),
        staffMembers = config.staffMembers,
        news = config.news,
        showLogo = config.showLogo
    })
end)