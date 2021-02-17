_heli = _this select 0;
_pos = getPosATL (_this select 0);
_alt = _pos select 2;
if (_alt <= 25) then {
_heli setDamage 0;
hint "Heli repaired";
}
else {
hint "You are too high\nYou must be below 25m";
};
