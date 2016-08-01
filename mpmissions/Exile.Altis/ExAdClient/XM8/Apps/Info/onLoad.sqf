/*  
	onLoad.sqf

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
params["_display","_slide","_idc"];

_pW = 0.025;
_pH = 0.04;
_leftCol = 0;
_leftColW = 12.8;
_rightCol = _leftCol + _leftColW + 2;
_rightColW = _leftColW + 3;
_margin = 0.2;

_slideClass = "ExAd_Info";

[_display,_slide,([_slideClass,"backButton"] call ExAd_fnc_getNextIDC),[27 * _pW, 17 * _pH, 6 * _pW, 1 * _pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',"Go Back"] call ExAd_fnc_createButton;

_newParent = [_display,_slide,([_slideClass,"ctrlGrp"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 1 * _pH, (_leftColW + _rightCol + 6) * _pW, 16 * _pH]] call ExAd_fnc_createCtrlGrp;
[_display,_newParent,([_slideClass,"strTxt"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 1.5 * _pH, (_leftColW + _rightCol + 5) * _pW, 15 * _pH],"","PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;

true