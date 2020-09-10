Config = {
    DisplayMarker = true,
    DrawDistance = 50,
    Marker = {
        Type = 1,
        Size = {x = 1.5, y = 1.5, z = 0.5},
        color = {r = 0, g = 0, b = 255, a = 255},
    },
    Elevator = {
        nord = {
            label = "Ascenseur nord",
            floor = {
                {
                    Label = "3ème étage Nord",
                    id = '3N',
                    Pos = vector3(-1065.95,-833.64,27.04),
                    Heading = 40.77,
                    Description = "Vestiaire, salle de gym, Briefing"
                },
                {
                    Label = "1er étage Nord",
                    id = '1N',
                    Pos = vector3(-1065.95,-833.64,19.04),
                    Heading = 40.77,
                    Description = "Acceuil"
                },
                {
                    Label = "3ème sous-sol Nord",
                    id = '-3N',
                    Pos = vector3(-1065.95,-833.64,14.88),
                    Heading = 40.77,
                    Description = "vestiaire, armurie, SWAT"
                },
                {
                    Label = "2ème sous-sol Nord",
                    id = '-2N',
                    Pos = vector3(-1065.95,-833.64,11.04),
                    Heading = 40.77,
                    Description = "Salle des saisies"
                },
                {
                    Label = "1er sous-sol Nord",
                    id = '-1N',
                    Pos = vector3(-1065.95,-833.64,5.48),
                    Heading = 40.77,
                    Description = "Cellules, salles d'intérogatoire"
                },
            }
        },
        sud = {
           label = "Ascenseur sud",
           floor = {
               {
                   Label = "Toit",
                   id = 'TS',
                   Pos = vector3(-1096.38,-850.27,38.24),
                   Heading = 36.27,
                   Description = "Hélipad"
               },
               {
                   Label = "5ème étage Sud",
                   id = '5S',
                   Pos = vector3(-1096.38,-850.27,34.36),
                   Heading = 36.27,
                   Description = "Bureau du commandant"
               },
               {
                   Label = "4ème étage Sud",
                   id = '4S',
                   Pos = vector3(-1096.38,-850.27,30.75),
                   Heading = 36.27,
                   Description = "Bureau du lieutnant"
               },
               {
                   Label = "3ème étage Sud",
                   id = '3S',
                   Pos = vector3(-1096.38,-850.27,26.82),
                   Heading = 36.27,
                   Description = "Vestiaire, salle de gym, Briefing"
               },
               {
                   Label = "2ème étage Sud",
                   id = '2S',
                   Pos = vector3(-1096.38,-850.27,23.04),
                   Heading = 36.27
               },
               {
                   Label = "1er étage Sud",
                   id = '1S',
                   Pos = vector3(-1096.38,-850.27,19.0),
                   Heading = 36.27,
                   Description = "Acceuil"
               },
               {
                   Label = "3ème sous-sol Sud",
                   id = '-3S',
                   Pos = vector3(-1096.38,-850.27,13.68),
                   Heading = 36.27,
                   Description = "vestiaire, armurie, SWAT"
               },
               {
                   Label = "2ème sous-sol Sud",
                   id = '-2S',
                   Pos = vector3(-1096.38,-850.27,10.27),
                   Heading = 36.27,
                   Description = "Salle des saisies"
               },
               {
                   Label = "1er sous-sol Sud",
                   id = '-1S',
                   Pos = vector3(-1096.38,-850.27,4.88),
                   Heading = 36.27,
                   Description = "Cellules, salles d'intérogatoire"
               },
           }
        }
    }
}