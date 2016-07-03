params ["_display","_parent","_idc","_position","_picture","_color","_enable","_keepAspect","_tooltip","_ctrl"];

_ctrl = _display ctrlCreate [(if (_keepAspect) then {"RscPictureKeepAspect"} else {"RscPicture"}), _idc, _parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetText _picture;
_ctrl ctrlSetTextColor _color;
_ctrl ctrlEnable _enable;
_ctrl ctrlSetTooltip _tooltip;
_ctrl ctrlCommit 0;

_ctrl