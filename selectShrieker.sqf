_target = _this select 0;
_caller = _this select 1;
_rank = rank _caller;

if (_rank == "CAPTAIN") then
{
    hint "Selected 7 Rnd Shrieker Rocket Pod";
    _target addmagazine "PylonRack_7Rnd_Rocket_04_HE_F";
    _target addweapon "Rocket_04_HE_Plane_CAS_01_F";
    removeAllActions _target;
    _target addAction ["Repair and Rearm the heli (Must be below 25m)", "repair.sqf"];
}
else
{
	hint "You're not the pilot. Keep your grubby mitts off the helicopter.";
};
