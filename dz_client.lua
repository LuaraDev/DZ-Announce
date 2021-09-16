RegisterNetEvent('dz-announce:client:sendNuiMessage')
AddEventHandler('dz-announce:client:sendNuiMessage', function(length, text)
    if length == 0 or length == nil then length = 7500 end
    TransitionToBlurred(200)
    PlaySound(-1, "Out_Of_Bounds_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 5)
    SendNUIMessage { mode = "toggleOn", length = tonumber(length), text = text }
    Wait(length)
    TransitionFromBlurred(200)
end)