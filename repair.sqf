_heli = _this select 0;
_caller = _this select 1;
_pos = getPosATL (_this select 0);
_alt = _pos select 2;
if (_alt <= 25) then {
    _heli setDamage 0;
    _heli removeMagazines "32Rnd_40mm_G_belt";
    _heli removeMagazines "PylonRack_7Rnd_Rocket_04_HE_F";
    _heli removeMagazines "magazine_Bomb_SDB_x1";
    _heli removeMagazines "8Rnd_82mm_Mo_shells";
    _heli addmagazine "32Rnd_40mm_G_belt";
    _heli addmagazine "PylonRack_7Rnd_Rocket_04_HE_F";
    _heli addmagazine "magazine_Bomb_SDB_x1";
    _heli addmagazine "8Rnd_82mm_Mo_shells";

    _faction = faction _caller;
    hint _faction;

    if (_faction == "IND_F") then {
        ["v_ifv",_heli,"ind_f"] call f_fnc_assignGear;
    }
    else {
        ["v_ifv",_heli,"opf_f"] call f_fnc_assignGear;
    };

    hint "Heli repaired and rearmed";
}
else {
hint "You are too high\nYou must be below 25m";
};
