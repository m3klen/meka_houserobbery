Houses = {
    {
        Model = "Tier1House", -- The house model (Find list on the docs)
        Method = "Lockpick", -- The method to get into the house (Find list on the docs)
        Item = "lockpick_advanced", -- The item needed to lockpick the house
        Entry = vector3(1386.3147, -593.4901, 74.4855), -- Entrace of the house
        LockpickDiff = "easy", -- Difficulty of the lockpick
        Loot = {
            bed = true,
            fridge = true,
            storage1 = true,
            storage2 = true,
            tableObj = true,
            sideBoard = true,
            tv = true,
            bedside = true,
            painting1 = true,
        }
    }
}

Loot = {
    tables = {
        [1] = {
            [1] = {
                item = "bread",
                min = 1,
                max = 5,
            },
            [2] = {
                item = "phone",
                min = 1,
                max = 1,
            },
            [3] = {
                item = "money",
                min = 250,
                max = 850,
            },
            [4] = {
                item = "vodka",
                min = 1,
                max = 3,
            },
            [5] = {
                item = "gold",
                min = 1,
                max = 8,
            },
            [6] = {
                item = "bread",
                min = 1,
                max = 5,
            },
            [7] = {
                item = nil, -- THIS IS A CHANCE FOR NOTHING
            }
        },
        [2] = {
            [1] = {
                item = "diamond",
                min = 1,
                max = 5,
            },
            [2] = {
                item = "rolex",
                min = 1,
                max = 1,
            },
            [3] = {
                item = "phone",
                min = 1,
                max = 1,
            },
            [4] = {
                item = "money",
                min = 250,
                max = 850,
            },
            [5] = {
                item = "vodka",
                min = 1,
                max = 3,
            },
            [6] = {
                item = "gold",
                min = 1,
                max = 8,
            },
            [7] = {
                item = "bread",
                min = 1,
                max = 5,
            },
            [8] = {
                item = nil, -- THIS IS A CHANCE FOR NOTHING
            }
        }
    },
    bed = nil, -- THE TABLE, a number or nil for random
    fridge = nil,
    storage1 = nil,
    storage2 = nil,
    tableObj = nil,
    sideBoard = nil,
    tv = nil,
    bedside = nil,
    painting = nil,
}

Config.Houses = { -- DO NOT TOUCH IF U DONT KNOW WHAT UR DOING
    ["Tier1House"] = {
        bed = {
            x = 6.86376900,
            x2 = "+",
            y = 1.20651200,
            y2 = "+",
            z = 1.36589100,
            z2 = "+",
        },
        fridge = {
            x = 1.90339700,
            x2 = "+",
            y = 3.80026800,
            y2 = "-",
            z = 2.09917900,
            z2 = "+"
        },
        storage1 = {
            x = 8.47819500,
            x2 = "+",
            y = 2.50979300,
            y2 = "-",
            z = 1.19712300,
            z2 = "+",
        },
        storage2 = {
            x = 9.75982700,
            x2 = "+",
            y = 1.35874100,
            y2 = "-",
            z = 1.29625800,
            z2 = "+",
        },
        tableObj = {
            x = 3.50712600,
            x2 = "-",
            y = 4.13621600,
            y2 = "-",
            z = 1.29625800,
            z2 = "+",
        },
        sideBoard = {
            x = 2.84053000,
            x2 = "+",
            y = 4.30947100,
            y2 = "-",
            z = 1.24577300,
            z2 = "+",
        },
        tv = {
            x = 5.53120400,
            x2 = "-",
            y = 0.76299670,
            y2 = "+",
            z = 0.57236000,
            z2 = "+",
        },
        bedside = {
            x = 5.84416200,
            x2 = "+",
            y = 2.57377400,
            y2 = "+",
            z = 1.22089100,
            z2 = "+",
        },

        painting1 = {
            x = 1.5223,
            x2 = "+",
            y = 8.1381,
            y2 = "2",
            z = 2.17236000,
            z2 = "+",
        }
    }
}