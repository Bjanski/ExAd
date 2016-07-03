params ["_display","_parent","_idc","_position","_text","_font","_size","_color","_align","_shadow","_ctrl"];

_ctrl = _display ctrlCreate ["RscStructuredText", _idc, _parent];
_ctrl ctrlSetPosition _position;
_ctrl ctrlSetStructuredText (parseText format ["<t shadow='%6' font='%5' align='%4' size='%2' color='%3'>%1</t>", _text,_size,_color, _align,_font,_shadow]);
_ctrl ctrlEnable false;
_ctrl ctrlCommit 0;

_ctrl