params ["_slide","_key","_baseIDC","_map"];

_baseIDC = getNumber (missionConfigFile >> "CfgXM8" >> _slide >> "controlID");
_map = call compile format["ExAd_XM8_MAP_%1",_slide];

(_baseIDC + (_map pushBack _key))