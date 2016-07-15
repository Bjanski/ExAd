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

_margin = 0.5;
_rowH = 1.3 * _pH;
_blockH = 6 * _pH;

_leftCol = 0 * _pW; 
_leftColW = 6 * _pW;

_midCol = _leftCol + _leftColW + (_margin * _pW);
_midColW = 20 * _pW;

_rightCol = _midCol + _midColW + (_margin * _pW);
_rightColW = 5 * _pW;

_footTop = 1 * _pH;
_carTop = _footTop + _blockH;
_airTop = _carTop + _blockH;

_slideClass = "ExAd_CHVD";

[_display,_slide,([_slideClass,"backButton"] call ExAd_fnc_getNextIDC),[27 * _pW, 17 * _pH, 6 * _pW, 1 * _pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',"GO BACK"] call ExAd_fnc_createButton;


_newParent = [_display,_slide,([_slideClass,"ctrlGrp"] call ExAd_fnc_getNextIDC),[0, _footTop, 34 * _pW, 16 * _pH]] call ExAd_fnc_createCtrlGrp;
_newParent ctrlEnable true;

//ON FOOT
[_display,_newParent,([_slideClass,"strTxtFootTtl"] call ExAd_fnc_getNextIDC),[_leftCol, _footTop, _leftColW, _rowH],STR_chvd_foot,"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"strTxtFootSync"] call ExAd_fnc_getNextIDC),[_rightCol + (4 * _pw) - _midColW, _footTop, _midColW, _rowH],format["%1:",STR_chvd_sync],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"cbFootSyncObj"] call ExAd_fnc_getNextIDC),[_rightCol + (3.8 * _pw), _footTop, _rightCol * 0.05, _rowH * 0.8],"",""] call ExAd_fnc_createCheckBox;

[_display,_newParent,([_slideClass,"strTxtFootView"] call ExAd_fnc_getNextIDC),[_leftCol, _footTop + _rowH, _leftColW, _rowH],format["%1:",STR_chvd_view],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"sliderFootView"] call ExAd_fnc_getNextIDC),[_midCol, _footTop + _rowH, _midColW, _rowH * 0.8]] call ExAd_fnc_createXSliderH;
[_display,_newParent,([_slideClass,"editFootView"] call ExAd_fnc_getNextIDC),[_rightCol, _footTop + _rowH, _rightColW, _rowH * 0.8]] call ExAd_fnc_createEdit;

[_display,_newParent,([_slideClass,"strTxtFootObj"] call ExAd_fnc_getNextIDC),[_leftCol, _footTop + 2 * _rowH, _leftColW, _rowH],format["%1:",STR_chvd_object],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"sliderFootObj"] call ExAd_fnc_getNextIDC),[_midCol, _footTop + 2 * _rowH, _midColW, _rowH * 0.8]] call ExAd_fnc_createXSliderH;
[_display,_newParent,([_slideClass,"editFootObj"] call ExAd_fnc_getNextIDC),[_rightCol, _footTop + 2 * _rowH, _rightColW, _rowH * 0.8]] call ExAd_fnc_createEdit;

[_display,_newParent,([_slideClass,"strTxtFootTerrain"] call ExAd_fnc_getNextIDC),[_leftCol, _footTop + 3 * _rowH, _leftColW, _rowH],format["%1:",STR_chvd_terrain],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"xListFootTerrain"] call ExAd_fnc_getNextIDC),[_midCol, _footTop + 3 * _rowH, _midColW, _rowH * 0.8],"",""] call ExAd_fnc_createXList;
[_display,_newParent,([_slideClass,"strTxtFootTerrainEdit"] call ExAd_fnc_getNextIDC),[_rightCol, _footTop + 3 * _rowH, _rightColW, _rowH * 0.8],"","PuristaMedium",1,"#ffffff","center",1] call ExAd_fnc_createStructuredText;

//IN CAR
[_display,_newParent,([_slideClass,"strTxtCarTtl"] call ExAd_fnc_getNextIDC),[_leftCol, _carTop, _leftColW, _rowH],STR_chvd_car,"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"strTxtCarSync"] call ExAd_fnc_getNextIDC),[_rightCol + (4 * _pw) - _midColW, _carTop, _midColW, _rowH],format["%1:",STR_chvd_sync],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"cbCarSyncObj"] call ExAd_fnc_getNextIDC),[_rightCol + (3.8 * _pw), _carTop, _rightCol * 0.05, _rowH * 0.8],"",""] call ExAd_fnc_createCheckBox;

[_display,_newParent,([_slideClass,"strTxtCarView"] call ExAd_fnc_getNextIDC),[_leftCol, _carTop + _rowH, _leftColW, _rowH],format["%1:",STR_chvd_view],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"sliderCarView"] call ExAd_fnc_getNextIDC),[_midCol, _carTop + _rowH, _midColW, _rowH * 0.8]] call ExAd_fnc_createXSliderH;
[_display,_newParent,([_slideClass,"editCarView"] call ExAd_fnc_getNextIDC),[_rightCol, _carTop + _rowH, _rightColW, _rowH * 0.8]] call ExAd_fnc_createEdit;

