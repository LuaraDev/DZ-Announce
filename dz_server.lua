Config = {}
Config.FrameWork = "ESX" -- Used framework
Config.Group = "admin" -- Allowed group
Config.Length = 7500 -- Announce time length (7500 = 7.5 seconds).
Config.Used = false -- Don't touch.

if Config.FrameWork == nil or Config.Group == nil then
    print("[dz-announcements] Config framework information is nil.")
else
    if Config.FrameWork == "QBCore" and Config.Group == "mod" then
        print("[dz-announcements] QBCore isn't include 'mod' group.")
    elseif Config.FrameWork == "ESX" and Config.Group == "god" then
        print("[dz-announcements] ESX isn't include 'god' group.")
    else
        if Config.FrameWork == "ESX" then
            TriggerEvent('es:addGroupCommand', 'announce', Config.Group, function(source, args, user)
                Wait(1500)
                if not Config.Used then
                    if args ~= nil then
                        TriggerClientEvent('dz-announce:client:sendNuiMessage', -1, Config.Length, tostring(table.concat(args, " ")))
                        Config.Used = true
                    end
                    Wait(Config.Length + 1000)
                    Config.Used = false
                end
            end, function(source, args, user)
                TriggerClientEvent("dz-notify:client:notify", source, "You're not a admin.", 1)
            end, {help = "Send a new announce to the server players."})
        elseif Config.FrameWork == "QBCore" then
            QBCore = nil
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            QBCore.Commands.Add("announce", "Send a new announce to the server players.", {}, false, function(source, args)
                if not Config.Used then
                    if args ~= nil then
                        TriggerClientEvent('dz-announce:client:sendNuiMessage', -1, Config.Length, tostring(table.concat(args, " ")))
                        Config.Used = true
                    end
                    Wait(Config.Length + 1000)
                    Config.Used = false
                end
            end, Config.Group)
        else
            print("[dz-announcements] Wrong framework name.")
        end
    end
end