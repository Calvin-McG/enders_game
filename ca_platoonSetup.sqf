// F3_CA Hierarchy setup 
// Server execution only and run once at the start of mission

//Side tickets available (Where one ticket = 1 respawn, default 5 for vehicles) per team in addition to the group tickets;
// Change to for example _caEastTickets = 49 if needed for TvTs/events with multiple sides
_caWestTickets = 20;
_caEastTickets = _caWestTickets;
_caIndependentTickets = _caWestTickets;

/*
Parameters for ca_fnc_setupGroup, which is what the setup inside the _hierarchywest block uses to setup each group. 
 * 0: Side (Side): This is set automatically, if you need to set up for multiple sides copy the _hierachy code block and name it _westhierarchy, _easthierachy etc. as needed and change the call below.
 * 1: Groupid (String): The groupid that is set in the editor field callsign.
 * 2: Superior (String): The groupid of the group that ranks above it in the hierarchy, if equal to groupid, then the group is an independent group or its own platoon.
 * 3: Short range radio channel (Number): What channel the 343 will be on by default and on respawn. 
 * 4: Long range radio Array (Array): Array of channels the long range radios will be on by default and on respawn. There will be one radio given per channel to ranks set in ca_acre2settings.sqf
 * 5: Group color (String): The color of the group in the hierarchy and its groupmarker. Available colors: "ColorBlack","ColorGrey","ColorRed","ColorBrown","ColorOrange","ColorYellow","ColorKhaki","ColorGreen","ColorBlue","ColorPink","ColorWhite"
 * 6: Group tickets (Number): The number of tickets this group gets to play with at the start of the mission. 
 * 7: Group marker (Boolean): Should each team get a group marker assigned to them? Default: True. 
 * 8: Group type (String): What markertype the unit has. This is if you want to use the non-automatic mode that the groupmarker uses. For non smooth markers its any A3 marker, for smooth markers its b_hq,b_inf,b_sf,b_supply,b_motor_inf,b_mortar,b_maint,b_eod,b_med,b_mech_inf,b_armor,b_recon,b_air,b_plane,b_art,b_naval,b_antiair,b_antitank,b_heavyantitank,b_heavyweapons
[_side,"ASL","CO",1,[4,1],"ColorRed",5] spawn ca_fnc_setupGroup;
[_side,"ELEMENT","ELEMENT IMMEDIATELY ABOVE THEM IN THE HIERARCHY",SR radio channel,[LR radio channels],"ColorOfgroup",Number of group tickets 123,Should the group get a map marker true/false,"grouptype aka which marker they get"] spawn ca_fnc_setupGroup;
*/
// FOR COMPANY HIERARCHY -- COPY THE OTHER PLATOONS/GROUPS FROM THE BOTTOM OF THE FILE. 
//To create a seperate hierarchy for another side, copy the brackets from line 29 to 56.

