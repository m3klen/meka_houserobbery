function Notify(title, msg, type)
    lib.notify({
        title = title,
        description = msg,
        showDuration = 7500,
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        type = type
    })
end

function RobHouse(k)
    if H_[k].Method == "Lockpick" then
        houseDiff = H_[k].LockpickDiff
        ESX.TriggerServerCallback("meka_houserobbery:checkLockpick", function(hasLockpick)
            if hasLockpick then
                local success = false
                if houseDiff == 'easy' then
                    success = lib.skillCheck({'easy', 'easy', 'easy', 'medium', 'easy'}, Config.LockpickKeybinds)
                elseif houseDiff == 'medium' then
                    success = lib.skillCheck({'easy', 'medium', 'medium', 'medium', 'easy'}, Config.LockpickKeybinds)
                elseif houseDiif == 'hard' then
                    success = lib.skillCheck({'medium', 'medium', 'medium', 'hard', 'easy'}, Config.LockpickKeybinds)
                end

                
                ESX.TriggerServerCallback("meka_houserobbery:breakLockpick", function(lockpickBroke)
                    if lockpickBroke then
                        Notify("", L_["lockpick_broke"] , "inform")
                    end
                end, H_[k].Item, success)
        
                if success then
                    Notify("", L_["broke_in"], "success")
                    EnterHouse(k)
                    utils.debug("House lockpicked completed: " .. houseDiff)
                else
                    Notify("", L_["failed_brake_in"], "error")
                    utils.debug("House lockpicked failed: " .. houseDiff)
                end
            else
                Notify("", L_["not_enough_lockpicks"], "error")
            end
        end, H_[k].Item)
    else
        print("method disabled")
    end
end

function EnterHouse(k)
    local model = H_[k].Model
    local modelCoords = { x = H_[k].Entry.x, y = H_[k].Entry.y, z = H_[k].Entry.z - 25}
    if model == 'Tier1House' then
        local objects, POIOffsets = CreateTier1HouseFurnished(modelCoords, false)
        utils.debug(json.encode(objects))
        H_[k].houseLoaded = objects[1]
        if Config.EntryMethod == "target" then
            H_[k].NewEntrance = vector3(H_[k].Entry.x, H_[k].Entry.y, H_[k].Entry.z - 25)
            H_[k].targets.exit = exports.ox_target:addBoxZone({
                coords = vector3(H_[k].Entry.x + 3.69693000, H_[k].Entry.y - 16.180020100, H_[k].Entry.z - 22.5),
                size = vector3(1, 1, 1),
                options = {
                    {
                        label = L_["exit_house"],
                        icon = "fa-solid fa-house-circle-xmark",
                        onSelect = function()
                            utils.debug("Exiting House")
                            if lib.progressCircle({
                                duration = 5000,
                                position = 'bottom',
                                useWhileDead = false,
                                canCancel = true,
                                label = L_["leaving_house"],
                                disable = {
                                    move = true
                                }
                            }) then
                                Notify("", L_['left_house'], "success")
                                DespawnInterior(H_[k].houseLoaded)
                                SetEntityCoords(PlayerPedId(), H_[k].Entry.x, H_[k].Entry.y, H_[k].Entry.z)
                                H_[k].houseLoaded = nil
                                for k,targ in pairs(H_[k].targets) do
                                    if targ ~= nil then
                                        exports.ox_target:removeZone(targ)
                                    end
                                end
                            else
                                Notify("", L_['cancel_action'], "error")
                            end
                        end
                    }
                }
            })
            GenerateHouseTargets(k)
        end
    end
end

function SearchObject(object, k)
    if object == "bed" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_bed"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_bed"], "success")
            exports.ox_target:removeZone(H_[k].targets.bed)
            H_[k].targets.bed = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "bed", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "fridge" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_fridge"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_fridge"], "success")
            exports.ox_target:removeZone(H_[k].targets.fridge)
            H_[k].targets.fridge = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "fridge", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "storage1" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_storage"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_storage"], "success")
            exports.ox_target:removeZone(H_[k].targets.storage1)
            H_[k].targets.storage1 = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "storage1", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "storage2" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_storage"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_storage"], "success")
            exports.ox_target:removeZone(H_[k].targets.storage2)
            H_[k].targets.storage2 = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "storage2", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "table" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_table"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_table"], "success")
            exports.ox_target:removeZone(H_[k].targets.tableObj)
            H_[k].targets.tableObj = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "table", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "sideBoard" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_storage"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_storage"], "success")
            exports.ox_target:removeZone(H_[k].targets.sideBoard)
            H_[k].targets.sideBoard = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "sideBoard", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "tv" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_tv"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_tv"], "success")
            exports.ox_target:removeZone(H_[k].targets.tv)
            H_[k].targets.tv = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "tv", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    elseif object == "bedside" then
        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            label = L_["searching_bedside"],
            disable = {
                move = true
            },
            anim = {
                dict = 'anim@gangops@facility@servers@bodysearch@',
                clip = 'player_search'
            },
        }) then
            Notify("", L_["searched_bedside"], "success")
            exports.ox_target:removeZone(H_[k].targets.bedside)
            H_[k].targets.bedside = nil
            ESX.TriggerServerCallback('meka_houserobbery:giveItem', function(result)
                Notify("", L_[result], "inform")
            end, "bedside", "meka_houserobbery:function:rewardClient")
        else
            Notify("", L_['cancel_action'], "error")
        end
    end
end