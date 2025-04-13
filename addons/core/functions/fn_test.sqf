

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
	params ["_ctrl"];
	private _worldSize = worldSize;

	(findDisplay 12 displayCtrl 510) ctrlSetTextColor [0.05,0.05,0.05,1];

    /*
	_ctrl drawRectangle [
		[_worldSize/2, _worldSize/2],
		1000 * 100,
		1000 * 100,
		0,
		[0,0,0,1],
		"#(rgb,1,1,1)color(0.05,0.05,0.05,1)"
	];
	*/

	private _scale = _worldSize / (_worldSize / 640) / ctrlMapScale _ctrl;
    _ctrl drawIcon [
		getMissionPath "Handdrawn_Map.paa",
		[1,1,1,1],
		[_worldSize/2, _worldSize/2],
		_scale,
		_scale,
		0
	];
}];
