Citizen.CreateThread(function()
    playerLoaded = ESX.IsPlayerLoaded()

    while not playerLoaded do
        playerLoaded = ESX.IsPlayerLoaded()
        Wait(1000)
    end

    ESX.PlayerData = ESX.GetPlayerData()
    playerData = ESX.PlayerData

    if not playerLoaded then
        utils.debug("PLAYER DID NOT LOAD - SCRIPT CANT FUNCTION")
        return
    end

    if playerLoaded then
        utils.debug("Player Loaded")
        
        utils.debug("Entry Method: " .. Config.EntryMethod)
        if Config.EntryMethod == "target" then
            for k,v in pairs(Houses) do
                H_[k] = {
                    houseLoaded = nil,
                    targets = {
                        exit = nil,
                        bed = nil,
                        storage1 = nil,
                        storage2 = nil,
                        tableObj = nil,
                        bedside = nil,
                        painting1 = nil,
                    },
                    Model = v.Model,
                    Method = v.Method,
                    Item = v.Item,
                    Entry = v.Entry,
                    LockpickDiff = v.LockpickDiff,
                    NewEntrance = nil,
                    Loot = {
                        bed = v.Loot.bed,
                        fridge = v.Loot.fridge,
                        storage1 = v.Loot.storage1,
                        storage2 = v.Loot.storage2,
                        tableObj = v.Loot.tableObj,
                        sideBoard = v.Loot.sideBoard,
                        tv = v.Loot.tv,
                        bedside = v.Loot.bedside,
                        painting1 = v.Loot.painting1,
                    }
                }
                exports.ox_target:addBoxZone({
                    coords = v.Entry,
                    size = vector3(1, 1, 1),
                    options = {
                        {
                            label = L_["rob_house"],
                            icon = 'fa-solid fa-house-lock',
                            onSelect = function()
                                if H_[k].Method == "Lockpick" then
                                    RobHouse(k)
                                elseif H_[k].Method == "..." then
                                    RobHouse(k)
                                end
                            end,
                            canInteract = function(entity, distance, coords, name, bone)
                                local returnvalue = true
                                if playerData.job.name == "police" then
                                    returnvalue = false
                                end
                                return returnvalue
                            end,
                            distance = 1.5
                        },
                        {
                            label = L_["enter_house"],
                            icon = 'fa-solid fa-house-circle-check',
                            groups = Config.PoliceCall.PoliceJobs
                        }
                    }
                })
            end
        end
    end
end)

