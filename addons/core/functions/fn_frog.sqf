mission_fnc_mapOverlay = {
	params ["_map"];

	_map drawIcon [ 
		getMissionPath "Handdrawn_Map.paa", 
		[1, 1, 1, 1], 
		[worldSize / 2, worldSize / 2, 0], 
		640 / ctrlMapScale _map,
		640 / ctrlMapScale _map, 
		0
	];
};

[{
	!isNull findDisplay 12
}, {
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", { call mission_fnc_mapOverlay }]
}] call CBA_fnc_waitUntilAndExecute;