[_display,_newParent,([_slideClass,"strTxtCarObj"] call ExAd_fnc_getNextIDC),[_leftCol, _carTop + 2 * _rowH, _leftColW, _rowH],format["%1:",STR_chvd_object],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"sliderCarObj"] call ExAd_fnc_getNextIDC),[_midCol, _carTop + 2 * _rowH, _midColW, _rowH * 0.8]] call ExAd_fnc_createXSliderH;
[_display,_newParent,([_slideClass,"editCarObj"] call ExAd_fnc_getNextIDC),[_rightCol, _carTop + 2 * _rowH, _rightColW, _rowH * 0.8]] call ExAd_fnc_createEdit;

[_display,_newParent,([_slideClass,"strTxtCarTerrain"] call ExAd_fnc_getNextIDC),[_leftCol, _carTop + 3 * _rowH, _leftColW, _rowH],format["%1:",STR_chvd_terrain],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"xListCarTerrain"] call ExAd_fnc_getNextIDC),[_midCol, _carTop + 3 * _rowH, _midColW, _rowH * 0.8],"",""] call ExAd_fnc_createXList;
[_display,_newParent,([_slideClass,"strTxtCarTerrainEdit"] call ExAd_fnc_getNextIDC),[_rightCol, _carTop + 3 * _rowH, _rightColW, _rowH * 0.8],"","PuristaMedium",1,"#ffffff","center",1] call ExAd_fnc_createStructuredText;


//IN AIR
[_display,_newParent,([_slideClass,"strTxtAirTtl"] call ExAd_fnc_getNextIDC),[_leftCol, _airTop, _leftColW, _rowH],STR_chvd_air,"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"strTxtAirSync"] call ExAd_fnc_getNextIDC),[_rightCol + (4 * _pw) - _midColW, _airTop, _midColW, _rowH],format["%1:",STR_chvd_sync],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"cbAirSyncObj"] call ExAd_fnc_getNextIDC),[_rightCol + (3.8 * _pw), _airTop, _rightCol * 0.05, _rowH * 0.8],"",""] call ExAd_fnc_createCheckBox;

[_display,_newParent,([_slideClass,"strTxtAirView"] call ExAd_fnc_getNextIDC),[_leftCol, _airTop + _rowH, _leftColW, _rowH],format["%1:",STR_chvd_view],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"sliderAirView"] call ExAd_fnc_getNextIDC),[_midCol, _airTop + _rowH, _midColW, _rowH * 0.8]] call ExAd_fnc_createXSliderH;
[_display,_newParent,([_slideClass,"editAirView"] call ExAd_fnc_getNextIDC),[_rightCol, _airTop + _rowH, _rightColW, _rowH * 0.8]] call ExAd_fnc_createEdit;

[_display,_newParent,([_slideClass,"strTxtAirObj"] call ExAd_fnc_getNextIDC),[_leftCol, _airTop + 2 * _rowH, _leftColW, _rowH],format["%1:",STR_chvd_object],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"sliderAirObj"] call ExAd_fnc_getNextIDC),[_midCol, _airTop + 2 * _rowH, _midColW, _rowH * 0.8]] call ExAd_fnc_createXSliderH;
[_display,_newParent,([_slideClass,"editAirObj"] call ExAd_fnc_getNextIDC),[_rightCol, _airTop + 2 * _rowH, _rightColW, _rowH * 0.8]] call ExAd_fnc_createEdit;

[_display,_newParent,([_slideClass,"strTxtCarTerrain"] call ExAd_fnc_getNextIDC),[_leftCol, _airTop + 3 * _rowH, _leftColW, _rowH],format["%1:",STR_chvd_terrain],"PuristaMedium",1,"#ffffff","right",1] call ExAd_fnc_createStructuredText;
[_display,_newParent,([_slideClass,"xListAirTerrain"] call ExAd_fnc_getNextIDC),[_midCol, _airTop + 3 * _rowH, _midColW, _rowH * 0.8],"",""] call ExAd_fnc_createXList;
[_display,_newParent,([_slideClass,"strTxtAirTerrainEdit"] call ExAd_fnc_getNextIDC),[_rightCol, _airTop + 3 * _rowH, _rightColW, _rowH * 0.8],"","PuristaMedium",1,"#ffffff","center",1] call ExAd_fnc_createStructuredText;


true