mission_fnc_mapOverlayCache = [] call CBA_fnc_createNamespace;
mission_fnc_mapOverlay = {
	params ["_map"];

	_map drawIcon [ 
		getMissionPath "map.paa", 
		[1, 1, 1, 1], 
		[worldSize / 2, worldSize / 2, 0], 
		640 / ctrlMapScale _map,
		640 / ctrlMapScale _map, 
		0
	];

	{
		if !(markerType _x in ["Empty", "ellipse", "rectangle"]) then {
			private _color = if (markerColor _x in ["", "Default"]) then {
				getArray (configFile >> "CfgMarkers" >> markerType _x >> "color");
			} else {
				getArray (configFile >> "CfgMarkerColors" >> markerColor _x >> "color");
			};
			_color = mission_fnc_mapOverlayCache getVariable [str _color, _color];

			if !(_color isEqualTypeAll 0) then {
				private _cacheKey = str _color;
				_color = _color apply { call compile _x };
				mission_fnc_mapOverlayCache setVariable [_cacheKey, _color];
			};

			_map drawIcon [ 
				getText (configFile >> "CfgMarkers" >> markerType _x >> "icon"), 
				_color, 
				markerPos _x, 
				(markerSize _x)#0 * 30,
				(markerSize _x)#1 * 30,
				markerDir _x,
				markerText _x,
				1
			];
		};
		
				
		if (markerShape _x == "POLYLINE") then {
			private _color = if (markerColor _x in ["", "Default"]) then {
				getArray (configFile >> "CfgMarkers" >> markerType _x >> "color");
			} else {
				getArray (configFile >> "CfgMarkerColors" >> markerColor _x >> "color");
			};
			_color = mission_fnc_mapOverlayCache getVariable [str _color, _color];

			if !(_color isEqualTypeAll 0) then {
				private _cacheKey = str _color;
				_color = _color apply { call compile _x };
				mission_fnc_mapOverlayCache setVariable [_cacheKey, _color];
			};

			private _coords = markerPolyline _x;
						
			for "_i" from 0 to ((count _coords) - 4) step 2 do {
				private _from = [_coords select _i, _coords select (_i + 1)];
				private _to = [_coords select (_i + 2), _coords select (_i + 3)];
				// Draw the line
				_map drawLine [_from, _to, _color];
			};			
		};
	} forEach allMapMarkers;
};

[{
	!isNull findDisplay 12
}, {
	((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", { call mission_fnc_mapOverlay }]
}] call CBA_fnc_waitUntilAndExecute;