local CurrentAction, CurrentActionMsg, CurrentActionData, HasAlreadyInMarker, LastZone = nil, '', {}, false, nil


--Draw marker and marker event
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        local markerData = Config.Marker
        local isInMarker = false
        local currentZone
        for _,v in pairs(Config.Elevator) do
            for i=1, #v, 1 do
                if Config.DisplayMarker then
                    if GetDistanceBetweenCoords(coords, v[i].Pos, true) <= Config.DrawDistance then
                        DrawMarker(markerData.Type, v[i].Pos[1], v[i].Pos[2], v[i].Pos[3]-1, 0, 0, 0, 0, 0, 0, markerData.Size.x, markerData.Size.y, markerData.Size.z, markerData.color.r, markerData.color.g, markerData.color.b, markerData.color.a, 0, 0, 2, 0, nil, nil, 0)
                    end
                end
                if GetDistanceBetweenCoords(coords, v[i].Pos, true) <= markerData.Size.x then
                    isInMarker = true
                    currentZone = v[i].Label
                    LastZone = v[i].Label
                end
            end
        end
        if isInMarker and not HasAlreadyInMarker then
            HasAlreadyInMarker = true
            TriggerEvent('PA_Elevator:EnteredMarker', currentZone)
        end
        if not isInMarker and HasAlreadyInMarker then
            HasAlreadyInMarker = false
            TriggerEvent('PA_Elevator:ExitedMarker', LastZone)
        end
    end
end)

RegisterNetEvent('PA_Elevator:EnteredMarker')
AddEventHandler('PA_Elevator:EnteredMarker', function(zone)
    --Nord
        if zone == "3ème étage Nord" then
            CurrentAction = 'nord_3'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "2ème étage Nord" then
            CurrentAction = 'nord_2'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "1er étage Nord" then
            CurrentAction = 'nord_1'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "3ème sous-sol Nord" then
            CurrentAction = 'nord_3ss'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "2ème sous-sol Nord" then
            CurrentAction = 'nord_2ss'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "1er sous-sol Nord" then
            CurrentAction = 'nord_1ss'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
    --Sud
        if zone == "Toit" then
            CurrentAction = 'sud_roof'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "5ème étage Sud" then
            CurrentAction = 'sud_5'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "4ème étage Sud" then
            CurrentAction = 'sud_4'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "3ème étage Sud" then
            CurrentAction = 'sud_3'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "2ème étage Sud" then
            CurrentAction = 'sud_2'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "1er étage Sud" then
            CurrentAction = 'sud_1'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "3ème sous-sol Sud" then
            CurrentAction = 'sud_3ss'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "2ème sous-sol Sud" then
            CurrentAction = 'sud_2ss'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
        if zone == "1er sous-sol Sud" then
            CurrentAction = 'sud_1ss'
            CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
            CurrentActionData = {zone = zone}
        end
end)

RegisterNetEvent('PA_Elevator:ExitedMarker')
AddEventHandler('PA_Elevator:ExitedMarker', function()
    RageUI.CloseAll()
    CurrentAction = nil
    CurrentActionMsg = ''
    CurrentActionData = {}
end)

--Key action
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if CurrentAction ~= nil then
            Visual.FloatingHelpText(CurrentActionMsg)
            if IsControlJustPressed(0,51) then
                if CurrentAction == 'sud_roof' or
                CurrentAction == 'sud_5' or
                CurrentAction == 'sud_4' or
                CurrentAction == 'sud_3' or
                CurrentAction == 'sud_2'or
                CurrentAction == 'sud_1' or
                CurrentAction == 'sud_3ss' or
                CurrentAction == 'sud_2ss' or
                CurrentAction == 'sud_1ss' then
                    RageUI.Visible(RMenu:Get('elevator', 'sud'), true)
                end
                if CurrentAction == 'nord_3' or
                CurrentAction == 'nord_2'or
                CurrentAction == 'nord_1' or
                CurrentAction == 'nord_3ss' or
                CurrentAction == 'nord_2ss' or
                CurrentAction == 'nord_1ss' then
                    RageUI.Visible(RMenu:Get('elevator', 'nord'), true)
                end
                CurrentAction = nil
            end
        end
    end
end)

--Menu
RMenu.Add('elevator', 'sud', RageUI.CreateMenu("Ascenseur sud", "Etage"))
RMenu:Get('elevator', 'sud'):DisplayGlare(false)
RMenu.Add('elevator', 'nord', RageUI.CreateMenu("Ascenseur nord", "Etage"))
RMenu:Get('elevator', 'nord'):DisplayGlare(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        RageUI.IsVisible(RMenu:Get('elevator', 'sud'), function()
            RMenu:Get('elevator', 'sud'):SetSubtitle("Etage actuel : "..LastZone)
            for i=1, #Config.Elevator.Sud, 1 do
                RageUI.Button(Config.Elevator.Sud[i].Label, Config.Elevator.Sud[i].Description, {}, true, {
                    onSelected = function()
                        DoScreenFadeOut(500)
                        Wait(500)
                        SetEntityCoords(playerPed, Config.Elevator.Sud[i].Pos[1], Config.Elevator.Sud[i].Pos[2],Config.Elevator.Sud[i].Pos[3]-1)
                        SetEntityHeading(playerPed, Config.Elevator.Sud[i].Heading)
                        DoScreenFadeIn(500)
                        Wait(500)
                    end
                })
            end
        end)
        RageUI.IsVisible(RMenu:Get('elevator', 'nord'), function()
            RMenu:Get('elevator', 'nord'):SetSubtitle("Etage actuel : "..LastZone)
            for i=1, #Config.Elevator.Nord, 1 do
                RageUI.Button(Config.Elevator.Nord[i].Label, Config.Elevator.Nord[i].Description, {}, true, {
                    onSelected = function()
                        DoScreenFadeOut(500)
                        Wait(500)
                        SetEntityCoords(playerPed, Config.Elevator.Nord[i].Pos[1], Config.Elevator.Nord[i].Pos[2],Config.Elevator.Nord[i].Pos[3]-1)
                        SetEntityHeading(playerPed, Config.Elevator.Nord[i].Heading)
                        DoScreenFadeIn(500)
                        Wait(500)
                    end
                })
            end
        end)
    end
end)