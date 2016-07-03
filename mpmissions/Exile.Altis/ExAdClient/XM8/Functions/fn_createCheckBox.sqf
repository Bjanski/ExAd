params ["_display","_parent","_idc","_position","_actionOnSelChanged","_tooltip","_ctrl"];

_ctrl = _display ctrlCreate ["RscCheckBox",_idc,_parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetEventHandler ["CheckedChanged",_actionOnSelChanged];
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;

_ctrl