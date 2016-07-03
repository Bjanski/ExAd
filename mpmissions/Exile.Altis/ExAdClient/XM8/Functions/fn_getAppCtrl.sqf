params ["_display","_slide","_key","_map","_index",["_ctrl", controlNull]];

_map = call compile format["ExAd_XM8_MAP_%1",_slide];
_index = _map find _key;

if (_index != -1) then {
	_idc = ((getNumber (missionConfigFile >> "CfgXM8" >> _slide >> "controlID")) + _index);
	_ctrl = _display displayCtrl _idc;
};

_ctrl