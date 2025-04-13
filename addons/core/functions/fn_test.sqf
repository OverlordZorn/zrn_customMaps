

((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {
	params ["_ctrl"];
	private _worldSize = worldSize;

    _ctrl drawRectangle [
		[_worldSize/2, _worldSize/2],
		1000 * 100,
		1000 * 100,
		0,
		[0,0,0,1],
		"#(rgb,1,1,1)color(0,0,0,1)"
	];


	private _scale = _worldSize / 48 / ctrlMapScale _ctrl;
    _ctrl drawIcon [
		getMissionPath "bill_redstone_co.paa",
		[1,1,1,1],
		[_worldSize/2, _worldSize/2],
		_scale,
		_scale,
		0
	];

    
}];
