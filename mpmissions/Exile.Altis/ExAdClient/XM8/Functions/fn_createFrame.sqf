params ["_display","_parent","_idc","_position","_ctrl"];

_ctrl = _display ctrlCreate ["RscFrame", _idc, _parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlEnable false;
_ctrl ctrlCommit 0;

_ctrl