function GenerateHouseTargets(k)
    local house = H_[k].Model
    if H_[k].Loot.bed then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].bed.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].bed.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].bed.z

        if Config.Houses[H_[k].Model].bed.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].bed.x
        end

        if Config.Houses[H_[k].Model].bed.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].bed.y
        end

        if Config.Houses[H_[k].Model].bed.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].bed.z
        end

        H_[k].targets.bed = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_bed"],
                    icon = 'fa-solid fa-bed',
                    onSelect = function()
                        utils.debug("Searching Bed")
                        SearchObject("bed", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.fridge then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].fridge.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].fridge.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].fridge.z

        if Config.Houses[H_[k].Model].fridge.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].fridge.x
        end

        if Config.Houses[H_[k].Model].fridge.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].fridge.y
        end

        if Config.Houses[H_[k].Model].fridge.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].fridge.z
        end

        H_[k].targets.fridge = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(1, 1, 1),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_fridge"],
                    icon = 'fa-solid fa-bowl-food',
                    onSelect = function()
                        utils.debug("Searching Fridge")
                        SearchObject("fridge", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.storage1 then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].storage1.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].storage1.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].storage1.z

        if Config.Houses[H_[k].Model].storage1.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].storage1.x
        end

        if Config.Houses[H_[k].Model].storage1.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].storage1.y
        end

        if Config.Houses[H_[k].Model].storage1.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].storage1.z
        end

        H_[k].targets.storage1 = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_storage"],
                    icon = 'fa-solid fa-BOX',
                    onSelect = function()
                        utils.debug("Searching Storage")
                        SearchObject("storage1", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.storage2 then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].storage2.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].storage2.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].storage2.z

        if Config.Houses[H_[k].Model].storage2.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].storage2.x
        end

        if Config.Houses[H_[k].Model].storage2.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].storage2.y
        end

        if Config.Houses[H_[k].Model].storage2.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].storage2.z
        end

        H_[k].targets.storage2 = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_storage"],
                    icon = 'fa-solid fa-BOX',
                    onSelect = function()
                        utils.debug("Searching Storage")
                        SearchObject("storage2", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.tableObj then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].tableObj.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].tableObj.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].tableObj.z

        if Config.Houses[H_[k].Model].tableObj.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].tableObj.x
        end

        if Config.Houses[H_[k].Model].tableObj.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].tableObj.y
        end

        if Config.Houses[H_[k].Model].tableObj.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].tableObj.z
        end

        H_[k].targets.tableObj = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_table"],
                    icon = 'fa-solid fa-table',
                    onSelect = function()
                        utils.debug("Searching Table")
                        SearchObject("table", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.sideBoard then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].sideBoard.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].sideBoard.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].sideBoard.z

        if Config.Houses[H_[k].Model].sideBoard.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].sideBoard.x
        end

        if Config.Houses[H_[k].Model].sideBoard.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].sideBoard.y
        end

        if Config.Houses[H_[k].Model].sideBoard.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].sideBoard.z
        end

        H_[k].targets.sideBoard = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_storage"],
                    icon = 'fa-solid fa-box',
                    onSelect = function()
                        utils.debug("Searching Storage")
                        SearchObject("sideBoard", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.tv then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].tv.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].tv.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].tv.z

        if Config.Houses[H_[k].Model].tv.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].tv.x
        end

        if Config.Houses[H_[k].Model].tv.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].tv.y
        end

        if Config.Houses[H_[k].Model].tv.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].tv.z
        end

        H_[k].targets.tv = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_tv"],
                    icon = 'fa-solid fa-tv',
                    onSelect = function()
                        utils.debug("Searching TV")
                        SearchObject("tv", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    if H_[k].Loot.bedside then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].bedside.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].bedside.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].bedside.z

        if Config.Houses[H_[k].Model].bedside.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].bedside.x
        end

        if Config.Houses[H_[k].Model].bedside.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].bedside.y
        end

        if Config.Houses[H_[k].Model].bedside.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].bedside.z
        end

        H_[k].targets.bedside = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(2, 2, 2),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_bedside"],
                    icon = 'fa-solid fa-bed',
                    onSelect = function()
                        utils.debug("Searching Bedside")
                        SearchObject("bedside", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end

    -- DOES NOT WORK FIXING
    if H_[k].Loot.painting1 then
        local newX = H_[k].NewEntrance.x - Config.Houses[H_[k].Model].painting1.x
        local newY = H_[k].NewEntrance.y - Config.Houses[H_[k].Model].painting1.y
        local newZ = H_[k].NewEntrance.z - Config.Houses[H_[k].Model].painting1.z

        if Config.Houses[H_[k].Model].painting1.x2 == "+" then
            newX = H_[k].NewEntrance.x + Config.Houses[H_[k].Model].painting1.x
        end

        if Config.Houses[H_[k].Model].painting1.y2 == "+" then
            newY = H_[k].NewEntrance.y + Config.Houses[H_[k].Model].painting1.y
        end

        if Config.Houses[H_[k].Model].painting1.z2 == "+" then
            newZ = H_[k].NewEntrance.z + Config.Houses[H_[k].Model].painting1.z
        end

        local paintingObject = CreateObject(`paintingObject`, newX, newY, newZ, false, false, false)
	    FreezeEntityPosition(paintingObject,true)
        table.insert(H_[k].houseLoaded, paintingObject)

        H_[k].targets.painting1 = exports.ox_target:addBoxZone({
            coords = vector3(newX, newY, newZ),
            size = vector3(1, 1, 1),
            drawSprite = Config.DrawSprite,
            options = {
                {
                    label = L_["search_painting"],
                    icon = 'fa-solid fa-image',
                    onSelect = function()
                        utils.debug("Searching Painting")
                        SearchObject("painting", k)
                    end,
                    distance = 1.5,
                    canInteract = function(entity, distance, coords, name, bone)
                        local returnvalue = true
                        if playerData.job.name == "police" then
                            returnvalue = false
                        end
                        return returnvalue
                    end
                }
            }
        })
    end 
end
