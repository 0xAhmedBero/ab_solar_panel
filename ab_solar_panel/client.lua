ESX = nil
ESX = exports["es_extended"]:getSharedObject()


local Target = exports.ox_target

local solarObjects = {} -- Table to store the solar objects, progress, and timers

RegisterNetEvent('spawnObject')
AddEventHandler('spawnObject', function(x, y, z)
    local objectModel = GetHashKey("prop_solarpanel_03") --solar panel object you can change it from here https://forge.plebmasters.de/objects 
    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local playerHeading = GetEntityHeading(GetPlayerPed(-1))

    local solarSpawn = CreateObject(objectModel, x, y, z-1.15, false)
    SetEntityHeading(solarSpawn, playerHeading)
    FreezeEntityPosition(solarSpawn, true)
    


    TriggerServerEvent('esx_legacy:removeItem', 'solar_panel')

    


    local progress = 0
    local totalTime = 10 -- Total time in seconds -- Here you can change when the battery will be full. Example "10" The battery will be full in 10 seconds
    local interval = 1
    local increment = 100 / (totalTime / interval)

    local function updateProgress()
        progress = progress + increment
        if progress <= 100 then
            SetTimeout(interval * 1000, updateProgress)
        end
    end
    updateProgress()
    local solarOptions = {
        {
            name = 'ox:option1',
            icon = 'fas fa-solar-panel',
            label = 'Open Menu',
            onSelect = function()
                TriggerEvent('soler', solarSpawn, progress)
                
            end 
        }
    }
    Target:addLocalEntity(solarSpawn, solarOptions)

    solarObjects[solarSpawn] = { progress = progress, timer = nil } 
end)

RegisterNetEvent('soler')
AddEventHandler('soler', function(solarSpawn, progress)

    if progress >= 100 then
        lib.registerContext({
            id = 'take_menu_' .. tostring(solarSpawn), -- Unique id for each object
            title = 'Solar Panel Menu',
            options = {
                {
                    title = 'Take',
                    description = 'You can take itbattery, now the battery if full',
                    icon = 'car-battery',
                    onSelect = function()
                        TriggerEvent('removeSolarSpawn', solarSpawn)
                        TriggerServerEvent('esx_legacy:giveItem', 'battery')
                    end 
                },
            }
        })
        lib.showContext('take_menu_' .. tostring(solarSpawn))
    else
        lib.registerContext({
            id = 'solar_menu_' .. tostring(solarSpawn), -- Unique id for each object
            title = 'Solar Panel Menu',
            options = {
                {
                    title = 'Charging',
                    description = 'Wait',
                    icon = 'car-battery',
                    progress = progress,
                    colorScheme = 'blue',
                },
            }
        })
        lib.showContext('solar_menu_' .. tostring(solarSpawn))
    end




    solarObjects[solarSpawn].progress = progress -- Update the progress value in the table
end)

RegisterNetEvent('removeSolarSpawn')
AddEventHandler('removeSolarSpawn', function(solarSpawn)
    if solarObjects[solarSpawn] then
        DeleteEntity(solarSpawn)
        solarObjects[solarSpawn] = nil
    end
end)