/*  
	fn_sbThread.sqf
	
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
private["_display","_statsBarCtrl","_text"];

disableSerialization;

_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
_statsBarCtrl = _display displayCtrl ExAd_SB_Dialog_CtrlBar_IDC;

_text = format[
	"<t align='%2' shadow='0' valign='middle' font='%1' size='%3'>%4%5%6%7%8%9%10%11%12%13%14%15%16%17%18%4</t>",
	ExAd_SB_Text_Font,
	ExAd_SB_Text_Align,
	ExAd_SB_Text_Size,
	ExAd_SB_Text_Margin,
	(if(ExAd_SB_Show_KD)then{call ExAd_fnc_getKDStr}else{""}),
	(if(ExAd_SB_Show_HP)then{call ExAd_fnc_getHPStr}else{""}),
	(if(ExAd_SB_Show_Thirst)then{call ExAd_fnc_getThirstStr}else{""}),
	(if(ExAd_SB_Show_Hunger)then{call ExAd_fnc_getHungerStr}else{""}),
	(if(ExAd_SB_Show_Wallet)then{call ExAd_fnc_getWalletStr}else{""}),
	(if(ExAd_SB_Show_Bank)then{call ExAd_fnc_getBankStr}else{""}),
	(if(ExAd_SB_Show_Respect)then{call ExAd_fnc_getRespectStr}else{""}),
	(if(ExAd_SB_Show_FPS)then{call ExAd_fnc_getFPSStr}else{""}),
	(if(ExAd_SB_Show_Time)then{call ExAd_fnc_getTimerStr}else{""}),
	(if(ExAd_SB_Show_Temp)then{call ExAd_fnc_getTempStr}else{""}),
	(if(ExAd_SB_Show_Grid)then{call ExAd_fnc_getGridStr}else{""}),
	(if(ExAd_SB_Show_Compass)then{call ExAd_fnc_getCompassStr}else{""}),
	(if(ExAd_SB_Show_PlayerCount)then{call ExAd_fnc_getPlayersStr}else{""}),
	(if(ExAd_SB_Show_ClanCount)then{call ExAd_fnc_getClanStr}else{""})
];

_statsBarCtrl ctrlSetStructuredText parseText _text;

true