_hierarchywest = {
	_side = _this select 0;
	[_side,"CHARTREUSE","CHARTREUSE",1,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0.5,1,0]
	[_side,"EMERALD","EMERALD",2,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0.3125,0.78125,0.46875]
	[_side,"CELADON","CELADON",3,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0.671875,0.87890625,0.68359375]
	[_side,"LIME","LIME",4,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0.74609375,0.99609375,0]
	[_side,"SHAMROCK","SHAMROCK",5,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0,0.6171875,0.375]
	[_side,"JADE","JADE",6,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0,0.65625,0.41796875]
	[_side,"MALACHITE","MALACHITE",7,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0.04296875,0.8515625,0.31640625]
	[_side,"FERN","FERN",8,[1],"ColorGreen",0, true] spawn ca_fnc_setupGroup; // [0.30859375,0.47265625,0.2578125]

	[_side,"MADDER","MADDER",1,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [0.64453125,0,0.12890625]
	[_side,"CRIMSON","CRIMSON",2,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [0.859375,0.078125,0.234375]
	[_side,"PINK","PINK",3,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [1,0.75,0.79296875]
	[_side,"SALMON","SALMON",4,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [1,0.56640625,0.640625]
	[_side,"CARDINAL","CARDINAL",5,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [0.765625,0.1171875,0.2265625]
	[_side,"CARMINE","CARMINE",6,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [0.5859375,0,0.09375]
	[_side,"VERMILION","VERMILION",7,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [0.88671875,0.2578125,0.203125]
	[_side,"CINNABAR","CINNABAR",8,[1],"ColorRed",0, true] spawn ca_fnc_setupGroup; // [0.890625,0.30078125,0.1875]
};

_hierarchyeast = _hierarchywest;
_hierarchyindependent = _hierarchywest;

// Long radio channels setup
// Long range channel names for 148, 152, 117, Vehicle radios. This correlates to "ALPHA SQUAD" = Channel 1 in the platoon hierarchy array above. 
_caWestLongrangeChannelList = ["BLUE","COMMAND 2","FORWARD AIR","ALPHA","BRAVO","CHARLIE","1ST PLATOON","DELTA","ECHO","FOXTROT","2ND PLATOON","GOLF","HOTEL","INDIA","3RD PLATOON"];
_caEastLongrangeChannelList = ["RED","COMMAND 2","FORWARD AIR","ALPHA","BRAVO","CHARLIE","1ST PLATOON","DELTA","ECHO","FOXTROT","2ND PLATOON","GOLF","HOTEL","INDIA","3RD PLATOON"];
_caIndependentLongrangeChannelList = ["GREEN","COMMAND 2","FORWARD AIR","ALPHA","BRAVO","CHARLIE","1ST PLATOON","DELTA","ECHO","FOXTROT","2ND PLATOON","GOLF","HOTEL","INDIA","3RD PLATOON"];
/* Default setup on 343 (short range) for the hierarchy above:
CH1:ASL CH2:A1 CH3:A2 CH4:AV CH5:BSL CH6:B1 CH7:B2 CH8:BV CH9:CSL CH10:C1 CH11:C2 CH12:CV CH13:ENG/LOGI CH14:WEAPONS CH15:STATICS CH16:CO
*/
// ====================================================================================
/* Ranks for various actions like respawning and adjusting the hierachy. CO rank can change all elements of the hierarchy and call respawn waves.
0 - Private
1 - Corporal - Default for Fireteam lead
2 - Sergeant - Default for Squad lead
3 - Lieutenant - Default for Commanding Officer
4 - Captain 
5 - Major
6 - Colonel
*/
_corank = 3;
_slrank = 2;
_ftlrank = 1;

// Respawn settings
// ====================================================================================
// How far away an enemy in meters must be for respawn to be available. Intentionally set to 1 meters.
ca_enemyradius = 1;
// Delay for when a group can be respawn after the first player enters spectate. If group respawn is ready and another player dies, the respawn timer goes on cooldown again.
// If the timer is low then it is recommended to increase ca_enemyradius so you're unable to respawn in the middle of combat.
ca_grouprespawncooldown = 180;
// Hardcore option: How close you must be to your squad lead or CO to be able to recieve more tickets (Creating a sort of group based rally point system). 
//If the group is out of tickets then they won't be able to respawn (Except with a respawn wave, if you leave that option open as a mission maker). Defaulted to false.
ca_ticketradius = 50; // Meters
ca_ticketradiusmechanic = false; 

// END OF SETUP VARIABLES
// Executing setup as described above
// ====================================================================================
// ====================================================================================
sleep 2;

missionNamespace setVariable ['f_radios_settings_acre2_lr_groups_blufor',_caWestLongrangeChannelList, true]; 
missionNamespace setVariable ['f_radios_settings_acre2_lr_groups_opfor',_caEastLongrangeChannelList, true]; 
missionNamespace setVariable ['f_radios_settings_acre2_lr_groups_indfor',_caIndependentLongrangeChannelList, true]; 

missionNamespace setVariable ['ca_corank',_corank, true]; 
missionNamespace setVariable ['ca_slrank',_slrank, true]; 
missionNamespace setVariable ['ca_ftlrank',_ftlrank, true]; 


ca_allWestPlayerGroups = [];
ca_allEastPlayerGroups = [];
ca_allIndependentPlayerGroups = [];

{
	if (side _x == west) then {ca_allWestPlayerGroups pushBackUnique group _x};
	if (side _x == east) then {ca_allEastPlayerGroups pushBackUnique group _x};
	if (side _x == independent) then {ca_allIndependentPlayerGroups pushBackUnique group _x};
} forEach allunits;

ca_WestJIPgroups = [];
ca_EastJIPgroups = [];
ca_IndependentJIPgroups = [];
sleep 5;
//Setting up the hierarchyblocks It needs to be executed now to allow all the mission variables to be set first. 
// ====================================================================================

[west] call _hierarchywest;
[east] call _hierarchyeast;
[independent] call _hierarchyindependent;

sleep 10;
missionNamespace setVariable ['ca_WestJIPgroups',ca_WestJIPgroups, true]; 
missionNamespace setVariable ['ca_EastJIPgroups',ca_EastJIPgroups, true]; 
missionNamespace setVariable ['ca_IndependentJIPgroups',ca_IndependentJIPgroups, true]; 

missionNamespace setVariable ['ca_WestTickets',_caWestTickets, true]; 
missionNamespace setVariable ['ca_EastTickets',_caEastTickets, true]; 
missionNamespace setVariable ['ca_IndependentTickets',_caIndependentTickets, true]; 

missionNamespace setVariable ['ca_enemyradius',ca_enemyradius, true]; 
missionNamespace setVariable ['ca_ticketradius',ca_ticketradius, true]; 
missionNamespace setVariable ['ca_grouprespawncooldown',ca_grouprespawncooldown, true]; 

sleep 2;
missionNamespace setVariable ['ca_platoonsetup',true, true]; 
"CA Hierarchy setup done, ca_platoonsetup = true" remoteExec ["diag_log"];
