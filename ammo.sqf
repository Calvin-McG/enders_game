_heli = _this select 0;
_pos = getPosATL (_this select 0);
_alt = _pos select 2;
if (_alt <= 25) then {
clearWeaponCargoGlobal _heli;
clearMagazineCargoGlobal _heli;
clearItemCargoGlobal _heli;
clearBackpackCargoGlobal _heli;
_heli addMagazineCargoGlobal ["150Rnd_762x54_Box_Tracer", 6];
_heli addItemCargoGlobal ["ACE_morphine", 4];
_heli addItemCargoGlobal ["ACE_quikclot", 8];
_heli addItemCargoGlobal ["ACE_Banana", 4];
_heli addItemCargoGlobal ["ACE_SpareBarrel", 4];
hint "Ammo Replenished";
}
else {
hint "You are too high\nYou must be below 25m";
};
