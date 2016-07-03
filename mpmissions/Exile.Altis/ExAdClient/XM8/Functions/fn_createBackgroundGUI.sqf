params ["_display","_parent","_idc","_position","_ctrl"];

_ctrl = _display ctrlCreate ["RscBackgroundGUI", _idc, _parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlCommit 0;
_ctrl ctrlSetBackgroundColor [0,0,0,0.5];

_ctrl