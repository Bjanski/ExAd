params ["_display","_parent","_idc","_position","_actionOnSelChanged","_tooltip","_ctrl"];

_ctrl = _display ctrlCreate ["RscXListBox",_idc,_parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetEventHandler ["LBSelChanged",_actionOnSelChanged];
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;

_ctrl