local CurrentAction
local CurrentActionMsg = ''
local CurrentActionData = {}
local HasAlreadyInMarker = false
local LastZone

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
            for i=1, #v.floor, 1 do
                if Config.DisplayMarker then
                    if GetDistanceBetweenCoords(coords, v.floor[i].Pos, true) <= Config.DrawDistance then
                        DrawMarker(markerData.Type, v.floor[i].Pos[1], v.floor[i].Pos[2], v.floor[i].Pos[3]-1, 0, 0, 0, 0, 0, 0, markerData.Size.x, markerData.Size.y, markerData.Size.z, markerData.color.r, markerData.color.g, markerData.color.b, markerData.color.a, 0, 0, 2, 0, nil, nil, 0)
                    end
                end
                if GetDistanceBetweenCoords(coords, v.floor[i].Pos, true) <= markerData.Size.x then
                    isInMarker = true
                    currentZone = v.floor[i].id
                    LastZone = v.floor[i].Label
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
    for _,v in pairs(Config.Elevator) do
        for i=1, #v.floor, 1 do
            if zone == v.floor[i].id then
                CurrentAction = zone
            end
        end
    end
    CurrentActionMsg = "Appuyez sur ~INPUT_PICKUP~ pour prendre l'ascenseur"
    CurrentActionData = {zone = zone}
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
                for k,v in pairs(Config.Elevator) do
                    for i=1, #v.floor, 1 do
                        if CurrentAction == v.floor[i].id then
                            RageUI.Visible(RMenu:Get('elevator', k), true)
                        end
                    end
                end
                CurrentAction = nil
            end
        end
    end
end)

---Menu
for k,v in pairs(Config.Elevator) do
    RMenu.Add('elevator', k, RageUI.CreateMenu(v.label, "Etage"))
end
---Menu Param
for k,_ in pairs(RMenu:GetType('elevator')) do
    RMenu:GetType('elevator')[k].Menu:DisplayGlare(false)
    RMenu:GetType('elevator')[k].Menu:DisplayPageCounter(false)
end
---Menu Content
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        for k,v in pairs(Config.Elevator) do
            RageUI.IsVisible(RMenu:Get('elevator', k), function()
                RMenu:Get('elevator', k):SetSubtitle("Etage actuel : "..LastZone)
                for i=1, #v.floor, 1 do
                    RageUI.Button(v.floor[i].Label, v.floor[i].Description, {}, true, {
                        onSelected = function()
                            DoScreenFadeOut(500)
                            Wait(500)
                            SetEntityCoords(playerPed, v.floor[i].Pos[1], v.floor[i].Pos[2],v.floor[i].Pos[3]-1)
                            SetEntityHeading(playerPed, v.floor[i].Heading)
                            DoScreenFadeIn(500)
                            Wait(500)
                        end
                    })
                end
            end)
        end
    end
end)