params ["_display","_parent","_idc","_position",["_action",""],["_text",""],["_tooltip",""],"_ctrl"];

/*_ctrl = _display ctrlCreate ["RscButtonMenu",_idc,_parent];*/
_ctrl = _display ctrlCreate ["RscExileXM8ButtonMenu",_idc,_parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetText _text;
_ctrl ctrlSetEventHandler ["ButtonClick",_action];
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;

_ctrl