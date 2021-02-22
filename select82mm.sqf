_target = _this select 0;
_caller = _this select 1;
_rank = rank _caller;

if (_rank == "CAPTAIN") then
{
    hint "Selected 82mm Mortar with 8 HE shells";
    _target addmagazine "8Rnd_82mm_Mo_shells";
    _target addweapon "mortar_82mm";
    removeAllActions _target;
    _target addAction ["Repair and Rearm the heli (Must be below 25m)", "repair.sqf"];
}
else
{
	hint "You're not the pilot. Keep your grubby mitts off the helicopter.";
};
