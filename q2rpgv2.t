View.Set ("title:Quake Cards v2.0,graphics:500;220")
%VARIABLES BELOW
%TEMP VARIABLES
%NORMAL VARIABLES
var weaponget : int := 0
var playerget : int := 0
var choice : string
var times : int := 1000
var weaponchoice : string
var playerchoice : string
var wpnlvl : array 1 .. 11 of int
var plalvl : array 1 .. 10 of int
var pwrlvl : array 1 .. 5 of int
var powercheck : int := 3
var yourhp : int
var yourarmor : int := 0
var enemyhp : int
var enemyarmor : int := 0
var hand : array 1 .. 27 of string
var ehand : array 1 .. 27 of string
var rando : int
var typeofcard : string
var pick : int
var death : int := 0
var frag : int := 0
var maxhp : int := 100
var yourmaxhp : int := 100
var experience : int := 0
var level : int := 0
var lvlxp : int := 100
var weaponpoint : int := 0
var playerpoint : int := 0
var powerpoint : int := 0
var expamnt : int := 0
%PROQUAKE VARIABLES
var getg : int := 0
var egetg : int := 0
var proquake : int := 0 %Proquake Activated(1)/Deactivated(0)
var quaddamage : int := 0 %Quad Damage Turns
var equaddamage : int := 0 %Enemy Quad Damage Turns
var invulnerability : int := 0 %Invulnerability Turns
var einvulnerability : int := 0 %Enemy Invulnerability Turns
var shells : int := 0
var eshells : int := 0
var bullets : int := 0
var ebullets : int := 0
var grenades : int := 0
var egrenades : int := 0
var rockets : int := 0
var erockets : int := 0
var slugs : int := 0
var eslugs : int := 0
var cells : int := 0
var ecells : int := 0
%VARIABLES ABOVE
%RANDOMIZER BELOW
randomize
%RANDOMIZER ABOVE
%RANDOMIZER CARDCHECKER BELOW
procedure cardcheck
    if rando = 1 then
        typeofcard := "Blaster"
    elsif rando = 2 then
        typeofcard := "Shotgun"
    elsif rando = 3 then
        typeofcard := "Super Shotgun"
    elsif rando = 4 then
        typeofcard := "Machinegun"
    elsif rando = 5 then
        typeofcard := "Chaingun"
    elsif rando = 6 then
        typeofcard := "Grenade Launcher"
    elsif rando = 7 then
        typeofcard := "Rocket Launcher"
    elsif rando = 8 then
        typeofcard := "Railgun"
    elsif rando = 9 then
        typeofcard := "Hyperblaster"
    elsif rando = 10 then
        typeofcard := "BFG10K"
    elsif rando = 11 then
        typeofcard := "Stimpack"
    elsif rando = 12 then
        typeofcard := "Health"
    elsif rando = 13 then
        typeofcard := "Medikit"
    elsif rando = 14 then
        typeofcard := "Megahealth"
    elsif rando = 15 then
        typeofcard := "Adrenaline"
    elsif rando = 16 then
        typeofcard := "Jacket Armor"
    elsif rando = 17 then
        typeofcard := "Combat Armor"
    elsif rando = 18 then
        typeofcard := "Body Armor"
    elsif rando = 19 then
        typeofcard := "Armor Shard"
        %PROQUAKE CARDS
    elsif rando = 20 then
        typeofcard := "Shells"
    elsif rando = 21 then
        typeofcard := "Bullets"
    elsif rando = 22 then
        typeofcard := "Grenades"
    elsif rando = 23 then
        typeofcard := "Rockets"
    elsif rando = 24 then
        typeofcard := "Slugs"
    elsif rando = 25 then
        typeofcard := "Cells"
    elsif rando = 26 then
        typeofcard := "Quad Damage"
    elsif rando = 27 then
        typeofcard := "Invulnerability"
    end if
end cardcheck
%RANDOMIZER CARDCHECKER ABOVE



