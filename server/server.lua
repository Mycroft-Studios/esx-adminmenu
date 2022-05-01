local frozen = false
local permissions = {
    ['kill'] = 'admin',
    ['ban'] = 'admin',
    ['noclip'] = 'admin',
    ['kickall'] = 'admin',
    ['kick'] = 'admin'
}
local players = {}

-- Get Players
ESX.RegisterServerCallback('test:getplayers', function(source, cb) -- WORKS
    cb(players)
end)

ESX.RegisterServerCallback('esx-admin:server:getrank', function(source, cb)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
        cb(true)
    else
        cb(false)
    end
end)

-- Functions

local function tablelength(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

-- Events

RegisterNetEvent('esx-admin:server:GetPlayersForBlips', function()
    local src = source
    TriggerClientEvent('esx-admin:client:Show', src, players)
end)

RegisterNetEvent('esx-admin:server:kill', function(player)
    TriggerClientEvent('esx:killPlayer', player.id)
end)

RegisterNetEvent('esx-admin:server:revive', function(player)
    TriggerEvent('esx_ambulancejob:revive', player.id)
end)

RegisterNetEvent('esx-admin:server:kick', function(player, reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
        -- TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Kicked', 'red', string.format('%s was kicked by %s for %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        DropPlayer(player.id, _U("kicked_server") .. ':\n' .. reason .. '\n')
    end
end)

RegisterNetEvent('esx-admin:server:ban', function(player, time, reason)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
        local time = tonumber(time)
        local banTime = tonumber(os.time() + time)
        if banTime > 2147483647 then
            banTime = 2147483647
        end
        local timeTable = os.date('*t', banTime)
        MySQL.Async.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            GetPlayerName(player.id),
            GetPlayerIdentifier(player.id, 'license:'),
            GetPlayerIdentifier(player.id, 'discord:'),
            GetPlayerIdentifier(player.id, 'ip:'),
            reason,
            banTime,
            GetPlayerName(src)
        })
        TriggerClientEvent('chat:addMessage', -1, {
            template = "<div class=chat-message server'><strong>ANNOUNCEMENT | {0} has been banned:</strong> {1}</div>",
            args = {GetPlayerName(player.id), reason}
        })
        -- TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(player.id), GetPlayerName(src), reason), true)
        if banTime >= 2147483647 then
            DropPlayer(player.id, _U("banned") .. '\n' .. reason .. _U("ban_perm") .. "QBCore.Config.Server.Discord")
        else
            DropPlayer(player.id, _U("banned") .. '\n' .. reason .. _U("ban_expires") .. timeTable['day'] .. '/' .. timeTable['month'] .. '/' .. timeTable['year'] .. ' ' .. timeTable['hour'] .. ':' .. timeTable['min'] .. '\n🔸 Check our Discord for more information: ' .. "QBCore.Config.Server.Discord")
        end
    end
end)

RegisterNetEvent('esx-admin:server:spectate')
AddEventHandler('esx-admin:server:spectate', function(player)
    local src = source
    local targetped = GetPlayerPed(player.id)
    local coords = GetEntityCoords(targetped)
    TriggerClientEvent('esx-admin:client:spectate', src, player.id, coords)
end)

RegisterNetEvent('esx-admin:server:freeze')
AddEventHandler('esx-admin:server:freeze', function(player)
    local target = GetPlayerPed(player.id)
    if not frozen then
        frozen = true
        FreezeEntityPosition(target, true)
    else
        frozen = false
        FreezeEntityPosition(target, false)
    end
end)

RegisterNetEvent('esx-admin:server:goto', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(GetPlayerPed(player.id))
    SetEntityCoords(admin, coords)
end)

RegisterNetEvent('esx-admin:server:intovehicle', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    -- local coords = GetEntityCoords(GetPlayerPed(player.id))
    local targetPed = GetPlayerPed(player.id)
    local vehicle = GetVehiclePedIsIn(targetPed,false)
    local seat = -1
    if vehicle ~= 0 then
        for i=0,8,1 do
            if GetPedInVehicleSeat(vehicle,i) == 0 then
                seat = i
                break
            end
        end
        if seat ~= -1 then
            SetPedIntoVehicle(admin,vehicle,seat)
            -- TriggerClientEvent('QBCore:Notify', src, _U("sucess.entered_vehicle"), 'success', 5000)
        else
            -- TriggerClientEvent('QBCore:Notify', src, _U("error.no_free_seats"), 'danger', 5000)
        end
    end
end)


RegisterNetEvent('esx-admin:server:bring', function(player)
    local src = source
    local admin = GetPlayerPed(src)
    local coords = GetEntityCoords(admin)
    local target = GetPlayerPed(player.id)
    SetEntityCoords(target, coords)
end)

-- RegisterNetEvent('esx-admin:server:cloth', function(player)
--     TriggerClientEvent('qb-clothing:client:openMenu', player.id)
-- end)

