/*  
	fn_getCompassStr.sqf
	
	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/
private["_img","_dir"];

_img = [ExAd_SB_ICON_COMPASS] call ExAd_fnc_formatSBImage;
_dir = direction player;

try
{
	if(_dir >= 337.5 || _dir < 22.5 )then{throw "N"};
	if(_dir >= 22.5 && _dir < 67.5 )then{throw "NE"};
	if(_dir >= 67.5 && _dir < 112.5 )then{throw "E"};
	if(_dir >= 112.5 && _dir < 157.5 )then{throw "SE"};
	if(_dir >= 157.5 && _dir < 202.5 )then{throw "S"};
	if(_dir >= 202.5 && _dir < 247.5 )then{throw "SW"};
	if(_dir >= 247.5 && _dir < 292.5 )then{throw "W"};
	if(_dir >= 292.5 && _dir < 337.5 )then{throw "NW"};

	throw "N/A"
} 
catch 
{
	[[_img, _exception, round _dir]] call ExAd_fnc_formatSBOutput
}