%RANDOMIZER HAND PICKER
procedure checkpick
    if pick = 1 then
        if hand (pick) = "Armor Shard" then
            cls
            put "You Play The Armor Shard"
            put "     Gain 5 Armor"
            yourarmor := yourarmor + 5
        elsif hand (pick) = "Jacket Armor" then
            cls
            put "You Play The Jacket Armor"
            put "     Gain 25 Armor"
            yourarmor := yourarmor + 25
        elsif hand (pick) = "Combat Armor" then
            cls
            put "You Play The Combat Armor"
            put "     Gain 50 Armor"
            yourarmor := yourarmor + 50
        elsif hand (pick) = "Body Armor" then
            cls
            put "You Play The Body Armor"
            put "     Gain 100 Armor"
            yourarmor := yourarmor + 100
        elsif hand (pick) = "Stimpack" then
            cls
            put "You Play The Stimpack"
            put "     Gain 5 Health"
            yourhp := yourhp + 5
        elsif hand (pick) = "Health" then
            cls
            put "You Play The Health"
            put "     Gain 10 Health"
            yourhp := yourhp + 10
        elsif hand (pick) = "Medikit" then
            cls
            put "You Play The Medikit"
            put "     Gain 25 Health"
            yourhp := yourhp + 25
        elsif hand (pick) = "Megahealth" then
            cls
            put "You Play The Megahealth"
            put "     Gain 100 Health"
            yourhp := yourhp + 100
        elsif hand (pick) = "Adrenaline" then
            cls
            put "You Play The Adrenaline"
            put "     Gain Full Health"
            if yourhp <= maxhp then
                yourhp := maxhp
            end if
        elsif hand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "You Play The Blaster"
                put "     Deal 10 Damage"
                enemyarmor := enemyarmor - 10
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", (10 + (10 * wpnlvl (1))) * 4, " Damage"
                    enemyarmor := enemyarmor - ( (10 + (10 * wpnlvl (1))) *
                        4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", 10 + (10 * wpnlvl (1)), " Damage"
                    enemyarmor := enemyarmor - (10 + (10 * wpnlvl (1)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                else
                    put "You Play The Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif hand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Shotgun"
                put "     Deal 20 Damage"
                enemyarmor := enemyarmor - 20
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 0 then
                    shells := shells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", (20 + (20 * wpnlvl (2))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (20 + (20 *
                            wpnlvl (2))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", 20 + (20 * wpnlvl (2)), " Damage"
                        enemyarmor := enemyarmor - (20 + (20 * wpnlvl (1)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Super Shotgun"
                put "     Deal 40 Damage"
                enemyarmor := enemyarmor - 40
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 1 then
                    shells := shells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", (40 + (40 * wpnlvl (3))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (40 + (40 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", 40 + (40 * wpnlvl (3)), " Damage"
                        enemyarmor := enemyarmor - (40 + (40 * wpnlvl (3)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "You Play The Machinegun"
                put "     Deal 30 Damage"
                enemyarmor := enemyarmor - 30
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 0 then
                    bullets := bullets - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", (30 + (30 * wpnlvl (4))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (30 + (30 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", 30 + (30 * wpnlvl (4)), " Damage"
                        enemyarmor := enemyarmor - (30 + (30 * wpnlvl (4)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "You Play The Chaingun"
                put "     Deal 50 Damage"
                enemyarmor := enemyarmor - 50
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 1 then
                    bullets := bullets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (50 + (50 *
                            wpnlvl (5))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))), " Damage"
                        enemyarmor := enemyarmor - (50 + (50 * wpnlvl (5)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Grenade Launcher"
                put "     Deal 60 Damage"
                enemyarmor := enemyarmor - 60
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if grenades > 0 then
                    grenades := grenades - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (60 + (60 *
                            wpnlvl (6))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))), " Damage"
                        enemyarmor := enemyarmor - (60 + (60 * wpnlvl (6)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Rocket Launcher"
                put "     Deal 80 Damage"
                enemyarmor := enemyarmor - 80
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if rockets > 1 then
                    rockets := rockets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", (80 + (80 * wpnlvl (7))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (80 + (80 *
                            wpnlvl (7))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", 80 + (80 * wpnlvl (7)), " Damage"
                        enemyarmor := enemyarmor - (80 + (80 * wpnlvl (7)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Rocket Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "You Play The Hyperblaster"
                put "     Deal 70 Damage"
                enemyarmor := enemyarmor - 70
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 0 then
                    cells := cells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", (70 + (70 * wpnlvl (8))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (70 + (70 *
                            wpnlvl (8))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", 70 + (70 * wpnlvl (8)), " Damage"
                        enemyarmor := enemyarmor - (70 + (70 * wpnlvl (8)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "You Play The Railgun"
                put "     Deal 90 Damage"
                enemyarmor := enemyarmor - 90
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if slugs > 0 then
                    slugs := slugs - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (90 + (90 *
                            wpnlvl (9))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))), " Damage"
                        enemyarmor := enemyarmor - (90 + (90 * wpnlvl (9)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "You Play The BFG10K"
                put "     Deal 100 Damage"
                enemyarmor := enemyarmor - 100
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 1 then
                    cells := cells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (100 + (100 *
                            wpnlvl (10))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))),
                            " Damage"
                        enemyarmor := enemyarmor - (100 + (100 *
                            wpnlvl (10)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The BFG10K"
                        put "     Deal 0 Damage"
                        getg := 0
                    end if
                else
                    put "You Play The BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake hand
        elsif hand (pick) = "Shells" then
            cls
            put "You Play The Shells"
            put "     Gain 1 Shell"
            shells := shells + 1
        elsif hand (pick) = "Bullets" then
            cls
            put "You Play The Bullets"
            put "     Gain 1 Bullet"
            bullets := bullets + 1
        elsif hand (pick) = "Grenades" then
            cls
            loop
                put "Do You Want Ammo Or Use Grenade?"
                put "1: Get Ammo     2: Use Grenade"
                get getg
                exit when getg = 1 or getg = 2
                cls
                put "Invalid Pick"
            end loop
            cls
            if getg = 1 then
                put "You Play The Grenades"
                put "     Gain 1 Grenade"
                grenades := grenades + 1
            elsif getg = 2 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)) * 4, " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)) * 4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)), " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                else
                    put "You Use The Grenades"
                    put "     Deal 0 Damage"
                    getg := 0
                end if
            end if
        elsif hand (pick) = "Rockets" then
            cls
            put "You Play The Rockets"
            put "     Gain 1 Rocket"
            rockets := rockets + 1
        elsif hand (pick) = "Slugs" then
            cls
            put "You Play The Slugs"
            put "     Gain 1 Slug"
            slugs := slugs + 1
        elsif hand (pick) = "Cells" then
            cls
            put "You Play The Cells"
            put "     Gain 1 Cell"
            cells := cells + 1
        elsif hand (pick) = "Quad Damage" then
            cls
            put "You Play The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            quaddamage := 4
        elsif hand (pick) = "Invulnerability" then
            cls
            put "You Play The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            invulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 2 then
        if hand (pick) = "Armor Shard" then
            cls
            put "You Play The Armor Shard"
            put "     Gain 5 Armor"
            yourarmor := yourarmor + 5
        elsif hand (pick) = "Jacket Armor" then
            cls
            put "You Play The Jacket Armor"
            put "     Gain 25 Armor"
            yourarmor := yourarmor + 25
        elsif hand (pick) = "Combat Armor" then
            cls
            put "You Play The Combat Armor"
            put "     Gain 50 Armor"
            yourarmor := yourarmor + 50
        elsif hand (pick) = "Body Armor" then
            cls
            put "You Play The Body Armor"
            put "     Gain 100 Armor"
            yourarmor := yourarmor + 100
        elsif hand (pick) = "Stimpack" then
            cls
            put "You Play The Stimpack"
            put "     Gain 5 Health"
            yourhp := yourhp + 5
        elsif hand (pick) = "Health" then
            cls
            put "You Play The Health"
            put "     Gain 10 Health"
            yourhp := yourhp + 10
        elsif hand (pick) = "Medikit" then
            cls
            put "You Play The Medikit"
            put "     Gain 25 Health"
            yourhp := yourhp + 25
        elsif hand (pick) = "Megahealth" then
            cls
            put "You Play The Megahealth"
            put "     Gain 100 Health"
            yourhp := yourhp + 100
        elsif hand (pick) = "Adrenaline" then
            cls
            put "You Play The Adrenaline"
            put "     Gain Full Health"
            if yourhp <= maxhp then
                yourhp := maxhp
            end if
        elsif hand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "You Play The Blaster"
                put "     Deal 10 Damage"
                enemyarmor := enemyarmor - 10
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", (10 + (10 * wpnlvl (1))) * 4, " Damage"
                    enemyarmor := enemyarmor - ( (10 + (10 * wpnlvl (1))) *
                        4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", 10 + (10 * wpnlvl (1)), " Damage"
                    enemyarmor := enemyarmor - (10 + (10 * wpnlvl (1)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                else
                    put "You Play The Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif hand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Shotgun"
                put "     Deal 20 Damage"
                enemyarmor := enemyarmor - 20
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 0 then
                    shells := shells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", (20 + (20 * wpnlvl (2))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (20 + (20 *
                            wpnlvl (2))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", 20 + (20 * wpnlvl (2)), " Damage"
                        enemyarmor := enemyarmor - (20 + (20 * wpnlvl (1)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Super Shotgun"
                put "     Deal 40 Damage"
                enemyarmor := enemyarmor - 40
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 1 then
                    shells := shells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", (40 + (40 * wpnlvl (3))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (40 + (40 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", 40 + (40 * wpnlvl (3)), " Damage"
                        enemyarmor := enemyarmor - (40 + (40 * wpnlvl (3)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "You Play The Machinegun"
                put "     Deal 30 Damage"
                enemyarmor := enemyarmor - 30
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 0 then
                    bullets := bullets - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", (30 + (30 * wpnlvl (4))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (30 + (30 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", 30 + (30 * wpnlvl (4)), " Damage"
                        enemyarmor := enemyarmor - (30 + (30 * wpnlvl (4)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "You Play The Chaingun"
                put "     Deal 50 Damage"
                enemyarmor := enemyarmor - 50
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 1 then
                    bullets := bullets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (50 + (50 *
                            wpnlvl (5))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))), " Damage"
                        enemyarmor := enemyarmor - (50 + (50 * wpnlvl (5)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Grenade Launcher"
                put "     Deal 60 Damage"
                enemyarmor := enemyarmor - 60
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if grenades > 0 then
                    grenades := grenades - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (60 + (60 *
                            wpnlvl (6))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))), " Damage"
                        enemyarmor := enemyarmor - (60 + (60 * wpnlvl (6)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Rocket Launcher"
                put "     Deal 80 Damage"
                enemyarmor := enemyarmor - 80
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if rockets > 1 then
                    rockets := rockets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", (80 + (80 * wpnlvl (7))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (80 + (80 *
                            wpnlvl (7))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", 80 + (80 * wpnlvl (7)), " Damage"
                        enemyarmor := enemyarmor - (80 + (80 * wpnlvl (7)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Rocket Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "You Play The Hyperblaster"
                put "     Deal 70 Damage"
                enemyarmor := enemyarmor - 70
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 0 then
                    cells := cells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", (70 + (70 * wpnlvl (8))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (70 + (70 *
                            wpnlvl (8))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", 70 + (70 * wpnlvl (8)), " Damage"
                        enemyarmor := enemyarmor - (70 + (70 * wpnlvl (8)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "You Play The Railgun"
                put "     Deal 90 Damage"
                enemyarmor := enemyarmor - 90
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if slugs > 0 then
                    slugs := slugs - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (90 + (90 *
                            wpnlvl (9))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))), " Damage"
                        enemyarmor := enemyarmor - (90 + (90 * wpnlvl (9)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "You Play The BFG10K"
                put "     Deal 100 Damage"
                enemyarmor := enemyarmor - 100
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 1 then
                    cells := cells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (100 + (100 *
                            wpnlvl (10))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))),
                            " Damage"
                        enemyarmor := enemyarmor - (100 + (100 *
                            wpnlvl (10)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The BFG10K"
                        put "     Deal 0 Damage"
                        getg := 0
                    end if
                else
                    put "You Play The BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake hand
        elsif hand (pick) = "Shells" then
            cls
            put "You Play The Shells"
            put "     Gain 1 Shell"
            shells := shells + 1
        elsif hand (pick) = "Bullets" then
            cls
            put "You Play The Bullets"
            put "     Gain 1 Bullet"
            bullets := bullets + 1
        elsif hand (pick) = "Grenades" then
            cls
            loop
                put "Do You Want Ammo Or Use Grenade?"
                put "1: Get Ammo     2: Use Grenade"
                get getg
                exit when getg = 1 or getg = 2
                cls
                put "Invalid Pick"
            end loop
            cls
            if getg = 1 then
                put "You Play The Grenades"
                put "     Gain 1 Grenade"
                grenades := grenades + 1
            elsif getg = 2 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)) * 4, " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)) * 4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)), " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                else
                    put "You Use The Grenades"
                    put "     Deal 0 Damage"
                    getg := 0
                end if
            end if
        elsif hand (pick) = "Rockets" then
            cls
            put "You Play The Rockets"
            put "     Gain 1 Rocket"
            rockets := rockets + 1
        elsif hand (pick) = "Slugs" then
            cls
            put "You Play The Slugs"
            put "     Gain 1 Slug"
            slugs := slugs + 1
        elsif hand (pick) = "Cells" then
            cls
            put "You Play The Cells"
            put "     Gain 1 Cell"
            cells := cells + 1
        elsif hand (pick) = "Quad Damage" then
            cls
            put "You Play The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            quaddamage := 4
        elsif hand (pick) = "Invulnerability" then
            cls
            put "You Play The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            invulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 3 then
        if hand (pick) = "Armor Shard" then
            cls
            put "You Play The Armor Shard"
            put "     Gain 5 Armor"
            yourarmor := yourarmor + 5
        elsif hand (pick) = "Jacket Armor" then
            cls
            put "You Play The Jacket Armor"
            put "     Gain 25 Armor"
            yourarmor := yourarmor + 25
        elsif hand (pick) = "Combat Armor" then
            cls
            put "You Play The Combat Armor"
            put "     Gain 50 Armor"
            yourarmor := yourarmor + 50
        elsif hand (pick) = "Body Armor" then
            cls
            put "You Play The Body Armor"
            put "     Gain 100 Armor"
            yourarmor := yourarmor + 100
        elsif hand (pick) = "Stimpack" then
            cls
            put "You Play The Stimpack"
            put "     Gain 5 Health"
            yourhp := yourhp + 5
        elsif hand (pick) = "Health" then
            cls
            put "You Play The Health"
            put "     Gain 10 Health"
            yourhp := yourhp + 10
        elsif hand (pick) = "Medikit" then
            cls
            put "You Play The Medikit"
            put "     Gain 25 Health"
            yourhp := yourhp + 25
        elsif hand (pick) = "Megahealth" then
            cls
            put "You Play The Megahealth"
            put "     Gain 100 Health"
            yourhp := yourhp + 100
        elsif hand (pick) = "Adrenaline" then
            cls
            put "You Play The Adrenaline"
            put "     Gain Full Health"
            if yourhp <= maxhp then
                yourhp := maxhp
            end if
        elsif hand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "You Play The Blaster"
                put "     Deal 10 Damage"
                enemyarmor := enemyarmor - 10
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", (10 + (10 * wpnlvl (1))) * 4, " Damage"
                    enemyarmor := enemyarmor - ( (10 + (10 * wpnlvl (1))) *
                        4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", 10 + (10 * wpnlvl (1)), " Damage"
                    enemyarmor := enemyarmor - (10 + (10 * wpnlvl (1)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                else
                    put "You Play The Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif hand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Shotgun"
                put "     Deal 20 Damage"
                enemyarmor := enemyarmor - 20
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 0 then
                    shells := shells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", (20 + (20 * wpnlvl (2))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (20 + (20 *
                            wpnlvl (2))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", 20 + (20 * wpnlvl (2)), " Damage"
                        enemyarmor := enemyarmor - (20 + (20 * wpnlvl (1)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Super Shotgun"
                put "     Deal 40 Damage"
                enemyarmor := enemyarmor - 40
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 1 then
                    shells := shells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", (40 + (40 * wpnlvl (3))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (40 + (40 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", 40 + (40 * wpnlvl (3)), " Damage"
                        enemyarmor := enemyarmor - (40 + (40 * wpnlvl (3)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "You Play The Machinegun"
                put "     Deal 30 Damage"
                enemyarmor := enemyarmor - 30
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 0 then
                    bullets := bullets - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", (30 + (30 * wpnlvl (4))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (30 + (30 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", 30 + (30 * wpnlvl (4)), " Damage"
                        enemyarmor := enemyarmor - (30 + (30 * wpnlvl (4)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "You Play The Chaingun"
                put "     Deal 50 Damage"
                enemyarmor := enemyarmor - 50
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 1 then
                    bullets := bullets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (50 + (50 *
                            wpnlvl (5))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))), " Damage"
                        enemyarmor := enemyarmor - (50 + (50 * wpnlvl (5)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Grenade Launcher"
                put "     Deal 60 Damage"
                enemyarmor := enemyarmor - 60
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if grenades > 0 then
                    grenades := grenades - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (60 + (60 *
                            wpnlvl (6))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))), " Damage"
                        enemyarmor := enemyarmor - (60 + (60 * wpnlvl (6)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Rocket Launcher"
                put "     Deal 80 Damage"
                enemyarmor := enemyarmor - 80
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if rockets > 1 then
                    rockets := rockets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", (80 + (80 * wpnlvl (7))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (80 + (80 *
                            wpnlvl (7))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", 80 + (80 * wpnlvl (7)), " Damage"
                        enemyarmor := enemyarmor - (80 + (80 * wpnlvl (7)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Rocket Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "You Play The Hyperblaster"
                put "     Deal 70 Damage"
                enemyarmor := enemyarmor - 70
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 0 then
                    cells := cells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", (70 + (70 * wpnlvl (8))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (70 + (70 *
                            wpnlvl (8))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", 70 + (70 * wpnlvl (8)), " Damage"
                        enemyarmor := enemyarmor - (70 + (70 * wpnlvl (8)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "You Play The Railgun"
                put "     Deal 90 Damage"
                enemyarmor := enemyarmor - 90
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if slugs > 0 then
                    slugs := slugs - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (90 + (90 *
                            wpnlvl (9))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))), " Damage"
                        enemyarmor := enemyarmor - (90 + (90 * wpnlvl (9)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "You Play The BFG10K"
                put "     Deal 100 Damage"
                enemyarmor := enemyarmor - 100
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 1 then
                    cells := cells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (100 + (100 *
                            wpnlvl (10))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))),
                            " Damage"
                        enemyarmor := enemyarmor - (100 + (100 *
                            wpnlvl (10)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The BFG10K"
                        put "     Deal 0 Damage"
                        getg := 0
                    end if
                else
                    put "You Play The BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake hand
        elsif hand (pick) = "Shells" then
            cls
            put "You Play The Shells"
            put "     Gain 1 Shell"
            shells := shells + 1
        elsif hand (pick) = "Bullets" then
            cls
            put "You Play The Bullets"
            put "     Gain 1 Bullet"
            bullets := bullets + 1
        elsif hand (pick) = "Grenades" then
            cls
            loop
                put "Do You Want Ammo Or Use Grenade?"
                put "1: Get Ammo     2: Use Grenade"
                get getg
                exit when getg = 1 or getg = 2
                cls
                put "Invalid Pick"
            end loop
            cls
            if getg = 1 then
                put "You Play The Grenades"
                put "     Gain 1 Grenade"
                grenades := grenades + 1
            elsif getg = 2 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)) * 4, " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)) * 4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)), " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                else
                    put "You Use The Grenades"
                    put "     Deal 0 Damage"
                    getg := 0
                end if
            end if
        elsif hand (pick) = "Rockets" then
            cls
            put "You Play The Rockets"
            put "     Gain 1 Rocket"
            rockets := rockets + 1
        elsif hand (pick) = "Slugs" then
            cls
            put "You Play The Slugs"
            put "     Gain 1 Slug"
            slugs := slugs + 1
        elsif hand (pick) = "Cells" then
            cls
            put "You Play The Cells"
            put "     Gain 1 Cell"
            cells := cells + 1
        elsif hand (pick) = "Quad Damage" then
            cls
            put "You Play The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            quaddamage := 4
        elsif hand (pick) = "Invulnerability" then
            cls
            put "You Play The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            invulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 4 then
        if hand (pick) = "Armor Shard" then
            cls
            put "You Play The Armor Shard"
            put "     Gain 5 Armor"
            yourarmor := yourarmor + 5
        elsif hand (pick) = "Jacket Armor" then
            cls
            put "You Play The Jacket Armor"
            put "     Gain 25 Armor"
            yourarmor := yourarmor + 25
        elsif hand (pick) = "Combat Armor" then
            cls
            put "You Play The Combat Armor"
            put "     Gain 50 Armor"
            yourarmor := yourarmor + 50
        elsif hand (pick) = "Body Armor" then
            cls
            put "You Play The Body Armor"
            put "     Gain 100 Armor"
            yourarmor := yourarmor + 100
        elsif hand (pick) = "Stimpack" then
            cls
            put "You Play The Stimpack"
            put "     Gain 5 Health"
            yourhp := yourhp + 5
        elsif hand (pick) = "Health" then
            cls
            put "You Play The Health"
            put "     Gain 10 Health"
            yourhp := yourhp + 10
        elsif hand (pick) = "Medikit" then
            cls
            put "You Play The Medikit"
            put "     Gain 25 Health"
            yourhp := yourhp + 25
        elsif hand (pick) = "Megahealth" then
            cls
            put "You Play The Megahealth"
            put "     Gain 100 Health"
            yourhp := yourhp + 100
        elsif hand (pick) = "Adrenaline" then
            cls
            put "You Play The Adrenaline"
            put "     Gain Full Health"
            if yourhp <= maxhp then
                yourhp := maxhp
            end if
        elsif hand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "You Play The Blaster"
                put "     Deal 10 Damage"
                enemyarmor := enemyarmor - 10
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", (10 + (10 * wpnlvl (1))) * 4, " Damage"
                    enemyarmor := enemyarmor - ( (10 + (10 * wpnlvl (1))) *
                        4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", 10 + (10 * wpnlvl (1)), " Damage"
                    enemyarmor := enemyarmor - (10 + (10 * wpnlvl (1)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                else
                    put "You Play The Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif hand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Shotgun"
                put "     Deal 20 Damage"
                enemyarmor := enemyarmor - 20
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 0 then
                    shells := shells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", (20 + (20 * wpnlvl (2))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (20 + (20 *
                            wpnlvl (2))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", 20 + (20 * wpnlvl (2)), " Damage"
                        enemyarmor := enemyarmor - (20 + (20 * wpnlvl (1)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Super Shotgun"
                put "     Deal 40 Damage"
                enemyarmor := enemyarmor - 40
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 1 then
                    shells := shells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", (40 + (40 * wpnlvl (3))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (40 + (40 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", 40 + (40 * wpnlvl (3)), " Damage"
                        enemyarmor := enemyarmor - (40 + (40 * wpnlvl (3)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "You Play The Machinegun"
                put "     Deal 30 Damage"
                enemyarmor := enemyarmor - 30
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 0 then
                    bullets := bullets - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", (30 + (30 * wpnlvl (4))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (30 + (30 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", 30 + (30 * wpnlvl (4)), " Damage"
                        enemyarmor := enemyarmor - (30 + (30 * wpnlvl (4)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "You Play The Chaingun"
                put "     Deal 50 Damage"
                enemyarmor := enemyarmor - 50
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 1 then
                    bullets := bullets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (50 + (50 *
                            wpnlvl (5))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))), " Damage"
                        enemyarmor := enemyarmor - (50 + (50 * wpnlvl (5)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Grenade Launcher"
                put "     Deal 60 Damage"
                enemyarmor := enemyarmor - 60
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if grenades > 0 then
                    grenades := grenades - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (60 + (60 *
                            wpnlvl (6))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))), " Damage"
                        enemyarmor := enemyarmor - (60 + (60 * wpnlvl (6)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Rocket Launcher"
                put "     Deal 80 Damage"
                enemyarmor := enemyarmor - 80
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if rockets > 1 then
                    rockets := rockets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", (80 + (80 * wpnlvl (7))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (80 + (80 *
                            wpnlvl (7))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", 80 + (80 * wpnlvl (7)), " Damage"
                        enemyarmor := enemyarmor - (80 + (80 * wpnlvl (7)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Rocket Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "You Play The Hyperblaster"
                put "     Deal 70 Damage"
                enemyarmor := enemyarmor - 70
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 0 then
                    cells := cells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", (70 + (70 * wpnlvl (8))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (70 + (70 *
                            wpnlvl (8))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", 70 + (70 * wpnlvl (8)), " Damage"
                        enemyarmor := enemyarmor - (70 + (70 * wpnlvl (8)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "You Play The Railgun"
                put "     Deal 90 Damage"
                enemyarmor := enemyarmor - 90
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if slugs > 0 then
                    slugs := slugs - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (90 + (90 *
                            wpnlvl (9))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))), " Damage"
                        enemyarmor := enemyarmor - (90 + (90 * wpnlvl (9)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "You Play The BFG10K"
                put "     Deal 100 Damage"
                enemyarmor := enemyarmor - 100
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 1 then
                    cells := cells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (100 + (100 *
                            wpnlvl (10))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))),
                            " Damage"
                        enemyarmor := enemyarmor - (100 + (100 *
                            wpnlvl (10)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The BFG10K"
                        put "     Deal 0 Damage"
                        getg := 0
                    end if
                else
                    put "You Play The BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake hand
        elsif hand (pick) = "Shells" then
            cls
            put "You Play The Shells"
            put "     Gain 1 Shell"
            shells := shells + 1
        elsif hand (pick) = "Bullets" then
            cls
            put "You Play The Bullets"
            put "     Gain 1 Bullet"
            bullets := bullets + 1
        elsif hand (pick) = "Grenades" then
            cls
            loop
                put "Do You Want Ammo Or Use Grenade?"
                put "1: Get Ammo     2: Use Grenade"
                get getg
                exit when getg = 1 or getg = 2
                cls
                put "Invalid Pick"
            end loop
            cls
            if getg = 1 then
                put "You Play The Grenades"
                put "     Gain 1 Grenade"
                grenades := grenades + 1
            elsif getg = 2 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)) * 4, " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)) * 4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)), " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                else
                    put "You Use The Grenades"
                    put "     Deal 0 Damage"
                    getg := 0
                end if
            end if
        elsif hand (pick) = "Rockets" then
            cls
            put "You Play The Rockets"
            put "     Gain 1 Rocket"
            rockets := rockets + 1
        elsif hand (pick) = "Slugs" then
            cls
            put "You Play The Slugs"
            put "     Gain 1 Slug"
            slugs := slugs + 1
        elsif hand (pick) = "Cells" then
            cls
            put "You Play The Cells"
            put "     Gain 1 Cell"
            cells := cells + 1
        elsif hand (pick) = "Quad Damage" then
            cls
            put "You Play The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            quaddamage := 4
        elsif hand (pick) = "Invulnerability" then
            cls
            put "You Play The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            invulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 5 then
        if hand (pick) = "Armor Shard" then
            cls
            put "You Play The Armor Shard"
            put "     Gain 5 Armor"
            yourarmor := yourarmor + 5
        elsif hand (pick) = "Jacket Armor" then
            cls
            put "You Play The Jacket Armor"
            put "     Gain 25 Armor"
            yourarmor := yourarmor + 25
        elsif hand (pick) = "Combat Armor" then
            cls
            put "You Play The Combat Armor"
            put "     Gain 50 Armor"
            yourarmor := yourarmor + 50
        elsif hand (pick) = "Body Armor" then
            cls
            put "You Play The Body Armor"
            put "     Gain 100 Armor"
            yourarmor := yourarmor + 100
        elsif hand (pick) = "Stimpack" then
            cls
            put "You Play The Stimpack"
            put "     Gain 5 Health"
            yourhp := yourhp + 5
        elsif hand (pick) = "Health" then
            cls
            put "You Play The Health"
            put "     Gain 10 Health"
            yourhp := yourhp + 10
        elsif hand (pick) = "Medikit" then
            cls
            put "You Play The Medikit"
            put "     Gain 25 Health"
            yourhp := yourhp + 25
        elsif hand (pick) = "Megahealth" then
            cls
            put "You Play The Megahealth"
            put "     Gain 100 Health"
            yourhp := yourhp + 100
        elsif hand (pick) = "Adrenaline" then
            cls
            put "You Play The Adrenaline"
            put "     Gain Full Health"
            if yourhp <= maxhp then
                yourhp := maxhp
            end if
        elsif hand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "You Play The Blaster"
                put "     Deal 10 Damage"
                enemyarmor := enemyarmor - 10
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", (10 + (10 * wpnlvl (1))) * 4, " Damage"
                    enemyarmor := enemyarmor - ( (10 + (10 * wpnlvl (1))) *
                        4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Play The Blaster"
                    put "     Deal ", 10 + (10 * wpnlvl (1)), " Damage"
                    enemyarmor := enemyarmor - (10 + (10 * wpnlvl (1)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                else
                    put "You Play The Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif hand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Shotgun"
                put "     Deal 20 Damage"
                enemyarmor := enemyarmor - 20
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 0 then
                    shells := shells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", (20 + (20 * wpnlvl (2))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (20 + (20 *
                            wpnlvl (2))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Shotgun"
                        put "     Deal ", 20 + (20 * wpnlvl (2)), " Damage"
                        enemyarmor := enemyarmor - (20 + (20 * wpnlvl (1)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "You Play The Super Shotgun"
                put "     Deal 40 Damage"
                enemyarmor := enemyarmor - 40
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if shells > 1 then
                    shells := shells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", (40 + (40 * wpnlvl (3))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (40 + (40 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Super Shotgun"
                        put "     Deal ", 40 + (40 * wpnlvl (3)), " Damage"
                        enemyarmor := enemyarmor - (40 + (40 * wpnlvl (3)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "You Play The Machinegun"
                put "     Deal 30 Damage"
                enemyarmor := enemyarmor - 30
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 0 then
                    bullets := bullets - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", (30 + (30 * wpnlvl (4))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (30 + (30 *
                            wpnlvl (4))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Machinegun"
                        put "     Deal ", 30 + (30 * wpnlvl (4)), " Damage"
                        enemyarmor := enemyarmor - (30 + (30 * wpnlvl (4)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "You Play The Chaingun"
                put "     Deal 50 Damage"
                enemyarmor := enemyarmor - 50
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if bullets > 1 then
                    bullets := bullets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (50 + (50 *
                            wpnlvl (5))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Chaingun"
                        put "     Deal ", (50 + (50 * wpnlvl (5))), " Damage"
                        enemyarmor := enemyarmor - (50 + (50 * wpnlvl (5)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Grenade Launcher"
                put "     Deal 60 Damage"
                enemyarmor := enemyarmor - 60
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if grenades > 0 then
                    grenades := grenades - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (60 + (60 *
                            wpnlvl (6))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Grenade Launcher"
                        put "     Deal ", (60 + (60 * wpnlvl (6))), " Damage"
                        enemyarmor := enemyarmor - (60 + (60 * wpnlvl (6)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "You Play The Rocket Launcher"
                put "     Deal 80 Damage"
                enemyarmor := enemyarmor - 80
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if rockets > 1 then
                    rockets := rockets - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", (80 + (80 * wpnlvl (7))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (80 + (80 *
                            wpnlvl (7))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Rocket Launcher"
                        put "     Deal ", 80 + (80 * wpnlvl (7)), " Damage"
                        enemyarmor := enemyarmor - (80 + (80 * wpnlvl (7)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Rocket Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "You Play The Hyperblaster"
                put "     Deal 70 Damage"
                enemyarmor := enemyarmor - 70
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 0 then
                    cells := cells - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", (70 + (70 * wpnlvl (8))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (70 + (70 *
                            wpnlvl (8))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Hyperblaster"
                        put "     Deal ", 70 + (70 * wpnlvl (8)), " Damage"
                        enemyarmor := enemyarmor - (70 + (70 * wpnlvl (8)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "You Play The Railgun"
                put "     Deal 90 Damage"
                enemyarmor := enemyarmor - 90
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if slugs > 0 then
                    slugs := slugs - 1
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (90 + (90 *
                            wpnlvl (9))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The Railgun"
                        put "     Deal ", (90 + (90 * wpnlvl (9))), " Damage"
                        enemyarmor := enemyarmor - (90 + (90 * wpnlvl (9)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "You Play The Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif hand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "You Play The BFG10K"
                put "     Deal 100 Damage"
                enemyarmor := enemyarmor - 100
                if enemyarmor < 0 then
                    loop
                        enemyarmor := enemyarmor + 1
                        enemyhp := enemyhp - 1
                        exit when enemyarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if cells > 1 then
                    cells := cells - 2
                    if quaddamage > 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))) * 4,
                            " Damage"
                        enemyarmor := enemyarmor - ( (100 + (100 *
                            wpnlvl (10))) * 4)
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    elsif quaddamage = 0 and einvulnerability = 0 then
                        put "You Play The BFG10K"
                        put "     Deal ", (100 + (100 * wpnlvl (10))),
                            " Damage"
                        enemyarmor := enemyarmor - (100 + (100 *
                            wpnlvl (10)))
                        if enemyarmor < 0 then
                            loop
                                enemyarmor := enemyarmor + 1
                                enemyhp := enemyhp - 1
                                exit when enemyarmor = 0
                            end loop
                        end if
                    else
                        put "You Play The BFG10K"
                        put "     Deal 0 Damage"
                        getg := 0
                    end if
                else
                    put "You Play The BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake hand
        elsif hand (pick) = "Shells" then
            cls
            put "You Play The Shells"
            put "     Gain 1 Shell"
            shells := shells + 1
        elsif hand (pick) = "Bullets" then
            cls
            put "You Play The Bullets"
            put "     Gain 1 Bullet"
            bullets := bullets + 1
        elsif hand (pick) = "Grenades" then
            cls
            loop
                put "Do You Want Ammo Or Use Grenade?"
                put "1: Get Ammo     2: Use Grenade"
                get getg
                exit when getg = 1 or getg = 2
                cls
                put "Invalid Pick"
            end loop
            cls
            if getg = 1 then
                put "You Play The Grenades"
                put "     Gain 1 Grenade"
                grenades := grenades + 1
            elsif getg = 2 then
                if quaddamage > 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)) * 4, " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)) * 4)
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                elsif quaddamage = 0 and einvulnerability = 0 then
                    put "You Use The Grenades"
                    put "     Deal ", 55 + (55 * wpnlvl (11)), " Damage"
                    enemyarmor := enemyarmor - (55 + (55 * wpnlvl (11)))
                    if enemyarmor < 0 then
                        loop
                            enemyarmor := enemyarmor + 1
                            enemyhp := enemyhp - 1
                            exit when enemyarmor = 0
                        end loop
                    end if
                    getg := 0
                else
                    put "You Use The Grenades"
                    put "     Deal 0 Damage"
                    getg := 0
                end if
            end if
        elsif hand (pick) = "Rockets" then
            cls
            put "You Play The Rockets"
            put "     Gain 1 Rocket"
            rockets := rockets + 1
        elsif hand (pick) = "Slugs" then
            cls
            put "You Play The Slugs"
            put "     Gain 1 Slug"
            slugs := slugs + 1
        elsif hand (pick) = "Cells" then
            cls
            put "You Play The Cells"
            put "     Gain 1 Cell"
            cells := cells + 1
        elsif hand (pick) = "Quad Damage" then
            cls
            put "You Play The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            quaddamage := 4
        elsif hand (pick) = "Invulnerability" then
            cls
            put "You Play The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            invulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    else
        cls
        put "Invalid Pick"
    end if
end checkpick
%USER HAND PICKER ABOVE
%ENEMY HAND PICKER BELOW
procedure echeckpick
    if pick = 1 then
        if ehand (pick) = "Armor Shard" then
            cls
            put "The Enemy Plays Armor Shard"
            put "       Gain 5 Armor"
            enemyarmor := enemyarmor + 5
        elsif ehand (pick) = "Jacket Armor" then
            cls
            put "The Enemy Plays Jacket Armor"
            put "       Gain 25 Armor"
            enemyarmor := enemyarmor + 25
        elsif ehand (pick) = "Combat Armor" then
            cls
            put "The Enemy Plays Combat Armor"
            put "       Gain 50 Armor"
            enemyarmor := enemyarmor + 50
        elsif ehand (pick) = "Body Armor" then
            cls
            put "The Enemy Plays Body Armor"
            put "       Gain 100 Armor"
            enemyarmor := enemyarmor + 100
        elsif ehand (pick) = "Stimpack" then
            cls
            put "The Enemy Plays Stimpack"
            put "       Gain 5 Health"
            enemyhp := enemyhp + 5
        elsif ehand (pick) = "Health" then
            cls
            put "The Enemy Plays Health"
            put "       Gain 10 Health"
            enemyhp := enemyhp + 10
        elsif ehand (pick) = "Medikit" then
            cls
            put "The Enemy Plays Medikit"
            put "       Gain 25 Health"
            enemyhp := enemyhp + 25
        elsif ehand (pick) = "Megahealth" then
            cls
            put "The Enemy Plays Megahealth"
            put "       Gain 100 Health"
            enemyhp := enemyhp + 100
        elsif ehand (pick) = "Adrenaline" then
            cls
            put "The Enemy Plays Adrenaline"
            put "       Gain Full Health"
            if enemyhp <= maxhp then
                enemyhp := maxhp
            end if
        elsif ehand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Blaster"
                put "     Deal 10 Damage"
                yourarmor := yourarmor - 10
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if equaddamage > 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 40 Damage"
                    yourarmor := yourarmor - 40
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                elsif equaddamage = 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 10 Damage"
                    yourarmor := yourarmor - 10
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                else
                    put "The Enemy Plays Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif ehand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Shotgun"
                put "     Deal 20 Damage"
                yourarmor := yourarmor - 20
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 0 then
                    eshells := eshells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 20 Damage"
                        yourarmor := yourarmor - 20
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Super Shotgun"
                put "     Deal 40 Damage"
                yourarmor := yourarmor - 40
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 1 then
                    eshells := eshells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 160 Damage"
                        yourarmor := yourarmor - 160
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 40 Damage"
                        yourarmor := yourarmor - 40
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Machinegun"
                put "     Deal 30 Damage"
                yourarmor := yourarmor - 30
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 0 then
                    ebullets := ebullets - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 120 Damage"
                        yourarmor := yourarmor - 120
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 30 Damage"
                        yourarmor := yourarmor - 30
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Chaingun"
                put "     Deal 50 Damage"
                yourarmor := yourarmor - 50
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 1 then
                    ebullets := ebullets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 200 Damage"
                        yourarmor := yourarmor - 200
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 50 Damage"
                        yourarmor := yourarmor - 50
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Grenade Launcher"
                put "     Deal 60 Damage"
                yourarmor := yourarmor - 60
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if egrenades > 0 then
                    egrenades := egrenades - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 240 Damage"
                        yourarmor := yourarmor - 240
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 60 Damage"
                        yourarmor := yourarmor - 60
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Rocket Launcher"
                put "     Deal 80 Damage"
                yourarmor := yourarmor - 80
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if erockets > 1 then
                    erockets := erockets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 320 Damage"
                        yourarmor := yourarmor - 320
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Rocket Launcher"
                    put "No Rockets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Hyperblaster"
                put "     Deal 70 Damage"
                yourarmor := yourarmor - 70
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 0 then
                    ecells := ecells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 280 Damage"
                        yourarmor := yourarmor - 280
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 70 Damage"
                        yourarmor := yourarmor - 70
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Railgun"
                put "     Deal 90 Damage"
                yourarmor := yourarmor - 90
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eslugs > 0 then
                    eslugs := eslugs - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 360 Damage"
                        yourarmor := yourarmor - 360
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 90 Damage"
                        yourarmor := yourarmor - 90
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "The Enemy Plays BFG10K"
                put "     Deal 100 Damage"
                yourarmor := yourarmor - 100
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 1 then
                    ecells := ecells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 400 Damage"
                        yourarmor := yourarmor - 400
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 100 Damage"
                        yourarmor := yourarmor - 100
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays BFG10K"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake card hand 1
        elsif ehand (pick) = "Shells" then
            cls
            put "The Enemy Plays Shells"
            put "     Gain 1 Shell"
            eshells := eshells + 1
        elsif ehand (pick) = "Bullets" then
            cls
            put "The Enemy Plays Bullets"
            put "     Gain 1 Bullet"
            ebullets := ebullets + 1
        elsif ehand (pick) = "Grenades" then
            cls
            put "The Enemy Plays Grenades"
            put "     Gain 1 Grenade"
            egrenades := egrenades + 1
        elsif ehand (pick) = "Rockets" then
            cls
            put "The Enemy Plays Rockets"
            put "     Gain 1 Rocket"
            erockets := erockets + 1
        elsif ehand (pick) = "Slugs" then
            cls
            put "The Enemy Plays Slugs"
            put "     Gain 1 Slug"
            eslugs := eslugs + 1
        elsif ehand (pick) = "Cells" then
            cls
            put "The Enemy Plays Cells"
            put "     Gain 1 Cell"
            ecells := ecells + 1
        elsif ehand (pick) = "Quad Damage" then
            cls
            put "The Enemy Plays The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            equaddamage := 4
        elsif ehand (pick) = "Invulnerability" then
            cls
            put "The Enemy Plays The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            einvulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 2 then
        if ehand (pick) = "Armor Shard" then
            cls
            put "The Enemy Plays Armor Shard"
            put "       Gain 5 Armor"
            enemyarmor := enemyarmor + 5
        elsif ehand (pick) = "Jacket Armor" then
            cls
            put "The Enemy Plays Jacket Armor"
            put "       Gain 25 Armor"
            enemyarmor := enemyarmor + 25
        elsif ehand (pick) = "Combat Armor" then
            cls
            put "The Enemy Plays Combat Armor"
            put "       Gain 50 Armor"
            enemyarmor := enemyarmor + 50
        elsif ehand (pick) = "Body Armor" then
            cls
            put "The Enemy Plays Body Armor"
            put "       Gain 100 Armor"
            enemyarmor := enemyarmor + 100
        elsif ehand (pick) = "Stimpack" then
            cls
            put "The Enemy Plays Stimpack"
            put "       Gain 5 Health"
            enemyhp := enemyhp + 5
        elsif ehand (pick) = "Health" then
            cls
            put "The Enemy Plays Health"
            put "       Gain 10 Health"
            enemyhp := enemyhp + 10
        elsif ehand (pick) = "Medikit" then
            cls
            put "The Enemy Plays Medikit"
            put "       Gain 25 Health"
            enemyhp := enemyhp + 25
        elsif ehand (pick) = "Megahealth" then
            cls
            put "The Enemy Plays Megahealth"
            put "       Gain 100 Health"
            enemyhp := enemyhp + 100
        elsif ehand (pick) = "Adrenaline" then
            cls
            put "The Enemy Plays Adrenaline"
            put "       Gain Full Health"
            if enemyhp <= maxhp then
                enemyhp := maxhp
            end if
        elsif ehand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Blaster"
                put "     Deal 10 Damage"
                yourarmor := yourarmor - 10
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if equaddamage > 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 40 Damage"
                    yourarmor := yourarmor - 40
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                elsif equaddamage = 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 10 Damage"
                    yourarmor := yourarmor - 10
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                else
                    put "The Enemy Plays Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif ehand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Shotgun"
                put "     Deal 20 Damage"
                yourarmor := yourarmor - 20
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 0 then
                    eshells := eshells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 20 Damage"
                        yourarmor := yourarmor - 20
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Super Shotgun"
                put "     Deal 40 Damage"
                yourarmor := yourarmor - 40
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 1 then
                    eshells := eshells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 160 Damage"
                        yourarmor := yourarmor - 160
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 40 Damage"
                        yourarmor := yourarmor - 40
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Machinegun"
                put "     Deal 30 Damage"
                yourarmor := yourarmor - 30
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 0 then
                    ebullets := ebullets - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 120 Damage"
                        yourarmor := yourarmor - 120
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 30 Damage"
                        yourarmor := yourarmor - 30
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Chaingun"
                put "     Deal 50 Damage"
                yourarmor := yourarmor - 50
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 1 then
                    ebullets := ebullets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 200 Damage"
                        yourarmor := yourarmor - 200
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 50 Damage"
                        yourarmor := yourarmor - 50
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Grenade Launcher"
                put "     Deal 60 Damage"
                yourarmor := yourarmor - 60
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if egrenades > 0 then
                    egrenades := egrenades - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 240 Damage"
                        yourarmor := yourarmor - 240
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 60 Damage"
                        yourarmor := yourarmor - 60
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Rocket Launcher"
                put "     Deal 80 Damage"
                yourarmor := yourarmor - 80
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if erockets > 1 then
                    erockets := erockets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 320 Damage"
                        yourarmor := yourarmor - 320
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Rocket Launcher"
                    put "No Rockets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Hyperblaster"
                put "     Deal 70 Damage"
                yourarmor := yourarmor - 70
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 0 then
                    ecells := ecells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 280 Damage"
                        yourarmor := yourarmor - 280
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 70 Damage"
                        yourarmor := yourarmor - 70
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Railgun"
                put "     Deal 90 Damage"
                yourarmor := yourarmor - 90
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eslugs > 0 then
                    eslugs := eslugs - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 360 Damage"
                        yourarmor := yourarmor - 360
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 90 Damage"
                        yourarmor := yourarmor - 90
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "The Enemy Plays BFG10K"
                put "     Deal 100 Damage"
                yourarmor := yourarmor - 100
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 1 then
                    ecells := ecells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 400 Damage"
                        yourarmor := yourarmor - 400
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 100 Damage"
                        yourarmor := yourarmor - 100
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays BFG10K"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake card hand 1
        elsif ehand (pick) = "Shells" then
            cls
            put "The Enemy Plays Shells"
            put "     Gain 1 Shell"
            eshells := eshells + 1
        elsif ehand (pick) = "Bullets" then
            cls
            put "The Enemy Plays Bullets"
            put "     Gain 1 Bullet"
            ebullets := ebullets + 1
        elsif ehand (pick) = "Grenades" then
            cls
            put "The Enemy Plays Grenades"
            put "     Gain 1 Grenade"
            egrenades := egrenades + 1
        elsif ehand (pick) = "Rockets" then
            cls
            put "The Enemy Plays Rockets"
            put "     Gain 1 Rocket"
            erockets := erockets + 1
        elsif ehand (pick) = "Slugs" then
            cls
            put "The Enemy Plays Slugs"
            put "     Gain 1 Slug"
            eslugs := eslugs + 1
        elsif ehand (pick) = "Cells" then
            cls
            put "The Enemy Plays Cells"
            put "     Gain 1 Cell"
            ecells := ecells + 1
        elsif ehand (pick) = "Quad Damage" then
            cls
            put "The Enemy Plays The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            equaddamage := 4
        elsif ehand (pick) = "Invulnerability" then
            cls
            put "The Enemy Plays The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            einvulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 3 then
        if ehand (pick) = "Armor Shard" then
            cls
            put "The Enemy Plays Armor Shard"
            put "       Gain 5 Armor"
            enemyarmor := enemyarmor + 5
        elsif ehand (pick) = "Jacket Armor" then
            cls
            put "The Enemy Plays Jacket Armor"
            put "       Gain 25 Armor"
            enemyarmor := enemyarmor + 25
        elsif ehand (pick) = "Combat Armor" then
            cls
            put "The Enemy Plays Combat Armor"
            put "       Gain 50 Armor"
            enemyarmor := enemyarmor + 50
        elsif ehand (pick) = "Body Armor" then
            cls
            put "The Enemy Plays Body Armor"
            put "       Gain 100 Armor"
            enemyarmor := enemyarmor + 100
        elsif ehand (pick) = "Stimpack" then
            cls
            put "The Enemy Plays Stimpack"
            put "       Gain 5 Health"
            enemyhp := enemyhp + 5
        elsif ehand (pick) = "Health" then
            cls
            put "The Enemy Plays Health"
            put "       Gain 10 Health"
            enemyhp := enemyhp + 10
        elsif ehand (pick) = "Medikit" then
            cls
            put "The Enemy Plays Medikit"
            put "       Gain 25 Health"
            enemyhp := enemyhp + 25
        elsif ehand (pick) = "Megahealth" then
            cls
            put "The Enemy Plays Megahealth"
            put "       Gain 100 Health"
            enemyhp := enemyhp + 100
        elsif ehand (pick) = "Adrenaline" then
            cls
            put "The Enemy Plays Adrenaline"
            put "       Gain Full Health"
            if enemyhp <= maxhp then
                enemyhp := maxhp
            end if
        elsif ehand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Blaster"
                put "     Deal 10 Damage"
                yourarmor := yourarmor - 10
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if equaddamage > 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 40 Damage"
                    yourarmor := yourarmor - 40
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                elsif equaddamage = 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 10 Damage"
                    yourarmor := yourarmor - 10
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                else
                    put "The Enemy Plays Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif ehand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Shotgun"
                put "     Deal 20 Damage"
                yourarmor := yourarmor - 20
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 0 then
                    eshells := eshells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 20 Damage"
                        yourarmor := yourarmor - 20
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Super Shotgun"
                put "     Deal 40 Damage"
                yourarmor := yourarmor - 40
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 1 then
                    eshells := eshells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 160 Damage"
                        yourarmor := yourarmor - 160
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 40 Damage"
                        yourarmor := yourarmor - 40
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Machinegun"
                put "     Deal 30 Damage"
                yourarmor := yourarmor - 30
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 0 then
                    ebullets := ebullets - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 120 Damage"
                        yourarmor := yourarmor - 120
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 30 Damage"
                        yourarmor := yourarmor - 30
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Chaingun"
                put "     Deal 50 Damage"
                yourarmor := yourarmor - 50
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 1 then
                    ebullets := ebullets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 200 Damage"
                        yourarmor := yourarmor - 200
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 50 Damage"
                        yourarmor := yourarmor - 50
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Grenade Launcher"
                put "     Deal 60 Damage"
                yourarmor := yourarmor - 60
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if egrenades > 0 then
                    egrenades := egrenades - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 240 Damage"
                        yourarmor := yourarmor - 240
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 60 Damage"
                        yourarmor := yourarmor - 60
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Rocket Launcher"
                put "     Deal 80 Damage"
                yourarmor := yourarmor - 80
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if erockets > 1 then
                    erockets := erockets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 320 Damage"
                        yourarmor := yourarmor - 320
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Rocket Launcher"
                    put "No Rockets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Hyperblaster"
                put "     Deal 70 Damage"
                yourarmor := yourarmor - 70
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 0 then
                    ecells := ecells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 280 Damage"
                        yourarmor := yourarmor - 280
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 70 Damage"
                        yourarmor := yourarmor - 70
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Railgun"
                put "     Deal 90 Damage"
                yourarmor := yourarmor - 90
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eslugs > 0 then
                    eslugs := eslugs - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 360 Damage"
                        yourarmor := yourarmor - 360
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 90 Damage"
                        yourarmor := yourarmor - 90
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "The Enemy Plays BFG10K"
                put "     Deal 100 Damage"
                yourarmor := yourarmor - 100
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 1 then
                    ecells := ecells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 400 Damage"
                        yourarmor := yourarmor - 400
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 100 Damage"
                        yourarmor := yourarmor - 100
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays BFG10K"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake card hand 1
        elsif ehand (pick) = "Shells" then
            cls
            put "The Enemy Plays Shells"
            put "     Gain 1 Shell"
            eshells := eshells + 1
        elsif ehand (pick) = "Bullets" then
            cls
            put "The Enemy Plays Bullets"
            put "     Gain 1 Bullet"
            ebullets := ebullets + 1
        elsif ehand (pick) = "Grenades" then
            cls
            put "The Enemy Plays Grenades"
            put "     Gain 1 Grenade"
            egrenades := egrenades + 1
        elsif ehand (pick) = "Rockets" then
            cls
            put "The Enemy Plays Rockets"
            put "     Gain 1 Rocket"
            erockets := erockets + 1
        elsif ehand (pick) = "Slugs" then
            cls
            put "The Enemy Plays Slugs"
            put "     Gain 1 Slug"
            eslugs := eslugs + 1
        elsif ehand (pick) = "Cells" then
            cls
            put "The Enemy Plays Cells"
            put "     Gain 1 Cell"
            ecells := ecells + 1
        elsif ehand (pick) = "Quad Damage" then
            cls
            put "The Enemy Plays The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            equaddamage := 4
        elsif ehand (pick) = "Invulnerability" then
            cls
            put "The Enemy Plays The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            einvulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 4 then
        if ehand (pick) = "Armor Shard" then
            cls
            put "The Enemy Plays Armor Shard"
            put "       Gain 5 Armor"
            enemyarmor := enemyarmor + 5
        elsif ehand (pick) = "Jacket Armor" then
            cls
            put "The Enemy Plays Jacket Armor"
            put "       Gain 25 Armor"
            enemyarmor := enemyarmor + 25
        elsif ehand (pick) = "Combat Armor" then
            cls
            put "The Enemy Plays Combat Armor"
            put "       Gain 50 Armor"
            enemyarmor := enemyarmor + 50
        elsif ehand (pick) = "Body Armor" then
            cls
            put "The Enemy Plays Body Armor"
            put "       Gain 100 Armor"
            enemyarmor := enemyarmor + 100
        elsif ehand (pick) = "Stimpack" then
            cls
            put "The Enemy Plays Stimpack"
            put "       Gain 5 Health"
            enemyhp := enemyhp + 5
        elsif ehand (pick) = "Health" then
            cls
            put "The Enemy Plays Health"
            put "       Gain 10 Health"
            enemyhp := enemyhp + 10
        elsif ehand (pick) = "Medikit" then
            cls
            put "The Enemy Plays Medikit"
            put "       Gain 25 Health"
            enemyhp := enemyhp + 25
        elsif ehand (pick) = "Megahealth" then
            cls
            put "The Enemy Plays Megahealth"
            put "       Gain 100 Health"
            enemyhp := enemyhp + 100
        elsif ehand (pick) = "Adrenaline" then
            cls
            put "The Enemy Plays Adrenaline"
            put "       Gain Full Health"
            if enemyhp <= maxhp then
                enemyhp := maxhp
            end if
        elsif ehand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Blaster"
                put "     Deal 10 Damage"
                yourarmor := yourarmor - 10
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if equaddamage > 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 40 Damage"
                    yourarmor := yourarmor - 40
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                elsif equaddamage = 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 10 Damage"
                    yourarmor := yourarmor - 10
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                else
                    put "The Enemy Plays Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif ehand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Shotgun"
                put "     Deal 20 Damage"
                yourarmor := yourarmor - 20
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 0 then
                    eshells := eshells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 20 Damage"
                        yourarmor := yourarmor - 20
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Super Shotgun"
                put "     Deal 40 Damage"
                yourarmor := yourarmor - 40
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 1 then
                    eshells := eshells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 160 Damage"
                        yourarmor := yourarmor - 160
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 40 Damage"
                        yourarmor := yourarmor - 40
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Machinegun"
                put "     Deal 30 Damage"
                yourarmor := yourarmor - 30
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 0 then
                    ebullets := ebullets - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 120 Damage"
                        yourarmor := yourarmor - 120
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 30 Damage"
                        yourarmor := yourarmor - 30
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Chaingun"
                put "     Deal 50 Damage"
                yourarmor := yourarmor - 50
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 1 then
                    ebullets := ebullets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 200 Damage"
                        yourarmor := yourarmor - 200
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 50 Damage"
                        yourarmor := yourarmor - 50
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Grenade Launcher"
                put "     Deal 60 Damage"
                yourarmor := yourarmor - 60
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if egrenades > 0 then
                    egrenades := egrenades - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 240 Damage"
                        yourarmor := yourarmor - 240
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 60 Damage"
                        yourarmor := yourarmor - 60
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Rocket Launcher"
                put "     Deal 80 Damage"
                yourarmor := yourarmor - 80
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if erockets > 1 then
                    erockets := erockets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 320 Damage"
                        yourarmor := yourarmor - 320
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Rocket Launcher"
                    put "No Rockets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Hyperblaster"
                put "     Deal 70 Damage"
                yourarmor := yourarmor - 70
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 0 then
                    ecells := ecells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 280 Damage"
                        yourarmor := yourarmor - 280
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 70 Damage"
                        yourarmor := yourarmor - 70
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Railgun"
                put "     Deal 90 Damage"
                yourarmor := yourarmor - 90
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eslugs > 0 then
                    eslugs := eslugs - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 360 Damage"
                        yourarmor := yourarmor - 360
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 90 Damage"
                        yourarmor := yourarmor - 90
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "The Enemy Plays BFG10K"
                put "     Deal 100 Damage"
                yourarmor := yourarmor - 100
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 1 then
                    ecells := ecells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 400 Damage"
                        yourarmor := yourarmor - 400
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 100 Damage"
                        yourarmor := yourarmor - 100
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays BFG10K"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake card hand 1
        elsif ehand (pick) = "Shells" then
            cls
            put "The Enemy Plays Shells"
            put "     Gain 1 Shell"
            eshells := eshells + 1
        elsif ehand (pick) = "Bullets" then
            cls
            put "The Enemy Plays Bullets"
            put "     Gain 1 Bullet"
            ebullets := ebullets + 1
        elsif ehand (pick) = "Grenades" then
            cls
            put "The Enemy Plays Grenades"
            put "     Gain 1 Grenade"
            egrenades := egrenades + 1
        elsif ehand (pick) = "Rockets" then
            cls
            put "The Enemy Plays Rockets"
            put "     Gain 1 Rocket"
            erockets := erockets + 1
        elsif ehand (pick) = "Slugs" then
            cls
            put "The Enemy Plays Slugs"
            put "     Gain 1 Slug"
            eslugs := eslugs + 1
        elsif ehand (pick) = "Cells" then
            cls
            put "The Enemy Plays Cells"
            put "     Gain 1 Cell"
            ecells := ecells + 1
        elsif ehand (pick) = "Quad Damage" then
            cls
            put "The Enemy Plays The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            equaddamage := 4
        elsif ehand (pick) = "Invulnerability" then
            cls
            put "The Enemy Plays The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            einvulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    elsif pick = 5 then
        if ehand (pick) = "Armor Shard" then
            cls
            put "The Enemy Plays Armor Shard"
            put "       Gain 5 Armor"
            enemyarmor := enemyarmor + 5
        elsif ehand (pick) = "Jacket Armor" then
            cls
            put "The Enemy Plays Jacket Armor"
            put "       Gain 25 Armor"
            enemyarmor := enemyarmor + 25
        elsif ehand (pick) = "Combat Armor" then
            cls
            put "The Enemy Plays Combat Armor"
            put "       Gain 50 Armor"
            enemyarmor := enemyarmor + 50
        elsif ehand (pick) = "Body Armor" then
            cls
            put "The Enemy Plays Body Armor"
            put "       Gain 100 Armor"
            enemyarmor := enemyarmor + 100
        elsif ehand (pick) = "Stimpack" then
            cls
            put "The Enemy Plays Stimpack"
            put "       Gain 5 Health"
            enemyhp := enemyhp + 5
        elsif ehand (pick) = "Health" then
            cls
            put "The Enemy Plays Health"
            put "       Gain 10 Health"
            enemyhp := enemyhp + 10
        elsif ehand (pick) = "Medikit" then
            cls
            put "The Enemy Plays Medikit"
            put "       Gain 25 Health"
            enemyhp := enemyhp + 25
        elsif ehand (pick) = "Megahealth" then
            cls
            put "The Enemy Plays Megahealth"
            put "       Gain 100 Health"
            enemyhp := enemyhp + 100
        elsif ehand (pick) = "Adrenaline" then
            cls
            put "The Enemy Plays Adrenaline"
            put "       Gain Full Health"
            if enemyhp <= maxhp then
                enemyhp := maxhp
            end if
        elsif ehand (pick) = "Blaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Blaster"
                put "     Deal 10 Damage"
                yourarmor := yourarmor - 10
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if equaddamage > 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 40 Damage"
                    yourarmor := yourarmor - 40
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                elsif equaddamage = 0 and invulnerability = 0 then
                    put "The Enemy Plays Blaster"
                    put "     Deal 10 Damage"
                    yourarmor := yourarmor - 10
                    if yourarmor < 0 then
                        loop
                            yourarmor := yourarmor + 1
                            yourhp := yourhp - 1
                            exit when yourarmor = 0
                        end loop
                    end if
                else
                    put "The Enemy Plays Blaster"
                    put "     Deal 0 Damage"
                end if
            end if
        elsif ehand (pick) = "Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Shotgun"
                put "     Deal 20 Damage"
                yourarmor := yourarmor - 20
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 0 then
                    eshells := eshells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Shotgun"
                        put "     Deal 20 Damage"
                        yourarmor := yourarmor - 20
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Super Shotgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Super Shotgun"
                put "     Deal 40 Damage"
                yourarmor := yourarmor - 40
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eshells > 1 then
                    eshells := eshells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 160 Damage"
                        yourarmor := yourarmor - 160
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 40 Damage"
                        yourarmor := yourarmor - 40
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Super Shotgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Super Shotgun"
                    put "No Shells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Machinegun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Machinegun"
                put "     Deal 30 Damage"
                yourarmor := yourarmor - 30
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 0 then
                    ebullets := ebullets - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 120 Damage"
                        yourarmor := yourarmor - 120
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Machinegun"
                        put "     Deal 30 Damage"
                        yourarmor := yourarmor - 30
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Machinegun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Machinegun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Chaingun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Chaingun"
                put "     Deal 50 Damage"
                yourarmor := yourarmor - 50
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ebullets > 1 then
                    ebullets := ebullets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 200 Damage"
                        yourarmor := yourarmor - 200
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Chaingun"
                        put "     Deal 50 Damage"
                        yourarmor := yourarmor - 50
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Chaingun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Chaingun"
                    put "No Bullets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Grenade Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Grenade Launcher"
                put "     Deal 60 Damage"
                yourarmor := yourarmor - 60
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if egrenades > 0 then
                    egrenades := egrenades - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 240 Damage"
                        yourarmor := yourarmor - 240
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 60 Damage"
                        yourarmor := yourarmor - 60
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Grenade Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Grenade Launcher"
                    put "No Grenades Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Rocket Launcher" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Rocket Launcher"
                put "     Deal 80 Damage"
                yourarmor := yourarmor - 80
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if erockets > 1 then
                    erockets := erockets - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 320 Damage"
                        yourarmor := yourarmor - 320
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 80 Damage"
                        yourarmor := yourarmor - 80
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Rocket Launcher"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Rocket Launcher"
                    put "No Rockets Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Hyperblaster" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Hyperblaster"
                put "     Deal 70 Damage"
                yourarmor := yourarmor - 70
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 0 then
                    ecells := ecells - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 280 Damage"
                        yourarmor := yourarmor - 280
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 70 Damage"
                        yourarmor := yourarmor - 70
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Hyperblaster"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Hyperblaster"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "Railgun" then
            cls
            if proquake = 0 then
                put "The Enemy Plays Railgun"
                put "     Deal 90 Damage"
                yourarmor := yourarmor - 90
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if eslugs > 0 then
                    eslugs := eslugs - 1
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 360 Damage"
                        yourarmor := yourarmor - 360
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays Railgun"
                        put "     Deal 90 Damage"
                        yourarmor := yourarmor - 90
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays Railgun"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays Railgun"
                    put "No Slugs Available"
                    put "Card Has Been Discarded"
                end if
            end if
        elsif ehand (pick) = "BFG10K" then
            cls
            if proquake = 0 then
                put "The Enemy Plays BFG10K"
                put "     Deal 100 Damage"
                yourarmor := yourarmor - 100
                if yourarmor < 0 then
                    loop
                        yourarmor := yourarmor + 1
                        yourhp := yourhp - 1
                        exit when yourarmor = 0
                    end loop
                end if
            elsif proquake = 1 then
                if ecells > 1 then
                    ecells := ecells - 2
                    if equaddamage > 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 400 Damage"
                        yourarmor := yourarmor - 400
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    elsif equaddamage = 0 and invulnerability = 0 then
                        put "The Enemy Plays BFG10K"
                        put "     Deal 100 Damage"
                        yourarmor := yourarmor - 100
                        if yourarmor < 0 then
                            loop
                                yourarmor := yourarmor + 1
                                yourhp := yourhp - 1
                                exit when yourarmor = 0
                            end loop
                        end if
                    else
                        put "The Enemy Plays BFG10K"
                        put "     Deal 0 Damage"
                    end if
                else
                    put "The Enemy Plays BFG10K"
                    put "No Cells Available"
                    put "Card Has Been Discarded"
                end if
            end if
            %proquake card hand 1
        elsif ehand (pick) = "Shells" then
            cls
            put "The Enemy Plays Shells"
            put "     Gain 1 Shell"
            eshells := eshells + 1
        elsif ehand (pick) = "Bullets" then
            cls
            put "The Enemy Plays Bullets"
            put "     Gain 1 Bullet"
            ebullets := ebullets + 1
        elsif ehand (pick) = "Grenades" then
            cls
            put "The Enemy Plays Grenades"
            put "     Gain 1 Grenade"
            egrenades := egrenades + 1
        elsif ehand (pick) = "Rockets" then
            cls
            put "The Enemy Plays Rockets"
            put "     Gain 1 Rocket"
            erockets := erockets + 1
        elsif ehand (pick) = "Slugs" then
            cls
            put "The Enemy Plays Slugs"
            put "     Gain 1 Slug"
            eslugs := eslugs + 1
        elsif ehand (pick) = "Cells" then
            cls
            put "The Enemy Plays Cells"
            put "     Gain 1 Cell"
            ecells := ecells + 1
        elsif ehand (pick) = "Quad Damage" then
            cls
            put "The Enemy Plays The Quad Damage"
            put "Active For 3 Turns(4x dmg)"
            equaddamage := 4
        elsif ehand (pick) = "Invulnerability" then
            cls
            put "The Enemy Plays The Invulnerability"
            put "Active For 1 Turn(100% Protect)"
            einvulnerability := 1
            %proquake cards end
        else
            cls
            put "Card Cannot Be Used"
        end if
    end if
end echeckpick
%ENEMY HAND PICKER ABOVE

const MAX := 11
for i : 1 .. MAX
    wpnlvl (i) := 0
end for
const MAX2 := 10
for p : 1 .. MAX2
    plalvl (p) := 0
end for
const MAX3 := 5
for a : 1 .. MAX3
    pwrlvl (a) := 0
end for

loop
    quaddamage := 0
    invulnerability := 0
    equaddamage := 0
    einvulnerability := 0
    proquake := 0
    put "                 Quake Cards v2.00"
    put "              ----------------------"
    put " "
    put "                 /---------------", chr (92)
    put "                 |   MAIN MENU   |"
    put "                 ", chr (92), "---------------/"
    put " "
    put "       1: Weapon Experience And Levels"
    put "       2: Player Experience And Levels"
    put "       3: Power Experience And Levels"
    put "       4: Set Time Delay: Currently ", times
    put "       5: View Scoreboard"
    put "       6: Change Max Hp (100-1000): Currently ", maxhp
    put "       7: Play Game(normal)"
    put "       8: Play Game(PRO QUAKE)"
    put " "
    put "Enter A Number: " ..
    get choice
    if choice = "1" then
        loop
            cls
            put "                 Experience Chart"
            put "              ----------------------"
            put "              Blaster         : LV ", wpnlvl (1)
            put "              Shotgun         : LV ", wpnlvl (2)
            put "              Super Shotgun   : LV ", wpnlvl (3)
            put "              Machinegun      : LV ", wpnlvl (4)
            put "              Chaingun        : LV ", wpnlvl (5)
            put "              Grenade Launcher: LV ", wpnlvl (6)
            put "              Rocket Launcher : LV ", wpnlvl (7)
            put "              Hyperblaster    : LV ", wpnlvl (8)
            put "              Railgun         : LV ", wpnlvl (9)
            put "              BFG10K          : LV ", wpnlvl (10)
            put "              Hand Grenade    : LV ", wpnlvl (11)
            put "              Unused Weapon   : ", weaponpoint
            put "Choose an Option:"
            put "1: Use Unused Weapon Points"
            put "2: Main Menu"
            weaponget := 0
            get weaponget
            if weaponget = 1 then
                loop
                    cls
                    put "Choose Your Weapon"
                    put "You Have ", weaponpoint, " Points To Use"
                    put "1. Blaster"
                    put "2. Shotgun"
                    put "3. Super Shotgun"
                    put "4. Machinegun"
                    put "5. Chaingun"
                    put "6. Grenade Launcher"
                    put "7. Rocket Launcher"
                    put "8. Hyperblaster"
                    put "9. Railgun"
                    put "0. BFG10K"
                    put "g. Hand Grenade"
                    put "q. Main Menu"
                    get weaponchoice
                    exit when weaponchoice = "q"
                    if weaponchoice = "1" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (1) := wpnlvl (1) + 1
                            put "Your Blaster Level Is Now ", wpnlvl (1)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "2" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (2) := wpnlvl (2) + 1
                            put "Your Shotgun Level Is Now ", wpnlvl (2)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "3" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (3) := wpnlvl (3) + 1
                            put "Your Super Shotgun Level Is Now ",
                                wpnlvl (3)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "4" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (4) := wpnlvl (4) + 1
                            put "Your Machinegun Level Is Now ", wpnlvl (4)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "5" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (5) := wpnlvl (5) + 1
                            put "Your Chaingun Level Is Now ", wpnlvl (5)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "6" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (6) := wpnlvl (6) + 1
                            put "Your Grenade Launcher Level Is Now ",
                                wpnlvl (6)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "7" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (7) := wpnlvl (7) + 1
                            put "Your Rocket Launcher Level Is Now ",
                                wpnlvl (7)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "8" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (8) := wpnlvl (8) + 1
                            put "Your Hyperblaster Level Is Now ", wpnlvl (8)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "9" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (9) := wpnlvl (9) + 1
                            put "Your Railgun Level Is Now ", wpnlvl (9)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "0" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (10) := wpnlvl (10) + 1
                            put "Your BFG10K Level Is Now ", wpnlvl (10)
                            Time.Delay (2000)
                        end if
                    elsif weaponchoice = "g" then
                        weaponpoint := weaponpoint - 1
                        if weaponpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            weaponpoint := weaponpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            wpnlvl (11) := wpnlvl (11) + 1
                            put "Your Hand Grenade Level Is Now ",
                                wpnlvl (11)
                            Time.Delay (2000)
                        end if
                    end if
                end loop
                weaponget := 2
            elsif weaponget = 2 then
                exit when weaponget = 2
            end if
        end loop
        cls
    elsif choice = "2" then
        loop
            cls
            put "                 Experience Chart"
            put "              ----------------------"
            put "              Dexterity       : LV N/A" %plalvl (1)
            put "              Strength        : LV N/A" %plalvl (2)
            put "              Karma           : LV N/A" %plalvl (3)
            put "              Spirit          : LV N/A" %plalvl (4)
            put "              Rage            : LV N/A" %plalvl (5)
            put "              Wisdom          : LV N/A" %plalvl (6)
            put "              Technical       : LV N/A" %plalvl (7)
            put "              Munition        : LV N/A" %plalvl (8)
            put "              Vitality Health : LV ",plalvl (9)
            put "              Vitality Armor  : LV N/A" %plalvl (10)
            put "              Unused Player   : ", playerpoint
            put "Choose an Option:"
            put "1: Use Unused Player Points"
            put "2: Main Menu"
            playerget := 0
            get playerget
            if playerget = 1 then
                loop
                    cls
                    put "Choose Your Player Skills"
                    put "You Have ", playerpoint, " Points To Use"
                    put "1. Dexterity"
                    put "2. Strength"
                    put "3. Karma"
                    put "4. Spirit"
                    put "5. Rage"
                    put "6. Wisdom"
                    put "7. Technical"
                    put "8. Munition"
                    put "9. Vitality Health"
                    put "0. Vitality Armor"
                    put "q. Main Menu"
                    get playerchoice
                    exit when playerchoice = "q"
                    if playerchoice = "9" then
                        playerpoint := playerpoint - 1
                        if playerpoint < 0 then
                            cls
                            put "You Do Not Have Enough Points To Do That"
                            playerpoint := playerpoint + 1
                            Time.Delay (2000)
                        else
                            cls
                            plalvl (9) := plalvl (9) + 1
                            put "Your Vitality Health Level Is Now ",
                                plalvl (9)
                            Time.Delay (2000)
                        end if
                    end if
                end loop
            elsif playerget = 2 then
                exit when playerget = 2
            end if
        end loop
        cls
    elsif choice = "3" then
        cls
        put "                 Experience Chart"
        put "              ----------------------"
        put "              Bide            : LV N/A"%, wpnlvl (1)
        put "              Spiral          : LV N/A"%, wpnlvl (2)
        put "              Expack          : LV N/A"%, wpnlvl (3)
        put "              Throw           : LV N/A"%, wpnlvl (4)
        put "              Power Anti      : LV N/A"%, wpnlvl (5)
        put "              Unused Power    : ", powerpoint
        Time.Delay (3000)
        cls
    elsif choice = "4" then
        cls
        put
            "Please Enter A Number (1000 = 1 second)"
        times := 0
        get times

        cls
    elsif choice = "5" then
        cls
        put "                Scoreboard"
        put "              --------------"
        put "              Frags     : ",
            frag
        put "              Deaths    : ",
            death
        put "              Level     : ", level
        put "              Experience: ",
            experience, " / ", lvlxp
        Time.Delay (3000)
        cls
    elsif choice = "6" then
        cls
        loop
            put
                "Please Enter A Number From 100 To 1000:"
            maxhp := 0
            get maxhp
            exit when maxhp >= 100 and maxhp
                <= 1000
            cls
            put
                "That Number Cannot Be Chosen"
        end loop
        cls
    elsif choice = "7" then
        proquake := 0
        yourhp := maxhp
        enemyhp := maxhp
        yourarmor := 0
        enemyarmor := 0
        expamnt := maxhp div 5
        cls
        put "Drawing Starting Hand..."
        put " "
        for i : 1 .. 5
            randint (rando, 1, 19)
            cardcheck
            hand (i) := typeofcard
        end for
        for i : 1 .. 5
            randint (rando, 1, 19)
            cardcheck
            ehand (i) := typeofcard
        end for

        Time.Delay (1000)
        cls
        %game area
        loop
            %your turn
            loop
                pick := 0
                put "Enemy Health: ",
                    enemyhp, " - Armor: ",
                    enemyarmor
                put "Your Health : ",
                    yourhp, " - Armor: ",
                    yourarmor
                put " "
                put "Current Hand:"
                put " "
                for i : 1 .. 5
                    put i, " : ", hand (i)
                end for
                put
                    "What card would you like to use?"
                get pick
                checkpick
                exit when pick >= 1 and pick
                    <= 5
                cls
                put "Invalid Pick"
            end loop
            Time.Delay (times)
            randint (rando, 1, 19)
            hand (pick) := typeofcard
            cardcheck
            exit when enemyhp <= 0

            %enemy turn
            randint (pick, 1, 5)
            echeckpick
            Time.Delay (times)
            randint (rando, 1, 19)
            ehand (pick) := typeofcard
            cardcheck
            cls
            exit when yourhp <= 0
        end loop
        if yourhp <= 0 then
            yourhp := 0
            cls
            death := death + 1
            put "You Lose!!"
            Time.Delay (2000)
            cls
        elsif enemyhp <= 0 then
            enemyhp := 0
            cls
            frag := frag + 1
            put "You Win!!"
            experience := experience +
                expamnt

            put "You Gain ", expamnt,
                " Experience!"
            put
                "Your Total Experience is now ",

                experience
            if experience >= lvlxp then
                put "You Leveled Up!!"
                level := level + 1
                put
                    "You Gained 1 Weapon Point!!"
                put "You Gained 1 Player Point!!"
                weaponpoint := weaponpoint +
                    1
                playerpoint := playerpoint + 1
                if level = powercheck then
                    put "You Gained 1 Power Point!!"
                    powerpoint := powerpoint + 1
                    powercheck := powercheck + 3
                end if
                if lvlxp >= 1600 and lvlxp <
                        2000 then
                    lvlxp := lvlxp + 400
                elsif lvlxp >= 2000 then
                    lvlxp := lvlxp + 1000
                elsif lvlxp < 1600 then
                    lvlxp := lvlxp * 2
                end if
            end if
            Time.Delay (2000)
            cls
        end if
    elsif choice = "8" then
        proquake := 1
        yourhp := yourmaxhp + (plalvl (9) * 25)
        enemyhp := yourmaxhp
        yourarmor := 0
        enemyarmor := 0
        expamnt := maxhp div 5
        cls
        put "Drawing Starting Hand..."
        put " "
        for i : 1 .. 5
            randint (rando, 1, 27)
            cardcheck
            hand (i) := typeofcard
        end for
        for i : 1 .. 5
            randint (rando, 1, 27)
            cardcheck
            ehand (i) := typeofcard
        end for
        Time.Delay (1000)
        cls
        %game area
        loop
            %your turn
            loop
                pick := 0
                put "Your Inventory:"
                put "Shells: ", shells,
                    " Bullets: ", bullets,
                    " Grenades: ", grenades,
                    " Rockets: ",
                    rockets,
                    " Slugs: ", slugs,
                    " Cells: ",
                    cells
                put "Enemy Inventory:"
                put "Shells: ", eshells,
                    " Bullets: ", ebullets,
                    " Grenades: ",
                    egrenades, " Rockets: ",
                    erockets,
                    " Slugs: ", eslugs,
                    " Cells: ",
                    ecells
                if quaddamage > 0 then
                    put "Quad Damage For ",
                        quaddamage, " Turns"
                end if
                if invulnerability > 0 then
                    put
                        "Invulnerability For ",

                        invulnerability,
                        " Turns"
                end if
                if equaddamage > 0 then
                    put
                        "Enemy Quad Damage For ",

                        equaddamage,
                        " Turns "
                end if
                if einvulnerability > 0 then
                    put
                        "Enemy Invulnerability For ",


                        einvulnerability,
                        " Turns"
                end if
                put "Enemy Health: ",
                    enemyhp, " - Armor: ",
                    enemyarmor
                put "Your Health : ",
                    yourhp, " - Armor: ",
                    yourarmor
                put " "
                put "Current Hand:"
                put " "
                for i : 1 .. 5
                    put i, " : ", hand (i)
                end for
                put
                    "What card would you like to use?"
                get pick
                checkpick
                exit when pick >= 1 and pick
                    <= 5
                cls
                put "Invalid Pick"
            end loop
            if quaddamage > 0 then
                quaddamage := quaddamage - 1
            end if
            if einvulnerability > 0 then
                einvulnerability :=
                    einvulnerability - 1
            end if
            Time.Delay (times)
            randint (rando, 1, 27)
            hand (pick) := typeofcard
            cardcheck
            exit when enemyhp <= 0
            %enemy turn
            randint (pick, 1, 5)
            echeckpick
            Time.Delay (times)
            randint (rando, 1, 27)
            ehand (pick) := typeofcard
            cardcheck
            if equaddamage > 0 then
                equaddamage := equaddamage -
                    1
            end if
            if invulnerability > 0 then
                invulnerability :=
                    invulnerability - 1
            end if
            cls
            exit when yourhp <= 0
        end loop
        shells := 0
        eshells := 0
        bullets := 0
        ebullets := 0
        grenades := 0
        egrenades := 0
        rockets := 0
        erockets := 0
        slugs := 0
        eslugs := 0
        cells := 0
        ecells := 0
        if yourhp <= 0 then
            yourhp := 0
            cls
            death := death + 1
            put "You Lose!!"
            Time.Delay (2000)
            cls
        elsif enemyhp <= 0 then
            enemyhp := 0
            cls
            frag := frag + 1
            put "You Win!!"
            experience := experience +
                expamnt

            put "You Gain ", expamnt,
                " Experience!"
            put
                "Your Total Experience is now ",

                experience
            if experience >= lvlxp then
                put "You Leveled Up!!"
                put
                    "You Gained 1 Weapon Point!!"
                weaponpoint := weaponpoint +
                    1
                if lvlxp >= 1600 and lvlxp <
                        2000 then
                    lvlxp := lvlxp + 400
                elsif lvlxp >= 2000 then
                    lvlxp := lvlxp + 1000
                elsif lvlxp < 1600 then
                    lvlxp := lvlxp * 2
                end if
            end if
            Time.Delay (2000)
            cls
        end if
    else
        cls
        put "Invalid Command"
    end if
end loop

