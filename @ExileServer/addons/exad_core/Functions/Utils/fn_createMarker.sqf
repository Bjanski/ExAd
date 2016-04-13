/*  
	fn_createMarker.sqf

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

private["_markerPos","_markerColor","_markerSize","_markerName","_markerText","_markerDot","_markers","_marker","_dot"];

_markerPos = [_this,0,[0,0,0]] call BIS_fnc_param;
_markerColor = [_this,1,"Default"] call BIS_fnc_param;
_markerSize = [_this,2,50] call BIS_fnc_param;
_markerName = [_this,3,("ExAdMarker" + str diag_tickTime)] call BIS_fnc_param;
_markerText = [_this,4,""] call BIS_fnc_param;
_markerDot = [_this,5,false] call BIS_fnc_param;

_markers = [];

_marker = createMarker [_markerName,_markerPos];
_marker setMarkerColor _markerColor;
_marker setMarkerShape "ELLIPSE";
_marker setMarkerBrush "Solid";
_marker setMarkerSize [_markerSize,_markerSize];
_marker setMarkerText (_markerText);
_markers pushBack _marker;
if(_markerDot)then{
	_dot = createMarker [format["%1dot",_markerName], _markerPos];
	_dot setMarkerColor "ColorBlack";
	_dot setMarkerType "mil_dot";
	_dot setMarkerText _markerText;
	_markers pushBack _dot;
};

_markers