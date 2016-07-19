params ["_display","_parent","_idc","_position","_text"];

_ctrl = _display ctrlCreate ["RscExileXM8Edit", _idc, _parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetText _text;
_ctrl ctrlCommit 0;

_ctrl