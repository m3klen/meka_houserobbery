ESX = exports["es_extended"]:getSharedObject()

utils = {}
peds = {}

playerData = {}
playerLoaded = false
L_ = Locales[Config.Locale]
H_ = {}
local CreatePed                       = CreatePed
local FreezeEntityPosition            = FreezeEntityPosition
local SetEntityInvincible             = SetEntityInvincible
local SetBlockingOfNonTemporaryEvents = SetBlockingOfNonTemporaryEvents
local SetModelAsNoLongerNeeded        = SetModelAsNoLongerNeeded
local RegisterNetEvent                = RegisterNetEvent
local AddBlipForCoord                 = AddBlipForCoord
local SetBlipSprite                   = SetBlipSprite
local SetBlipDisplay                  = SetBlipDisplay
local SetBlipScale                    = SetBlipScale
local SetBlipColour                   = SetBlipColour
local SetBlipAsShortRange             = SetBlipAsShortRange
local BeginTextCommandSetBlipName     = BeginTextCommandSetBlipName
local AddTextComponentString          = AddTextComponentString
local EndTextCommandSetBlipName       = EndTextCommandSetBlipName



function utils.createPed(name, coords)
    local model = lib.requestModel(name)

    if not model then return end

    local ped = CreatePed(0, model, coords, false, false)

    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetModelAsNoLongerNeeded(model)

    table.insert(peds, ped)

    return ped
end

function utils.showNotification(msg, type)
    lib.notify({
        title = Lang['DEALER_NAME'],
        description = msg,
        type = type and type or 'info'
    })
end

function utils.debug(msg)
    if Config.Debug then
        print(("^3DEBUG: %s ^7"):format(msg))
    end
end

function utils.getCurrentLocation()
    local playerPed = cache.coords and cache.coords or cache.ped
    local playerCoords = cache.coords or GetEntityCoords(playerPed)
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    local currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    local currentArea = GetLabelText(tostring(GetNameOfZone(playerCoords.x, playerCoords.y, playerCoords.z)))
    local currentLocation = currentArea
    if not zone then zone = "UNKNOWN" end

    if currentStreetName and currentStreetName ~= "" then
        currentLocation = currentLocation .. ", " .. currentArea
    end

    return currentLocation
end

function utils.createBlip(data)
    local blip = AddBlipForCoord(data.pos)
    SetBlipSprite(blip, data.type)
    SetBlipDisplay(blip, 6)
    SetBlipScale(blip, data.scale)
    SetBlipColour(blip, data.colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.name)
    EndTextCommandSetBlipName(blip)

    return blip
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end
    for k, v in pairs(peds) do
        if DoesEntityExist(v) then
            DeletePed(v)
        end
    end
end)