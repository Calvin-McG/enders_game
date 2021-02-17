// ATTACHMENTS - PRIMARY
_attach1 = "acc_pointer_IR";

_scope1 = "optic_Arco";

// ====================================================================================

// AMMO SETTINGS
// Ratio between tracers and normal mags 0 = all normal magazines, 1 = all tracer magazines. Values are rounded.
_tracermagfraction = 1;
// How much the assistant carries compared to the gunner
_assistantfraction = 1;

// ====================================================================================
// Grenades
_grenade = "ACE_Chemlight_HiRed";
_grenadeamount = 4;
_Mgrenade = "ACE_HandFlare_Red";
_Mgrenadeamount = 4;
_smokegrenade = "SmokeShellRed";
_smokegrenadeamount = 4;

// Pistols (CO, DC, Automatic Rifleman, Medium MG Gunner)
_pistol = ["Cre8ive_Pst_CV_Ruka_357"];
_pistolmag = "Cre8ive_Mag_6Rnd_357_Speedloader_Tracer_Red";
_pistolmagamount = 3;
_pistolclasses = ["mmg"];

// Medium MG
_MMG = "LMG_Zafir_F";
_MMGmag = "ACE_150Rnd_762x54_Box_tracer_red";
_MMGmag_tr = "ACE_150Rnd_762x54_Box_tracer_red";
_MMGattachments = [_scope1,_attach1];
_MMGmagamount = 4;

// Chemlights
_chemlights = ["ACE_Chemlight_HiRed"];
_chemlightsamount = 0;
//Binoculars
_laserdesignator = "Laserdesignator_02"; // Laser Designator

// ====================================================================================

// CLOTHES AND UNIFORMS

_glasses = [];
_helmet = ["H_HelmetLeaderO_ocamo"];
_uniform = [];
_vest = ["V_PlateCarrierSpec_mtp"];
_backpack = ["B_ViperLightHarness_hex_F"];
_outfit = [_glasses,_helmet,_uniform,_vest,_backpack];

// ====================================================================================

// INTERPRET PASSED VARIABLES
// The following inrerprets formats what has been passed to this script element

_typeofUnit = toLower (_this select 0);			// Tidy input for SWITCH/CASE statements, expecting something like : r = Rifleman, co = Commanding Officer, rat = Rifleman (AT)
_unit = _this select 1;					// expecting name of unit; originally passed by using 'this' in unit init
_isMan = _unit isKindOf "CAManBase";	// We check if we're dealing with a soldier or a vehicle

// A quick function to add more than one item for readability
_additems = {params ["_item","_amount","_unit"]; if (_amount > 0) then {for "_i" from 1 to _amount do { _unit additem _item };};};
_addrandomitems = {params ["_itemarray","_amount","_unit"]; if (_amount > 0) then {for "_i" from 1 to _amount do { _unit additem (selectrandom _itemarray) };};};
// ====================================================================================

// This block needs only to be run on an infantry unit
if (_isMan) then {

	// PREPARE UNIT FOR GEAR ADDITION
	// The following code removes all existing weapons, items, magazines and backpacks
	_unit setVariable ["BIS_enableRandomization", false];
	removeUniform _unit;
	removeHeadgear _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeAllWeapons _unit;
	removeAllItemsWithMagazines _unit;
	removeAllAssignedItems _unit;

	// ====================================================================================

	// HANDLE CLOTHES
	// Add Glasses, Helmet, Uniform, Vest and Backpack
	
	if(count (_outfit select 0) > 0) then {_unit addGoggles (selectrandom (_outfit select 0))};
	if(count (_outfit select 1) > 0) then {_unit addHeadgear (selectrandom (_outfit select 1))};
	if(count (_outfit select 2) > 0) then {_unit forceAddUniform (selectrandom (_outfit select 2))};
	if(count (_outfit select 3) > 0) then {_unit addVest (selectrandom (_outfit select 3))};
	if(count (_outfit select 4) > 0) then {_unit addBackpack (selectrandom (_outfit select 4))};
	

	// ====================================================================================

	// ADD UNIVERSAL ITEMS
	// Add items universal to all units of this faction 
	// Note these items are the first to get added to the unit

	_unit linkItem "ItemMap";				// Add and equip the map
	_unit linkItem "ItemCompass";			// Add and equip a compass
	_unit linkItem "ACE_Altimeter";				// Add and equip a watch
	_unit linkItem "ItemGPS"; 			// Add and equip a GPS
	
	_unit addmagazines ["Laserbatteries",1];
	_unit addweapon _laserdesignator;

	// ADD ACE ITEMS
	_unit addItem "ACE_Flashlight_XL50";	// Add a flashlight for ACE map support.
	_unit addItem "ACE_Maptools";
	_unit addItem "ACE_SpraypaintRed";

	// Add medical items
	{_unit addItem "ACE_fieldDressing"} forEach [1,2,3,4]; // Bandages
	{_unit addItem "ACE_elasticBandage"} forEach [1,2]; // Bandages
	{_unit addItem "ACE_quikclot"} forEach [1]; // Bandages
	{_unit addItem "ACE_packingBandage"} forEach [1,2]; // Bandages

	{_unit addItem "ACE_morphine"} forEach [1,2,3,4];
	{_unit addItem "ACE_tourniquet"} forEach [1,2];
	{_unit addItem "ACE_splint"} forEach [1,2];	
	{_unit addItem "ACE_epinephrine"} forEach [1,2];
	{_unit addItem "ACE_adenosine"} forEach [1];
	{_unit addItem "ACE_bloodIV_500"} forEach [1];
	//Add chemlights
	[_chemlights, _chemlightsamount,_unit] call _addrandomitems;
};

