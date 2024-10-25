function NotifyPolice(message, coords)
    exports['visualz_opkaldsliste']:AddCall(nil, message, "police", coords)
end


ESX = exports["es_extended"]:getSharedObject()

utils = {}

function utils.debug(msg)
    if Config.Debug then
        print(("^3DEBUG: %s ^7"):format(msg))
    end
end

ESX.RegisterServerCallback('meka_houserobbery:checkLockpick', function(source, cb, I_)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.getInventoryItem(I_) ~= nil then
            if xPlayer.getInventoryItem(I_).count > 0 then
                cb(true)
            else
                cb(false)
            end
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('meka_houserobbery:breakLockpick', function(source, cb, I_, S_)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        if xPlayer.getInventoryItem(I_) ~= nil then
            if xPlayer.getInventoryItem(I_).count > 0 then
                if Config.Break.CanBreak then
                    local breakChance = math.random(1, 100)
                    if S_ and Config.Break.SuccessBreak then
                        if breakChance <= Config.Break.Chances.SuccessBreak then
                            cb(true)
                            xPlayer.removeInventoryItem(I_, 1)
                        end
                    elseif not S_ and Config.Break.FailedBreak then
                        if breakChance <= Config.Break.Chances.FailedBreak then
                            cb(true)
                            xPlayer.removeInventoryItem(I_, 1)
                        end
                    end
                else
                    cb(false)
                end
            else
                cb(false)
            end
        else
            cb(false)
        end
    end
end)

ESX.RegisterServerCallback('meka_houserobbery:giveItem', function(source, cb, I_, E_)
    if not E_ == "meka_houserobbery:function:rewardClient" then return end
    local xPlayer
    if not source then return else xPlayer = ESX.GetPlayerFromId(source) end
    
    if I_ == "bed" then
        local i_, i_0, i_1, i_2
        if Loot.bed then
            i_  = Loot.tables[Loot.bed]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "fridge" then
        local i_, i_0, i_1, i_2
        if Loot.fridge then
            i_  = Loot.tables[Loot.fridge]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "storage1" then
        local i_, i_0, i_1, i_2
        if Loot.storage1 then
            i_  = Loot.tables[Loot.storage1]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "storage2" then
        local i_, i_0, i_1, i_2
        if Loot.storage2 then
            i_  = Loot.tables[Loot.storage2]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "table" then
        local i_, i_0, i_1, i_2
        if Loot.tableObj then
            i_  = Loot.tables[Loot.tableObj]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "sideBoard" then
        local i_, i_0, i_1, i_2
        if Loot.sideBoard then
            i_  = Loot.tables[Loot.sideBoard]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "tv" then
        local i_, i_0, i_1, i_2
        if Loot.tv then
            i_  = Loot.tables[Loot.tv]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    elseif I_ == "bedside" then
        local i_, i_0, i_1, i_2
        if Loot.bedside then
            i_  = Loot.tables[Loot.bedside]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        else
            i_  = Loot.tables[math.random(1, #Loot.tables)]
            i_0 = i_[math.random(1, #i_)]
            if i_0.item then
                i_1 = i_0.item
                i_2 = math.random(i_0.min, i_0.max)
            else
                cb("found_nothing")
                return
            end
        end

        if xPlayer.canCarryItem(i_1, i_2) then
            xPlayer.addInventoryItem(i_1, i_2)
            cb("found_something")
        else
            cb("not_enough_inv_place")
        end
    end
end)