Config = {}

Config.useCanXSpawnSelector = false -- This is only to be enabled if you use this resource https://github.com/CanX-Script/spawn-selector

Config.serverName =
'CHANGEME'                          -- Server name that will show in any welcome message spot that the {servername} is at as shown below in Config.sayings
Config.volume = 0.1                 -- Music volume for the loading screen
Config.videoID = 'o9tVz3JbjEs'      -- The youtube video id you want to be used for the background video

-- You can make these sayings what ever you want just know anywhere {playername} is is where the persons name will be shown and
-- same for the {servername} but it uses the Config.serverName above for that
Config.sayings = {
    "Hello {playername}! You're now part of the {servername} community!",
    "Greetings {playername}! Dive into the adventures awaiting you on {servername}!",
    "Welcome aboard, {playername}! {servername} is thrilled to have you!",
    "Hi {playername}! {servername} is your new home away from home!",
    "Hey {playername}! {servername} is where the magic happens, enjoy your time here!",
    "Welcome {playername}! Get ready for an amazing journey on {servername}!",
    "Hi there, {playername}! {servername} is excited to welcome you to our world!",
    "Howdy {playername}! {servername} promises a thrilling experience for you!",
    "Warm welcome, {playername}! Explore, enjoy, and make memories on {servername}!"
}

-- You can have as many staff as you want as it allows scrolling
Config.staff = {
    {
        name = 'CHANGEME',  -- The players name
        rank = 'CHANGEME',  -- Rank name you want for that person example being Owner
    }
}

Config.news = '' -- Whatever you put in there will show inside the updates / news section
