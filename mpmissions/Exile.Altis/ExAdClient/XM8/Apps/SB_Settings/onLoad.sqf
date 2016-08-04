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

_rowH = 1.3 * _pH;
_leftCol = 0 * _pW; 
_leftColW = 17 * _pW;

_cbCompTop = 1 * _pH;
_cbW = 1.25 * _pW;
_cbH = _rowH * 0.8;

_cbStr = _leftCol + _cbW;
_cbStrW = _leftColW - _cbW;

_rightCol = _leftCol + _leftColW;
_rightCbStr = _rightCol + _cbW;

_slideClass = "ExAd_SB";

[_display,_slide,([_slideClass,"backButton"] call ExAd_fnc_getNextIDC),[27 * _pW, 17 * _pH, 6 * _pW, 1 * _pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',STR_ExAd_SB_APP_GO_BACK] call ExAd_fnc_createButton;


_newParent = [_display,_slide,([_slideClass,"ctrlGrp"] call ExAd_fnc_getNextIDC),[0, _cbCompTop, 34 * _pW, 16 * _pH]] call ExAd_fnc_createCtrlGrp;
_newParent ctrlEnable true;

//CheckBox setup
//First col
_cbStrAlign = "left"; _titleStrAlign = "center"; _cbStrTextColor = "#ffffff"; _cbStrTextFont = "PuristaMedium"; _cbStrTextSize = 1;

if(ExAd_SB_Allow_KD)then{
	_cbKD = [_display,_newParent,([_slideClass,"cbShowKD"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop, _cbW, _cbH],"ExAd_SB_Show_KD = !ExAd_SB_Show_KD",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowKD"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_KD,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbKD cbSetChecked ExAd_SB_Show_KD;
};

if(ExAd_SB_Allow_HP)then{
	_cbHP = [_display,_newParent,([_slideClass,"cbShowHP"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 1, _cbW, _cbH],"ExAd_SB_Show_HP = !ExAd_SB_Show_HP",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowHP"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 1, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_HP,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbHP cbSetChecked ExAd_SB_Show_HP;
};

if(ExAd_SB_Allow_Thirst)then{
	_cbThirst = [_display,_newParent,([_slideClass,"cbShowThirst"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 2, _cbW, _cbH],"ExAd_SB_Show_Thirst = !ExAd_SB_Show_Thirst",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowThirst"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 2, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_THIRST,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbThirst cbSetChecked ExAd_SB_Show_Thirst;
};

if(ExAd_SB_Allow_Hunger)then{
	_cbHunger = [_display,_newParent,([_slideClass,"cbShowHunger"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 3, _cbW, _cbH],"ExAd_SB_Show_Hunger = !ExAd_SB_Show_Hunger",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowHunger"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 3, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_HUNGER,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbHunger cbSetChecked ExAd_SB_Show_Hunger;
};

if(ExAd_SB_Allow_Wallet)then{
	_cbWallet = [_display,_newParent,([_slideClass,"cbShowWallet"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 4, _cbW, _cbH],"ExAd_SB_Show_Wallet = !ExAd_SB_Show_Wallet",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowWallet"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 4, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_WALLET,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbWallet cbSetChecked ExAd_SB_Show_Wallet;
};

if(ExAd_SB_Allow_Bank)then{
	_cbBank = [_display,_newParent,([_slideClass,"cbShowBank"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 5, _cbW, _cbH],"ExAd_SB_Show_Bank = !ExAd_SB_Show_Bank",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowBank"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 5, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_BANK,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbBank cbSetChecked ExAd_SB_Show_Bank;
};

if(ExAd_SB_Allow_Respect)then{
	_cbRespect = [_display,_newParent,([_slideClass,"cbShowRespect"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 6, _cbW, _cbH],"ExAd_SB_Show_Respect = !ExAd_SB_Show_Respect",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowRespect"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 6, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_RESPECT,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbRespect cbSetChecked ExAd_SB_Show_Respect;
};

_cbColor = [_display,_newParent,([_slideClass,"cbShowColor"] call ExAd_fnc_getNextIDC),[_leftCol, _cbCompTop + _rowH * 7, _cbW, _cbH],"ExAd_SB_COMPONENTS_ACTIVE_COLORS = !ExAd_SB_COMPONENTS_ACTIVE_COLORS",""] call ExAd_fnc_createCheckBox;
[_display,_newParent,([_slideClass,"strTxtShowColor"] call ExAd_fnc_getNextIDC),[_cbStr, _cbCompTop + _rowH * 7, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_COLORS,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;

//Second col
if(ExAd_SB_Allow_FPS)then{
	_cbFPS = [_display,_newParent,([_slideClass,"cbShowFPS"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop, _cbW, _cbH],"ExAd_SB_Show_FPS = !ExAd_SB_Show_FPS",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowFPS"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_FPS,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbFPS cbSetChecked ExAd_SB_Show_FPS;
};

if(ExAd_SB_Allow_Time)then{
	_cbTime = [_display,_newParent,([_slideClass,"cbShowTime"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 1, _cbW, _cbH],"ExAd_SB_Show_Time = !ExAd_SB_Show_Time",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowTime"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 1, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_TIMER,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbTime cbSetChecked ExAd_SB_Show_Time;
};

if(ExAd_SB_Allow_Temp)then{
	_cbTemp = [_display,_newParent,([_slideClass,"cbShowTemp"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 2, _cbW, _cbH],"ExAd_SB_Show_Temp = !ExAd_SB_Show_Temp",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowTemp"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 2, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_TEMP,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbTemp cbSetChecked ExAd_SB_Show_Temp;
};

if(ExAd_SB_Allow_Grid)then{
	_cbGrid = [_display,_newParent,([_slideClass,"cbShowGrid"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 3, _cbW, _cbH],"ExAd_SB_Show_Grid = !ExAd_SB_Show_Grid",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowGrid"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 3, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_GRID,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbGrid cbSetChecked ExAd_SB_Show_Grid;
};

if(ExAd_SB_Allow_Compass)then{
	_cbCompass = [_display,_newParent,([_slideClass,"cbShowCompass"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 4, _cbW, _cbH],"ExAd_SB_Show_Compass = !ExAd_SB_Show_Compass",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowCompass"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 4, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_COMPASS,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbCompass cbSetChecked ExAd_SB_Show_Compass;
};

if(ExAd_SB_Allow_PlayerCount)then{
	_cbPlayers = [_display,_newParent,([_slideClass,"cbShowPlayers"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 5, _cbW, _cbH],"ExAd_SB_Show_PlayerCount = !ExAd_SB_Show_PlayerCount",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowPlayers"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 5, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_PLAYERS,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbPlayers cbSetChecked ExAd_SB_Show_PlayerCount;
};

if(ExAd_SB_Allow_ClanCount)then{
	_cbClan = [_display,_newParent,([_slideClass,"cbShowClan"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 6, _cbW, _cbH],"ExAd_SB_Show_ClanCount = !ExAd_SB_Show_ClanCount",""] call ExAd_fnc_createCheckBox;
	[_display,_newParent,([_slideClass,"strTxtShowClan"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 6, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_CLAN_MEMBERS,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
	_cbClan cbSetChecked ExAd_SB_Show_ClanCount;
};

_cbHUD = [_display,_newParent,([_slideClass,"cbShowHUD"] call ExAd_fnc_getNextIDC),[_rightCol, _cbCompTop + _rowH * 7, _cbW, _cbH],"ExAd_SB_EXILE_HUD_ACTIVE = !ExAd_SB_EXILE_HUD_ACTIVE;call ExAd_fnc_toggleExileHUD",""] call ExAd_fnc_createCheckBox;
[_display,_newParent,([_slideClass,"strTxtShowHUD"] call ExAd_fnc_getNextIDC),[_rightCbStr, _cbCompTop + _rowH * 7, _cbStrW, _rowH],STR_ExAd_SB_APP_CB_HIDE_EXILE_SB,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;


_cbColor cbSetChecked ExAd_SB_COMPONENTS_ACTIVE_COLORS;
_cbHUD cbSetChecked !ExAd_SB_EXILE_HUD_ACTIVE;


//Setup sliders
_cbW = _cbW + 0.5 * _pW; _scale = 0.5; _margin = (_rowH * _scale / 2); _bgCompTop = _cbCompTop + _rowH * 9;
[_display,_newParent,([_slideClass,"strTxtTitleBgColor"] call ExAd_fnc_getNextIDC),[_leftCol, _bgCompTop, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_BG_COLOR,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;

[_display,_newParent,([_slideClass,"strTxtSliderR"] call ExAd_fnc_getNextIDC),[_leftCol, _bgCompTop + _rowH * 1, _cbW, _cbH],"R",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderR = [_display,_newParent,([_slideClass,"sliderR"] call ExAd_fnc_getNextIDC),[_cbStr, _bgCompTop + _rowH * 1 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderG"] call ExAd_fnc_getNextIDC),[_leftCol, _bgCompTop + _rowH * 2, _cbW, _cbH],"G",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderG = [_display,_newParent,([_slideClass,"sliderG"] call ExAd_fnc_getNextIDC),[_cbStr, _bgCompTop + _rowH * 2 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderB"] call ExAd_fnc_getNextIDC),[_leftCol, _bgCompTop + _rowH * 3, _cbW, _cbH],"B",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderB = [_display,_newParent,([_slideClass,"sliderB"] call ExAd_fnc_getNextIDC),[_cbStr, _bgCompTop + _rowH * 3 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderA"] call ExAd_fnc_getNextIDC),[_leftCol, _bgCompTop + _rowH * 4, _cbW, _cbH],"A",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderA = [_display,_newParent,([_slideClass,"sliderA"] call ExAd_fnc_getNextIDC),[_cbStr, _bgCompTop + _rowH * 4 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;


[_display,_newParent,([_slideClass,"strTxtTitlePos"] call ExAd_fnc_getNextIDC),[_rightCol, _bgCompTop, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_POS_SIZE,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;

[_display,_newParent,([_slideClass,"strTxtSliderX"] call ExAd_fnc_getNextIDC),[_rightCol, _bgCompTop + _rowH * 1, _cbW, _cbH],"X",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderX = [_display,_newParent,([_slideClass,"sliderX"] call ExAd_fnc_getNextIDC),[_rightCbStr, _bgCompTop + _rowH * 1 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderY"] call ExAd_fnc_getNextIDC),[_rightCol, _bgCompTop + _rowH * 2, _cbW, _cbH],"Y",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderY = [_display,_newParent,([_slideClass,"sliderY"] call ExAd_fnc_getNextIDC),[_rightCbStr, _bgCompTop + _rowH * 2 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderW"] call ExAd_fnc_getNextIDC),[_rightCol, _bgCompTop + _rowH * 3, _cbW, _cbH],"W",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderW = [_display,_newParent,([_slideClass,"sliderW"] call ExAd_fnc_getNextIDC),[_rightCbStr, _bgCompTop + _rowH * 3 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderH"] call ExAd_fnc_getNextIDC),[_rightCol, _bgCompTop + _rowH * 4, _cbW, _cbH],"H",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderH = [_display,_newParent,([_slideClass,"sliderH"] call ExAd_fnc_getNextIDC),[_rightCbStr, _bgCompTop + _rowH * 4 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;


[_sliderR,[0,1],ExAd_SB_GUI_BgColor select 0] call ExAd_fnc_prepareSlider;
[_sliderG,[0,1],ExAd_SB_GUI_BgColor select 1] call ExAd_fnc_prepareSlider;
[_sliderB,[0,1],ExAd_SB_GUI_BgColor select 2] call ExAd_fnc_prepareSlider;
[_sliderA,[0,1],ExAd_SB_GUI_BgColor select 3] call ExAd_fnc_prepareSlider;

_sliderR ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (round ((_this select 1) * 255));ExAd_SB_GUI_BgColor set [0, _this select 1];call ExAd_fnc_updateSB"]]; 
_sliderG ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (round ((_this select 1) * 255));ExAd_SB_GUI_BgColor set [1, _this select 1];call ExAd_fnc_updateSB"]]; 
_sliderB ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (round ((_this select 1) * 255));ExAd_SB_GUI_BgColor set [2, _this select 1];call ExAd_fnc_updateSB"]]; 
_sliderA ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (round ((_this select 1) * 100)) + '%1');ExAd_SB_GUI_BgColor set [3, _this select 1];call ExAd_fnc_updateSB","%"]]; 

[_sliderX,[safeZoneX,safeZoneX + safeZoneW],ExAd_SB_GUI_POS select 0] call ExAd_fnc_prepareSlider;
[_sliderY,[safeZoneY,safeZoneY + safeZoneH],ExAd_SB_GUI_POS select 1] call ExAd_fnc_prepareSlider;
[_sliderW,[0,safeZoneW],ExAd_SB_GUI_POS select 2] call ExAd_fnc_prepareSlider;
[_sliderH,[0,safeZoneH],ExAd_SB_GUI_POS select 3] call ExAd_fnc_prepareSlider;

_sliderX ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (_this select 1);ExAd_SB_GUI_POS set [0, _this select 1];call ExAd_fnc_updateSB","%"]]; 
_sliderY ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (_this select 1);ExAd_SB_GUI_POS set [1, _this select 1];call ExAd_fnc_updateSB","%"]]; 
_sliderW ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (round ((_this select 1) / safeZoneW * 100)) + '%1');ExAd_SB_GUI_POS set [2, _this select 1];call ExAd_fnc_updateSB","%"]]; 
_sliderH ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (round ((_this select 1) / safeZoneH * 100)) + '%1');ExAd_SB_GUI_POS set [3, _this select 1];call ExAd_fnc_updateSB","%"]]; 

//Text Font 
_textCompTop = _bgCompTop + _rowH * 6;
[_display,_newParent,([_slideClass,"strTxtTitleTextFont"] call ExAd_fnc_getNextIDC),[_rightCol, _textCompTop, _leftColW, _rowH],STR_ExAd_SB_APP_COMBO_FONT,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;
_comboFont = [_display,_newParent,([_slideClass,"comboFont"] call ExAd_fnc_getNextIDC),[_rightCol, _textCompTop + _rowH * 1, _cbStrW, _rowH * 0.75],"ExAd_SB_Text_Font = ((_this select 0) lbData (_this select 1))",STR_ExAd_SB_APP_COMBO_TOOLTIP_FONT] call ExAd_fnc_createCombo;
{
	private["_index"];
	_index = _comboFont lbAdd _x;
	_comboFont lbSetData [_index, _x]
}forEach ((configfile >> "CfgFontFamilies") call BIS_fnc_getCfgSubClasses);

for "_i" from 0 to lbSize _comboFont do {
	if((_comboFont lbData _i) isEqualTo ExAd_SB_Text_Font)exitWith{
		_comboFont lbSetCurSel _i;
	}
};

_comboAlign = [_display,_newParent,([_slideClass,"comboAlign"] call ExAd_fnc_getNextIDC),[_rightCol, _textCompTop + _rowH * 2, _cbStrW, _rowH * 0.75],"ExAd_SB_Text_Align = ((_this select 0) lbData (_this select 1))",STR_ExAd_SB_APP_COMBO_TOOLTIP_ALIGN] call ExAd_fnc_createCombo;
{
	private["_index"];
	_index = _comboAlign lbAdd _x;
	_comboAlign lbSetData [_index, _x]
}forEach ["Left","Center","Right"];

for "_i" from 0 to lbSize _comboAlign do {
	if((_comboAlign lbData _i) isEqualTo ExAd_SB_Text_Align)exitWith{
		_comboAlign lbSetCurSel _i;
	}
};

[_display,_newParent,([_slideClass,"strTxtTitleTextColor"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_TEXT_COLOR,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;

[_display,_newParent,([_slideClass,"strTxtSliderFontR"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop + _rowH * 1, _cbW, _cbH],"R",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderFontR = [_display,_newParent,([_slideClass,"sliderFontR"] call ExAd_fnc_getNextIDC),[_cbStr, _textCompTop + _rowH * 1 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderFontG"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop + _rowH * 2, _cbW, _cbH],"G",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderFontG = [_display,_newParent,([_slideClass,"sliderFontG"] call ExAd_fnc_getNextIDC),[_cbStr, _textCompTop + _rowH * 2 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderFontB"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop + _rowH * 3, _cbW, _cbH],"B",_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderFontB = [_display,_newParent,([_slideClass,"sliderFontB"] call ExAd_fnc_getNextIDC),[_cbStr, _textCompTop + _rowH * 3 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtSliderFontA"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop + _rowH * 4, _cbW, _cbH],"A",_cbStrTextFont,_cbS6trTextSize,_cbStrTextColor,_cbStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderFontA = [_display,_newParent,([_slideClass,"sliderFontA"] call ExAd_fnc_getNextIDC),[_cbStr, _textCompTop + _rowH * 4 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtTitleUpdateRate"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop + _rowH * 5, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_UPDATE_RATE,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderUpdateRate = [_display,_newParent,([_slideClass,"sliderUpdateRate"] call ExAd_fnc_getNextIDC),[_cbStr, _textCompTop + _rowH * 6 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtTitleIconSize"] call ExAd_fnc_getNextIDC),[_leftCol, _textCompTop + _rowH * 7, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_IMG_SIZE,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderIconSize = [_display,_newParent,([_slideClass,"sliderIconSize"] call ExAd_fnc_getNextIDC),[_cbStr, _textCompTop + _rowH * 8 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtTitleTextSize"] call ExAd_fnc_getNextIDC),[_rightCol, _textCompTop + _rowH * 3, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_TEXT_SIZE,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderTextSize = [_display,_newParent,([_slideClass,"sliderTextSize"] call ExAd_fnc_getNextIDC),[_rightCbStr, _textCompTop + _rowH * 4 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtTitleTextSize"] call ExAd_fnc_getNextIDC),[_rightCol, _textCompTop + _rowH * 5, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_TEXT_MARGIN,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderTextMargin = [_display,_newParent,([_slideClass,"sliderTextMargin"] call ExAd_fnc_getNextIDC),[_rightCbStr, _textCompTop + _rowH * 6 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;

[_display,_newParent,([_slideClass,"strTxtTitleTextSize"] call ExAd_fnc_getNextIDC),[_rightCol, _textCompTop + _rowH * 7, _leftColW, _rowH],STR_ExAd_SB_APP_SLIDER_TEXT_PADDING,_cbStrTextFont,_cbStrTextSize,_cbStrTextColor,_titleStrAlign,1] call ExAd_fnc_createStructuredText;
_sliderTextPadding = [_display,_newParent,([_slideClass,"sliderTextMargin"] call ExAd_fnc_getNextIDC),[_rightCbStr, _textCompTop + _rowH * 8 + _margin, _cbStrW, _rowH * _scale]] call ExAd_fnc_createXSliderH;


[_sliderFontR,[0,1],ExAd_SB_GUI_TextColor select 0] call ExAd_fnc_prepareSlider;
[_sliderFontG,[0,1],ExAd_SB_GUI_TextColor select 1] call ExAd_fnc_prepareSlider;
[_sliderFontB,[0,1],ExAd_SB_GUI_TextColor select 2] call ExAd_fnc_prepareSlider;
[_sliderFontA,[0,1],ExAd_SB_GUI_TextColor select 3] call ExAd_fnc_prepareSlider;

_sliderFontR ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (round ((_this select 1) * 255));ExAd_SB_GUI_TextColor set [0, _this select 1];call ExAd_fnc_updateSB"]]; 
_sliderFontG ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (round ((_this select 1) * 255));ExAd_SB_GUI_TextColor set [1, _this select 1];call ExAd_fnc_updateSB"]]; 
_sliderFontB ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str (round ((_this select 1) * 255));ExAd_SB_GUI_TextColor set [2, _this select 1];call ExAd_fnc_updateSB"]]; 
_sliderFontA ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (round ((_this select 1) * 100)) + '%1');ExAd_SB_GUI_TextColor set [3, _this select 1];call ExAd_fnc_updateSB", "%"]]; 


[_sliderTextSize,[0,2],ExAd_SB_Text_Size] call ExAd_fnc_prepareSlider;
[_sliderTextMargin,[0,5],count ExAd_SB_Text_Margin] call ExAd_fnc_prepareSlider;
[_sliderTextPadding,[0,5],count ExAd_SB_Text_InnerMargin] call ExAd_fnc_prepareSlider;
[_sliderUpdateRate,[1,60],60 / ExAd_SB_Update_Rate] call ExAd_fnc_prepareSlider;
[_sliderIconSize,[0,2], ExAd_SB_Img_Size] call ExAd_fnc_prepareSlider;

_sliderTextSize ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (round ((_this select 1) * 100)) + '%1');ExAd_SB_Text_Size = _this select 1", "%"]]; 
_sliderTextMargin ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str floor(_this select 1);ExAd_SB_Text_Margin = [_this select 1] call ExAd_fnc_getBlankSpace"]]; 
_sliderTextPadding ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip str floor(_this select 1);ExAd_SB_Text_InnerMargin = [_this select 1] call ExAd_fnc_getBlankSpace"]]; 
_sliderUpdateRate ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (_this select 1) + ' times/min');ExAd_SB_Update_Rate = 60 / (_this select 1);if(ExAd_SB_Active)then{call ExAd_fnc_sbStop; call ExAd_fnc_loadSB;call ExAd_fnc_sbThread}"]]; 
_sliderIconSize ctrlSetEventHandler ["SliderPosChanged", format["(_this select 0) ctrlSetTooltip (str (round ((_this select 1) * 100)) + '%1');ExAd_SB_Img_Size = _this select 1", "%"]]; 


[_display,_newParent,([_slideClass,"btnSave"] call ExAd_fnc_getNextIDC),[_leftCol + (_leftColW / 9), _textCompTop + _rowH * 10, _leftColW / 3, _rowH],"call ExAd_fnc_sbSave","Save"] call ExAd_fnc_createButton;
[_display,_newParent,([_slideClass,"btnOnOff"] call ExAd_fnc_getNextIDC),[_leftCol + (_leftColW / 2) + (_leftColW / 9), _textCompTop + _rowH * 10, _leftColW / 3, _rowH],"_this call ExAd_fnc_sbPowerToggle",(if(!ExAd_SB_Active)then{STR_ExAd_SB_APP_BTN_SHOW}else{STR_ExAd_SB_APP_BTN_HIDE})] call ExAd_fnc_createButton;

true