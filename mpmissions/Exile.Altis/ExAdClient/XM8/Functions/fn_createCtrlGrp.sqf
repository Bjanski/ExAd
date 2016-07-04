params ["_display","_parent","_idc","_position","_speed","_delay","_rewind","_ctrl"];

_ctrl = _display ctrlCreate ["RscControlsGroup", _idc, _parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetAutoScrollSpeed _speed;
_ctrl ctrlSetAutoScrollDelay _delay;
_ctrl ctrlSetAutoScrollRewind _rewind;
_ctrl ctrlEnable false;
_ctrl ctrlCommit 0;

_ctrl