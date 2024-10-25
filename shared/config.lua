Config = {}
Config.Debug = true -- debug mode
Config.Locale = "da" -- locale file

Config.HouseCooldown = 1 -- Minutes
Config.SearchTime = 1
Config.EntryMethod = 'target' -- target // bind
Config.DrawSprite = false -- if the sprite in target must be drawn (inside house)

Config.LockpickKeybinds = {"w", "a"}

Config.Break = {
    CanBreak = true, -- if the lockpick can break
    SuccessBreak = true, -- Even if the player succeded in lockpicking there is a chance the lockpick will break.
    FailedBreak = true, -- If the player fails lockpicking the house there is a chance the lockpick will break.
    Chances = { -- Chanches for the lockpick to break
        SuccessBreak = 10,
        FailedBreak = 100,
    }
}

Config.PoliceCall = {
    CallEnable = true, -- Enables police calls
    SuccessBreak = true, -- Even if the player succeds in lockpicking there is a chanche the police will get a call.
    FailedBreak = true, -- If the player fails lockpicking there is a chance the police will get a call.
    Chances = { -- Chanches for a police call
        SuccessBreak = 10,
        FailedBreak = 100,
    },
    PoliceJobs = {
        "police",
        "sheriff"
    },
    PoliceCanRob = true,
}