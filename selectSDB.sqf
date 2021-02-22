_target = _this select 0;
_caller = _this select 1;
_rank = rank _caller;

if (_rank == "CAPTAIN") then
{
    hint "Selected 110kg Glide Bomb";
    _target addmagazine "magazine_Bomb_SDB_x1";
    _target addweapon "weapon_SDBLauncher";
    removeAllActions _target;
    _target addAction ["Repair and Rearm the heli (Must be below 25m)", "repair.sqf"];
}
else
{
	hint "You're not the pilot. Keep your grubby mitts off the helicopter.";
};
