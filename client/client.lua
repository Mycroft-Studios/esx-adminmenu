local banlength = nil
local showCoords = false
local vehicleDevMode = false
local banreason = 'Unknown'
local kickreason = 'Unknown'
local menuLocation = 'topright' -- e.g. topright (default), topleft, bottomright, bottomleft

local menu = MenuV:CreateMenu(false, _U("admin_menu"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test')
local menu2 = MenuV:CreateMenu(false, _U("admin_options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test1')
local menu4 = MenuV:CreateMenu(false, _U("online_players"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test3')
local menu5 = MenuV:CreateMenu(false, _U("manage_server"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test4')
local menu6 = MenuV:CreateMenu(false, _U("weather_conditions"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test5')
local menu7 = MenuV:CreateMenu(false, _U("dealer_list"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test6')
local menu8 = MenuV:CreateMenu(false, _U("ban"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test7')
local menu9 = MenuV:CreateMenu(false, _U("kick"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test8')
local menu10 = MenuV:CreateMenu(false, _U("permissions"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test9')
local menu11 = MenuV:CreateMenu(false, _U("developer_options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test10')
local menu12 = MenuV:CreateMenu(false, _U("vehicle_options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test11')
local menu13 = MenuV:CreateMenu(false, _U("vehicle_categories"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test12')
local menu14 = MenuV:CreateMenu(false, _U("vehicle_models"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv', 'test13')

RegisterNetEvent('esx-admin:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)

local menu_button = menu:AddButton({
    icon = '😃',
    label = _U("admin_options"),
    value = menu2,
    description = _U("admin_options_desc")
})
local menu_button2 = menu:AddButton({
    icon = '🙍‍♂️',
    label = _U("player_management"),
    value = menu4,
    description = _U("player_management_desc")
})
local menu_button3 = menu:AddButton({
    icon = '🎮',
    label = _U("server_management"),
    value = menu5,
    description = _U("server_management_desc")
})
local menu_button21 = menu:AddButton({
    icon = '🚗',
    label = _U("vehicles"),
    value = menu12,
    description = _U("vehicles_desc")
})
local menu_button4 = menu2:AddCheckbox({
    icon = '🎥',
    label = _U("noclip"),
    value = menu2,
    description = _U("noclip_desc")
})
local menu_button6 = menu2:AddButton({
    icon = '🏥',
    label = _U("revive"),
    value = 'revive',
    description = _U("revive_desc")
})
local menu_button7 = menu2:AddCheckbox({
    icon = '👻',
    label = _U("invisible"),
    value = menu2,
    description = _U("invisible_desc")
})
local menu_button8 = menu2:AddCheckbox({
    icon = '⚡',
    label = _U("god"),
    value = menu2,
    description = _U("god_desc")
})
local names_button = menu2:AddCheckbox({
    icon = '📋',
    label = _U("names"),
    value = menu2,
    description = _U("names_desc")
})
local blips_button = menu2:AddCheckbox({
    icon = '📍',
    label = _U("blips"),
    value = menu2,
    description = _U("blips_desc")
})
local menu_button11 = menu5:AddButton({
    icon = '🌡️',
    label = _U("weather_options"),
    value = menu6,
    description = _U("weather_desc")
})
local menu_button13 = menu5:AddSlider({
    icon = '⏲️',
    label = _U("server_time"),
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = _U("time")
    }, {
        label = '01',
        value = '01',
        description = _U("time")
    }, {
        label = '02',
        value = '02',
        description = _U("time")
    }, {
        label = '03',
        value = '03',
        description = _U("time")
    }, {
        label = '04',
        value = '04',
        description = _U("time")
    }, {
        label = '05',
        value = '05',
        description = _U("time")
    }, {
        label = '06',
        value = '06',
        description = _U("time")
    }, {
        label = '07',
        value = '07',
        description = _U("time")
    }, {
        label = '08',
        value = '08',
        description = _U("time")
    }, {
        label = '09',
        value = '09',
        description = _U("time")
    }, {
        label = '10',
        value = '10',
        description = _U("time")
    }, {
        label = '11',
        value = '11',
        description = _U("time")
    }, {
        label = '12',
        value = '12',
        description = _U("time")
    }, {
        label = '13',
        value = '13',
        description = _U("time")
    }, {
        label = '14',
        value = '14',
        description = _U("time")
    }, {
        label = '15',
        value = '15',
        description = _U("time")
    }, {
        label = '16',
        value = '16',
        description = _U("time")
    }, {
        label = '17',
        value = '17',
        description = _U("time")
    }, {
        label = '18',
        value = '18',
        description = _U("time")
    }, {
        label = '19',
        value = '19',
        description = _U("time")
    }, {
        label = '20',
        value = '20',
        description = _U("time")
    }, {
        label = '21',
        value = '21',
        description = _U("time")
    }, {
        label = '22',
        value = '22',
        description = _U("time")
    }, {
        label = '23',
        value = '23',
        description = _U("time")
    }}
})

menu_button11:On("select",function()
    menu6:ClearItems()
    local elements = {
        [1] = {
            icon = '☀️',
            label = _U("extra_sunny"),
            value = "EXTRASUNNY",
            description = _U("extra_sunny_desc")
        },
        [2] = {
            icon = '☀️',
            label = _U("clear"),
            value = "CLEAR",
            description = _U("clear_desc")
        },
        [3] = {
            icon = '☀️',
            label = _U("neutral"),
            value = "NEUTRAL",
            description = _U("neutral_desc")
        },
        [4] = {
            icon = '🌁',
            label = _U("smog"),
            value = "SMOG",
            description = _U("smog_desc")
        },
        [5] = {
            icon = '🌫️',
            label = _U("foggy"),
            value = "FOGGY",
            description = _U("foggy_desc")
        },
        [6] = {
            icon = '⛅',
            label = _U("overcast"),
            value = "OVERCAST",
            description = _U("overcast_desc")
        },
        [7] = {
            icon = '☁️',
            label = _U("clouds"),
            value = "CLOUDS",
            description = _U("clouds_desc")
        },
        [8] = {
            icon = '🌤️',
            label = _U("clearing"),
            value = "CLEARING",
            description = _U("clearing_desc")
        },
        [9] = {
            icon = '☂️',
            label = _U("rain"),
            value = "RAIN",
            description = _U("rain_desc")
        },

        [10] = {
            icon = '⛈️',
            label = _U("thunder"),
            value = "THUNDER",
            description = _U("thunder_desc")
        },
        [11] = {
            icon = '❄️',
            label = _U("snow"),
            value = "SNOW",
            description = _U("snow_desc")
        },
        [12] = {
            icon = '🌨️',
            label = _U("blizzard"),
            value = "BLIZZARD",
            description = _U("blizzed_desc")
        },
        [13] = {
            icon = '❄️',
            label = _U("light_snow"),
            value = "SNOWLIGHT",
            description = _U("light_snow_desc")
        },
        [14] = {
            icon = '🌨️',
            label = _U("heavy_snow"),
            value = "XMAS",
            description = _U("heavy_snow_desc")
        },
        [15] = {
            icon = '🎃',
            label = _U("halloween"),
            value = "HALLOWEEN",
            description = _U("halloween_desc")
        }
    }
    for k,v in ipairs(elements) do
        local menu_button14 = menu6:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            -- TriggerServerEvent('qb-weathersync:server:setWeather', selection.value)
           ESX.ShowNotification(_U("weather.weather_changed", {value = selection.label}))
        end})
    end
end)

local menu_button69 = menu:AddButton({
    icon = '🔧',
    label = _U("developer_options"),
    value = menu11,
    description = _U("developer_desc")
})
local coords3_button = menu11:AddButton({
    icon = '📋',
    label = _U("copy_vector3"),
    value = 'coords',
    description = _U("vector3_desc")
})
local coords4_button = menu11:AddButton({
    icon = '📋',
    label = _U("copy_vector4"),
    value = 'coords',
    description = _U("vector4_desc")
})
local togglecoords_button = menu11:AddCheckbox({
    icon = '📍',
    label = _U("display_coords"),
    value = nil,
    description = _U("display_coords_desc")
})

local heading_button = menu11:AddButton({
    icon = '📋',
    label = _U("copy_heading"),
    value = 'heading',
    description = _U("copy_heading_desc")
})

local vehicledev_button = menu11:AddButton({
    icon = '🚘',
    label = _U("vehicle_dev_mode"),
    value = nil,
    description = _U("vehicle_dev_mode_desc")
})

local menu_dev_button = menu11:AddCheckbox({
    icon = '⚫',
    label = _U("hud_dev_mode"),
    value = menu11,
    description = _U("hud_dev_mode_desc")
})

local deletelazer_button = menu11:AddCheckbox({
    icon = '🔫',
    label = _U("delete_laser"),
    value = menu11,
    description = _U("delete_laser_desc")
})
local noclip_button = menu11:AddCheckbox({
    icon = '🎥',
    label = _U("noclip"),
    value = menu11,
    description = _U("noclip_desc")
})

local menu12_button1 = menu12:AddButton({
    icon = '🚗',
    label = _U("spawn_vehicle"),
    value = menu13,
    description = _U("spawn_vehicle_desc")
})
local menu12_button2 = menu12:AddButton({
    icon = '🔧',
    label = _U("fix_vehicle"),
    value = 'fix',
    description = _U("fix_vehicle_desc")
})
local menu12_button3 = menu12:AddButton({
    icon = '☠',
    label = _U("remove_vehicle"),
    value = 'remove',
    description = _U("remove_vehicle_desc")
})

local dev = false
menu_dev_button:On('change', function(item, newValue, oldValue)
    dev = not dev
    TriggerEvent('esx-admin:client:ToggleDevmode')
    if dev then
        while dev do
            Wait(200)
            SetPlayerInvincible(PlayerId(), true)
        end
            SetPlayerInvincible(PlayerId(), false)
    end
end)

local deleteLazer = false
deletelazer_button:On('change', function(item, newValue, oldValue)
    deleteLazer = not deleteLazer
end)

local function round(input, decimalPlaces)
    return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", input))
end

local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s)', x, y, z)
        })
       ESX.ShowNotification(_U("success.coords_copied"), "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s)', x, y, z, h)
        })
       ESX.ShowNotification(_U("success.coords_copied"), "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = h
        })
       ESX.ShowNotification(_U("success.heading_copied"), "success")
    end
end

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = round(coords.x, 2)
            c.y = round(coords.y, 2)
            c.z = round(coords.z, 2)
            heading = round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~'.._U("info.ped_coords") .. '~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

RegisterNetEvent('esx-admin:client:ToggleCoords', function()
    ToggleShowCoordinates()
end)

local function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText(_U("info.vehicle_dev_data"), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format(_U("info.ent_id") .. '~b~%s~s~ | ' .. _U("net_id") .. '~b~%s~s~', vehicle, netID), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format(_U("info.model") .. '~b~%s~s~ | ' .. _U("hash") .. '~b~%s~s~', modelName, hash), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format(_U("info.eng_health") .. '~b~%s~s~ | ' .. _U("body_health") .. '~b~%s~s~', round(eHealth, 2), round(bHealth, 2)), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

coords3_button:On("select", function()
    CopyToClipboard('coords3')
end)

coords4_button:On("select", function()
    CopyToClipboard('coords4')
end)

heading_button:On("select", function()
    CopyToClipboard('heading')
end)

vehicledev_button:On('select', function()
    ToggleVehicleDeveloperMode()
end)

noclip_button:On('change', function(item, newValue, oldValue)
    ToggleNoClip()
end)

togglecoords_button:On('change', function()
    ToggleShowCoordinates()
end)

-- local vehicles = {}
-- for k, v in pairs(QBCore.Shared.Vehicles) do
--     local category = v["category"]
--     if vehicles[category] == nil then
--         vehicles[category] = { }
--     end
--     vehicles[category][k] = v
-- end

local vehiclesByCategory = {}
function getVehicles()
	ESX.TriggerServerCallback('esx_vehicleshop:getCategories', function(categories)
		Categories = categories
	end)

	ESX.TriggerServerCallback('esx_vehicleshop:getVehicles', function(vehicles)
		Vehicles = vehicles
	end)

    for i=1, #Categories, 1 do
		vehiclesByCategory[Categories[i].name] = {}
	end

	for i=1, #Vehicles, 1 do
		if IsModelInCdimage(joaat(Vehicles[i].model)) then
			table.insert(vehiclesByCategory[Vehicles[i].category], Vehicles[i])
		else
			print(('[esx_vehicleshop] [^3ERROR^7] Vehicle "%s" does not exist'):format(Vehicles[i].model))
		end
	end
end
getVehicles()

-- Car Categories

local function OpenCarModelsMenu(category)
    menu14:ClearItems()
    MenuV:OpenMenu(menu14)
    for k, v in pairs(vehiclesByCategory[category]) do
        local menu_button10 = menu14:AddButton({
             label = k,
             value = v.model,
             description = 'Spawn ' .. v.model,
             select = function(btn)
                ExecuteCommand("car ".. v.model)
             end
        })
    end
end

menu12_button1:On('Select', function(item)
    menu13:ClearItems()
    for k, v in pairs(Categories) do
        local menu_button10 = menu13:AddButton({
            label = v.name,
            value = k,
            description = _U("category_name"),
            select = function(btn)
                local select = btn.Value
                OpenCarModelsMenu(select)
            end
        })
    end
end)

menu12_button2:On('Select', function(item)
    -- TriggerServerEvent('QBCore:CallCommand', "fix", {})
end)

menu12_button3:On('Select', function(item)
    ExecuteCommand("dv 3")
end)

names_button:On('change', function()
    TriggerEvent('esx-admin:client:toggleNames')
end)

blips_button:On('change', function()
    TriggerEvent('esx-admin:client:toggleBlips')
end)


-- Player List

local function OpenPermsMenu(permsply)
    ESX.TriggerServerCallback('esx-admin:server:getrank', function(rank)
        if rank then
            local selectedgroup = 'Unknown'
            MenuV:OpenMenu(menu10)
            menu10:ClearItems()
            local menu_button20 = menu10:AddSlider({
                icon = '',
                label = 'Group',
                value = 'user',
                values = {{
                    label = 'User',
                    value = 'user',
                    description = 'Group'
                }, {
                    label = 'Admin',
                    value = 'admin',
                    description = 'Group'
                }},
                change = function(item, newValue, oldValue)
                    local vcal = newValue
                    if vcal == 1 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "user", label = "User"}
                    elseif vcal == 2 then
                        selectedgroup = {}
                        selectedgroup[#selectedgroup+1] = {rank = "admin", label = "Admin"}
                    end
                end
            })

            local menu_button21 = menu10:AddButton({
                icon = '',
                label = _U("confirm"),
                value = "giveperms",
                description = 'Give the permission group',
                select = function(btn)
                    if selectedgroup ~= 'Unknown' then
                        TriggerServerEvent('esx-admin:server:setPermissions', permsply.id, selectedgroup)
			            ESX.ShowNotification(_U("success.changed_perm"), 'success')
                        selectedgroup = 'Unknown'
                    else
                       ESX.ShowNotification(_U("error.changed_perm_failed"), 'error')
                    end
                end
            })
        else
            MenuV:CloseMenu(menu)
        end
    end)
end

local function LocalInput(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
  DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
  while (UpdateOnscreenKeyboard() == 0) do
    DisableAllControlActions(0)
    Wait(0)
  end

  if (GetOnscreenKeyboardResult()) then
    local result = GetOnscreenKeyboardResult()
      return result
  end
end

local function LocalInputInt(text, number, windows)
    AddTextEntry("FMMC_MPM_NA", text)
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", windows or "", "", "", "", number or 30)
    while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0)
      Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
      local result = GetOnscreenKeyboardResult()
      return tonumber(result)
    end
end

local function OpenKickMenu(kickplayer)
    MenuV:OpenMenu(menu9)
    menu9:ClearItems()
    local menu_button19 = menu9:AddButton({
        icon = '',
        label = _U("reason"),
        value = "reason",
        description = _U("kick_reason"),
        select = function(btn)
            kickreason = LocalInput(_U("desc.kick_reason"), 255)
        end
    })

    local menu_button18 = menu9:AddButton({
        icon = '',
        label = _U("confirm"),
        value = "kick",
        description = _U("confirm_kick"),
        select = function(btn)
            if kickreason ~= 'Unknown' then
                TriggerServerEvent('esx-admin:server:kick', kickplayer, kickreason)
                kickreason = 'Unknown'
            else
               ESX.ShowNotification(_U("error.missing_reason"), 'error')
            end
        end
    })
end

local function OpenBanMenu(banplayer)
    MenuV:OpenMenu(menu8)
    menu8:ClearItems()
    local menu_button15 = menu8:AddButton({
        icon = '',
        label = _U("reason"),
        value = "reason",
        description = _U("ban_reason"),
        select = function(btn)
            banreason = LocalInput(_U("desc.ban_reason"), 255)
        end
    })

    local menu_button16 = menu8:AddSlider({
        icon = '⏲️',
        label = _U("length"),
        value = '3600',
        values = {{
            label = _U("time.1hour"),
            value = '3600',
            description = _U("time.ban_length")
        }, {
            label = _U("time.6hour"),
            value ='21600',
            description = _U("time.ban_length")
        }, {
            label = _U("time.12hour"),
            value = '43200',
            description = _U("time.ban_length")
        }, {
            label = _U("time.1day"),
            value = '86400',
            description = _U("time.ban_length")
        }, {
            label = _U("time.3day"),
            value = '259200',
            description = _U("time.ban_length")
        }, {
            label = _U("time.1week"),
            value = '604800',
            description = _U("time.ban_length")
        }, {
            label = _U("time.1month"),
            value = '2678400',
            description = _U("time.ban_length")
        }, {
            label = _U("time.3month"),
            value = '8035200',
            description = _U("time.ban_length")
        }, {
            label = _U("time.6month"),
            value = '16070400',
            description = _U("time.ban_length")
        }, {
            label = _U("time.1year"),
            value = '32140800',
            description = _U("time.ban_length")
        }, {
            label = _U("time.permenent"),
            value = '99999999999',
            description = _U("time.ban_length")
        }, {
            label = _U("time.self"),
            value = "self",
            description = _U("time.ban_length")
        }},
        select = function(btn, newValue, oldValue)
            if newValue == "self" then
                banlength = LocalInputInt('Ban Length', 11)
            else
                banlength = newValue
            end
        end
    })

    local menu_button17 = menu8:AddButton({
        icon = '',
        label = _U("confirm"),
        value = "ban",
        description = _U("confirm_ban"),
        select = function(btn)
            if banreason ~= 'Unknown' and banlength ~= nil then
                TriggerServerEvent('esx-admin:server:ban', banplayer, banlength, banreason)
                banreason = 'Unknown'
                banlength = nil
            else
               ESX.ShowNotification(_U("error.invalid_reason_length_ban"), 'error')
            end
        end
    })
end

local function OpenPlayerMenus(player)
    local Players = MenuV:CreateMenu(false, player.cid .. _U("options"), menuLocation, 220, 20, 60, 'size-125', 'none', 'menuv') -- Players Sub Menu
    Players:ClearItems()
    MenuV:OpenMenu(Players)
    local elements = {
        [1] = {
            icon = '💀',
            label = _U("kill"),
            value = "kill",
            description = _U("kill").. " " .. player.cid
        },
        [2] = {
            icon = '🏥',
            label = _U("revive"),
            value = "revive",
            description = _U("revive") .. " " .. player.cid
        },
        [3] = {
            icon = '🥶',
            label = _U("freeze"),
            value = "freeze",
            description = _U("freeze") .. " " .. player.cid
        },
        [4] = {
            icon = '👀',
            label = _U("spectate"),
            value = "spectate",
            description = _U("spectate") .. " " .. player.cid
        },
        [5] = {
            icon = '➡️',
            label = _U("goto"),
            value = "goto",
            description = _U("goto") .. " " .. player.cid .. _U("position")
        },
        [6] = {
            icon = '⬅️',
            label = _U("bring"),
            value = "bring",
            description = _U("bring") .. " " .. player.cid .. " " .. _U("your_position")
        },
        [7] = {
            icon = '🚗',
            label = _U("sit_in_vehicle"),
            value = "intovehicle",
            description = _U("sit_in_veh_desc") .. " " .. player.cid .. " " .. _U("sit_in_veh_desc2")
        },
        [8] = {
            icon = '🎒',
            label = _U("open_inv"),
            value = "inventory",
            description = _U("open") .. " " .. player.cid .. _U("inventories")
        },
        [9] = {
            icon = '👕',
            label = _U("give_clothing_menu"),
            value = "cloth",
            description = _U("clothing_menu_desc") .. " " .. player.cid
        },
        [10] = {
            icon = '🥾',
            label = _U("kick"),
            value = "kick",
            description = _U("kick") .. " " .. player.cid .. " " .. _U("reason")
        },
        [11] = {
            icon = '🚫',
            label = _U("ban"),
            value = "ban",
            description = _U("ban") .. " " .. player.cid .. " " .. _U("reason")
        },
        [12] = {
            icon = '🎟️',
            label = _U("permissions"),
            value = "perms",
            description = _U("give") .. " " .. player.cid .. " " .. _U("permissions")
        }
    }
    for k, v in ipairs(elements) do
        local menu_button10 = Players:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values ~= "ban" and values ~= "kick" and values ~= "perms" then
                    TriggerServerEvent('esx-admin:server:'..values, player)
                elseif values == "ban" then
                    OpenBanMenu(player)
                elseif values == "kick" then
                    OpenKickMenu(player)
                elseif values == "perms" then
                    OpenPermsMenu(player)
                end
            end
        })
    end
end

menu_button2:On('select', function(item)
    menu4:ClearItems()
    ESX.TriggerServerCallback('test:getplayers', function(players)
        for k, v in pairs(players) do
            local menu_button10 = menu4:AddButton({
                label = _U("id") .. v["id"] .. ' | ' .. v["name"],
                value = v,
                description = _U("player_name"),
                select = function(btn)
                    local select = btn.Value -- get all the values from v!
                    OpenPlayerMenus(select) -- only pass what i select nothing else
                end
            }) -- WORKS
        end
    end)
end)

menu_button13:On("select", function(item, value)
    -- TriggerServerEvent("qb-weathersync:server:setTime", value, value)
   ESX.ShowNotification(_U("time.changed", {time = value}))
end)

-- Toggle NoClip

menu_button4:On('change', function(item, newValue, oldValue)
    ToggleNoClip()
end)

-- Revive Self

menu_button6:On('select', function(item)
   TriggerEvent('esx_ambulancejob:revive')
end)

-- Invisible

local invisible = false
menu_button7:On('change', function(item, newValue, oldValue)
    if not invisible then
        invisible = true
        SetEntityVisible(PlayerPedId(), false, 0)
    else
        invisible = false
        SetEntityVisible(PlayerPedId(), true, 0)
    end
end)

-- Godmode

local godmode = false
menu_button8:On('change', function(item, newValue, oldValue)
    godmode = not godmode

    if godmode then
        while godmode do
            Wait(0)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

local function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR =
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

CreateThread(function()	-- While loop needed for delete lazer
	while true do
		sleep = 1000
		if deleteLazer then
		    sleep = 5
		    local color = {r = 255, g = 255, b = 255, a = 200}
		    local position = GetEntityCoords(PlayerPedId())
		    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
		    -- If entity is found then verifie entity
		    if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
			local entityCoord = GetEntityCoords(entity)
			local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
			DrawEntityBoundingBox(entity, color)
			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			Draw2DText(_U("info.obj") .. ': ~b~' .. entity .. '~w~ ' .. _U("model") .. '~b~' .. GetEntityModel(entity), 4, {255, 255, 255}, 0.4, 0.55, 0.888)
			Draw2DText(_U("info.delete_object_info"), 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)
			-- When E pressed then remove targeted entity
			if IsControlJustReleased(0, 38) then
			    -- Set as missionEntity so the object can be remove (Even map objects)
			    SetEntityAsMissionEntity(entity, true, true)
			    --SetEntityAsNoLongerNeeded(entity)
			    --RequestNetworkControl(entity)
			    DeleteEntity(entity)
			end
		    -- Only draw of not center of map
		    elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
			-- Draws line to targeted position
			DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
		    end
		end
		Wait(sleep)
	end
end)