RegisterNetEvent('esx-admin:server:setPermissions', function(targetId, group)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local TargetPlayer = ESX.GetPlayerFromId(targetId)
    if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
        TargetPlayer.setGroup(group[1].rank)
        -- TriggerClientEvent('QBCore:Notify', targetId, _U("rank_level")..group[1].label)
    end
end)

RegisterNetEvent('esx-admin:server:SendReport', function(name, targetSrc, msg)
    local src = source
       local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
            TriggerClientEvent('chat:addMessage', src, {
                color = {255, 0, 0},
                multiline = true,
                args = {_U("info.admin_report")..name..' ('..targetSrc..')', msg}
            })
    end
end)

RegisterNetEvent('esx-admin:server:Staffchat:addMessage', function(name, msg)
    local src = source
       local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
            TriggerClientEvent('chat:addMessage', src, {
                color = {255, 0, 0},
                multiline = true,
                args = {_U("info.staffchat")..name, msg}
            })
    end
end)

-- RegisterNetEvent('esx-admin:server:SaveCar', function(mods, vehicle, hash, plate)
--     local src = source
--     local Player = ESX.GetPlayerFromId(src)
--     local result = MySQL.Sync.fetchAll('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
--     if result[1] == nil then
--         MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
--             Player.PlayerData.license,
--             Player.PlayerData.citizenid,
--             vehicle.model,
--             vehicle.hash,
--             json.encode(mods),
--             plate,
--             0
--         })
--         -- TriggerClientEvent('QBCore:Notify', src, _U("success.success_vehicle_owner"), 'success', 5000)
--     else
--         -- TriggerClientEvent('QBCore:Notify', src, _U("error.failed_vehicle_owner"), 'error', 3000)
--     end
-- end)

-- Commands

RegisterCommand('blips', function(source)
    local src = source
    TriggerClientEvent('esx-admin:client:toggleBlips', src)
end, true)

RegisterCommand('names', function(source)
    local src = source
    TriggerClientEvent('esx-admin:client:toggleNames', src)
end, true)

RegisterCommand('showcoords', function(source)
    local src = source
    TriggerClientEvent('esx-admin:client:ToggleCoords', src)
end, true)

RegisterCommand('menu:noclip', function(source)
    local src = source
    TriggerClientEvent('esx-admin:client:ToggleNoClip', src)
end, true)

RegisterCommand('admin', function(source, args)
    TriggerClientEvent('esx-admin:client:openMenu', source)
end, true)

RegisterCommand('report',function(source, args)
    local src = source
    local msg = table.concat(args, ' ')
    local Player = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx-admin:client:SendReport', -1, GetPlayerName(src), src, msg)
    -- TriggerEvent('qb-log:server:CreateLog', 'report', 'Report', 'green', '**'..GetPlayerName(source)..'** (Identiuf: '..Player.PlayerData.citizenid..' | ID: '..source..') **Report:** ' ..msg, false)
end)

RegisterCommand('staffchat',function(source, args)
    local msg = table.concat(args, ' ')
    TriggerClientEvent('esx-admin:client:SendStaffChat', -1, GetPlayerName(source), msg)
end, true)

RegisterCommand("warn", function(source, args)
    local targetPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
    local senderPlayer = ESX.GetPlayerFromId(source)
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local myName = senderPlayer.getName()
    local warnId = 'WARN-'..math.random(1111, 9999)
    if targetPlayer ~= nil then
		TriggerClientEvent('chat:addMessage', targetPlayer.source, { args = { "SYSTEM", _U("warning_chat_message")..GetPlayerName(source).."," .. _U("reason") .. ": "..msg }, color = 255, 0, 0 })
		TriggerClientEvent('chat:addMessage', source, { args = { "SYSTEM", _U("warning_staff_message")..GetPlayerName(targetPlayer.source)..", for: "..msg }, color = 255, 0, 0 })
        MySQL.Async.insert('INSERT INTO player_warns (senderIdentifier, targetIdentifier, reason, warnId) VALUES (?, ?, ?, ?)', {
            senderPlayer.identifier,
            targetPlayer.identifier,
            msg,
            warnId
        })
    else
        -- TriggerClientEvent('QBCore:Notify', source, _U("error.not_online"), 'error')
    end
end, true)

