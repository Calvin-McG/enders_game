// ====================================================================================

// F3 - Disable Saving and Auto Saving
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

enableSaving [false, false];

// ====================================================================================

// F3 - Mute Orders and Reports
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
enableSentences false;
// Wait until initServer.sqf is done to get all the variables we need.
waitUntil {!isnil {ca_initserver}};
// ====================================================================================
// Thanks to http://killzonekid.com/arma-scripting-tutorials-mission-root/
MISSION_ROOT = call
{
    private "_arr";
    _arr = toArray str missionConfigFile;
    _arr resize (count _arr - 15);
    toString _arr
};

// ====================================================================================
// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_briefing = [] execVM "f\briefing\briefing.sqf";

// ====================================================================================

// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

f_script_setTeamColours = [] execVM "f\setTeamColours\f_setTeamColours.sqf";

// ====================================================================================

// F3 - Fireteam Member Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] spawn f_fnc_SetLocalFTMemberMarkers;

// ====================================================================================

// CA - Smooth squad markers, by Bubbus
// See initServer.sqf for configuration.

[] spawn ca_fnc_initSmoothSquadMarkers;

// ====================================================================================

// F3 - F3 Common Local Variables
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// WARNING: DO NOT DISABLE THIS COMPONENT
if(isServer) then {
	f_script_setLocalVars = [] execVM "f\common\f_setLocalVars.sqf";
};

// ====================================================================================

// F3 - Loadout Notes
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\briefing\f_loadoutNotes.sqf";

// ====================================================================================

// F3 - Mission Timer/Safe Start
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\safeStart\f_safeStart.sqf";

// ====================================================================================

// F3 - Radio Systems Support
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)

[] execVM "f\acre2\acre2_init.sqf";

// ====================================================================================

// CA - Initialize CA framework
[] execVM "ca\ca_init.sqf";

// Disables users from accessing DMS missile system, and permits restricted access if the other lines are uncommented.
[] spawn {sleep 1; dmsRestrictUsers=true};

// This line permits the NATO UAV Operator class to access the DMS launcher.
//[] spawn {sleep 1; dmsAuthorizedClasses=['B_soldier_UAV_F']};

// This line permits specific units by variable name to access the DMS launcher. Do not put variable names in quotes.
//[] spawn {sleep 1; dmsAuthorizedUnits=[launchman]};

if !(isNil 'zen_custom_modules_fnc_register') then
{

    _jammerCreate = {[_this#1] call f_fnc_zen_createJammer};

    ["[F3_CA] Electronic Warfare", "Create Jammer", _jammerCreate] call zen_custom_modules_fnc_register;

    _jammerRemove = {[_this#1] call f_fnc_zen_removeJammers};

    ["[F3_CA] Electronic Warfare", "Remove Jammer", _jammerRemove] call zen_custom_modules_fnc_register;

};