// ====================================================================================

// DEFINE UNIT TYPE LOADOUTS
// The following blocks of code define loadouts for each type of unit (the unit type
// is passed to the script in the first variable)

switch (_typeofUnit) do
{

// ====================================================================================

// LOADOUT: MEDIUM MG GUNNER
	case "mmg":
	{
		_unit addmagazines [_MMGmag,_MMGmagamount];
		_unit addmagazines [_MMGmag,_MMGmagamount];
		_unit addweapon _MMG;
		removeAllPrimaryWeaponItems _unit;
		{
			// loop trough the attachments and add them to the weapon
			_unit addPrimaryWeaponItem _x;
		} 	foreach _MMGattachments;			
		_unit addmagazines [_smokegrenade,_smokegrenadeamount];
		_unit addmagazines [_grenade,_grenadeamount];
		_unit addmagazines [_Mgrenade,_Mgrenadeamount];
	};

// CARGO: IFV - room for 10 weapons and 100 cargo items
	case "v_ifv":
	{
		clearWeaponCargoGlobal _unit;
		clearMagazineCargoGlobal _unit;
		clearItemCargoGlobal _unit;
		clearBackpackCargoGlobal _unit;
		_unit addMagazineCargoGlobal [_MMGmag, 15];
		_unit addMagazineCargoGlobal [_grenade, 8];
		_unit addmagazineCargoGlobal [_mgrenade,8];
		_unit addMagazineCargoGlobal [_smokegrenade, 8];
		_unit addItemCargoGlobal ["ACE_elasticBandage", 20];
		_unit addItemCargoGlobal ["ACE_morphine", 10];
		_unit addItemCargoGlobal ["ACE_epinephrine", 10];
		_unit addItemCargoGlobal ["ACE_bloodIV", 5];
		_unit addItemCargoGlobal ["ACE_splint", 10];
		_unit addMagazineCargoGlobal [_pistolmag, 6];
		_unit addMagazineCargoGlobal [_redsmoke, 3];
	};

// CRATE: Small, ammo for 1 fireteam

// LOADOUT: DEFAULT/UNDEFINED (use MMG)
   default
   {
		_unit addmagazines [_MMGmag,_MMGmagamount];
        _unit addmagazines [_MMGmag,_MMGmagamount];
        _unit addweapon _MMG;
        removeAllPrimaryWeaponItems _unit;
        {
            // loop trough the attachments and add them to the weapon
            _unit addPrimaryWeaponItem _x;
        } 	foreach _MMGattachments;
        _unit addmagazines [_smokegrenade,_smokegrenadeamount];
		_unit selectweapon primaryweapon _unit;

		if (true) exitwith {player globalchat format ["DEBUG (f\assignGear\f_assignGear_aaf.sqf): Unit = %1. Gear template %2 does not exist, used MMG Gunner instead.",_unit,_typeofunit]};
   };


// ====================================================================================

// END SWITCH FOR DEFINE UNIT TYPE LOADOUTS
};

// ====================================================================================
//Create spawnable function to enable the right colors to be given


// If this isn't run on an infantry unit we can exit
if !(_isMan) exitWith {};

// Add weapons & attachments according to class
if (_typeofunit in _pistolclasses) then {
	_unit addmagazines [_pistolmag,_pistolmagamount];
	_unit addweapon (selectrandom _pistol);
};
// ====================================================================================

// ENSURE UNIT HAS CORRECT WEAPON SELECTED ON SPAWNING

_unit selectweapon primaryweapon _unit;