RegisterCommand('checkwarns', function(source, args)
    if not args[2] then
        local targetPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
        local result = MySQL.Sync.fetchAll('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.identifier })
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', targetPlayer.getName() ..' has '..tablelength(result)..' warnings!')
    else
        local targetPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
        local warnings = MySQL.Sync.fetchAll('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.identifier })
        local selectedWarning = tonumber(args[2])
        if warnings[selectedWarning] then
            local sender = ESX.GetPlayerFromIdentifier(warnings[selectedWarning].senderIdentifier)
            TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', targetPlayer.getName() ..' has been warned by '..sender.name ..', Reason: '..warnings[selectedWarning].reason)
        end
    end
end, true)

RegisterCommand('delwarn', function(source, args)
    local targetPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
    local warnings = MySQL.Sync.fetchAll('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.identifier })
    local selectedWarning = tonumber(args[2])
    if warnings[selectedWarning] then
        local sender = ESX.GetPlayerFromIdentifier(warnings[selectedWarning].senderIdentifier)
        TriggerClientEvent('chat:addMessage', source, 'SYSTEM', 'warning', 'You have deleted warning ('..selectedWarning..') , Reason: '..warnings[selectedWarning].reason)
        MySQL.Async.execute('DELETE FROM player_warns WHERE warnId = ?', { warnings[selectedWarning].warnId })
    end
end, true)

RegisterCommand('reportr', function(source, args, rawCommand)
    local src = source
    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local OtherPlayer = ESX.GetPlayerFromId(playerId)
    if msg == '' then return end
    if not OtherPlayer then return end -- TriggerClientEvent('QBCore:Notify', src, 'Player is not online', 'error') end
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') ~= 1 then return end
    TriggerClientEvent('chat:addMessage', playerId, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Admin Response', msg}
    })
    TriggerClientEvent('chat:addMessage', src, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Report Response ('..playerId..')', msg}
    })
    -- TriggerClientEvent('QBCore:Notify', src, 'Reply Sent')
    -- TriggerEvent('qb-log:server:CreateLog', 'report', 'Report Reply', 'red', '**'..GetPlayerName(src)..'** replied on: **'..OtherPlayer.PlayerData.name.. ' **(ID: '..OtherPlayer.PlayerData.source..') **Message:** ' ..msg, false)
end, true)

RegisterCommand('setmodel',function(source, args)
    local model = args[1]
    local target = tonumber(args[2])
    if model ~= nil or model ~= '' then
        if target == nil then
            TriggerClientEvent('esx-admin:client:SetModel', source, tostring(model))
        else
            local Trgt = ESX.GetPlayerFromId(target)
            if Trgt ~= nil then
                TriggerClientEvent('esx-admin:client:SetModel', target, tostring(model))
            else
                -- TriggerClientEvent('QBCore:Notify', source, _U("error.not_online"), 'error')
            end
        end
    else
        -- TriggerClientEvent('QBCore:Notify', source, _U("error.failed_set_model"), 'error')
    end
end, true)

RegisterCommand('setspeed',function(source, args)
    local speed = args[1]
    if speed ~= nil then
        TriggerClientEvent('esx-admin:client:SetSpeed', source, tostring(speed))
    else
        -- TriggerClientEvent('QBCore:Notify', source, _U("error.failed_set_speed"), 'error')
    end
end, true)

RegisterCommand('kickall',function(source, args)
    local src = source
    if src > 0 then
        local reason = table.concat(args, ' ')
        if xPlayer.group == "admin" or IsPlayerAceAllowed(src, 'command') then
            if reason and reason ~= '' then
                for k, xPlayer in pairs(ESX.GetExtendedPlayers()) do
                    if xPlayer then
                        DropPlayer(xPlayer.source, reason)
                    end
                end
            else
                -- TriggerClientEvent('QBCore:Notify', src, _U("no_reason_specified"), 'error')
            end
        end
    else
        for k, v in pairs(ESX.GetExtendedPlayers()) do
            local Player = ESX.GetPlayerFromId(v)
            if Player then
                DropPlayer(xPlayer.source, _U("server_restart") .. "")
            end
        end
    end
end, true)

-- RegisterCommand('setammo', _U("commands.ammo_amount_set"), {{name='amount', help='Amount of bullets, for example: 20'}, {name='weapon', help='Name of the weapen, for example: WEAPON_VINTAGEPISTOL'}}, false, function(source, args)
--     local src = source
--     local weapon = args[2]
--     local amount = tonumber(args[1])

--     if weapon ~= nil then
--         TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
--     else
--         TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, 'current', amount)
--     end
-- end, 'admin')

CreateThread(function()
    while true do
        local tempPlayers = {}
        for k, xPlayer in pairs(ESX.GetExtendedPlayers()) do
            local targetped = GetPlayerPed(v)
            tempPlayers[#tempPlayers + 1] = {
                name = xPlayer.getName(),
                id = xPlayer.playerId,
                coords = GetEntityCoords(targetped),
                cid = xPlayer.getName(),
                citizenid = xPlayer.identifier,
                sources = GetPlayerPed(xPlayer.source),
                sourceplayer = xPlayer.source

            }
        end
        -- Sort players list by source ID (1,2,3,4,5, etc) --
        table.sort(tempPlayers, function(a, b)
            return a.id < b.id
        end)
        players = tempPlayers
        Wait(1500)
    end
end)
