_target = _this select 0;
_caller = _this select 1;
_rank = rank _caller;

if (_rank == "CAPTAIN") then
{
    hint "Selected 40mm GMG with 32Rnd belts";
    _target addmagazine "32Rnd_40mm_G_belt";
    _target addweapon "GMG_40mm";
    removeAllActions _target;
    _target addAction ["Repair and Rearm the heli (Must be below 25m)", "repair.sqf"];
}
else
{
	hint "You're not the pilot. Keep your grubby mitts off the helicopter.";
};
