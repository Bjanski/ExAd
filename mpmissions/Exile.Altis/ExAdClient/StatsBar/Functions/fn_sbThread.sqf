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
	(if(ExAd_SB_Show_KD && ExAd_SB_Allow_KD)then{call ExAd_fnc_getKDStr}else{""}),
	(if(ExAd_SB_Show_HP && ExAd_SB_Allow_HP)then{call ExAd_fnc_getHPStr}else{""}),
	(if(ExAd_SB_Show_Thirst && ExAd_SB_Allow_Thirst)then{call ExAd_fnc_getThirstStr}else{""}),
	(if(ExAd_SB_Show_Hunger && ExAd_SB_Allow_Hunger)then{call ExAd_fnc_getHungerStr}else{""}),
	(if(ExAd_SB_Show_Wallet && ExAd_SB_Allow_Wallet)then{call ExAd_fnc_getWalletStr}else{""}),
	(if(ExAd_SB_Show_Bank && ExAd_SB_Allow_Bank)then{call ExAd_fnc_getBankStr}else{""}),
	(if(ExAd_SB_Show_Respect && ExAd_SB_Allow_Respect)then{call ExAd_fnc_getRespectStr}else{""}),
	(if(ExAd_SB_Show_FPS && ExAd_SB_Allow_FPS)then{call ExAd_fnc_getFPSStr}else{""}),
	(if(ExAd_SB_Show_Time && ExAd_SB_Allow_Time)then{call ExAd_fnc_getTimerStr}else{""}),
	(if(ExAd_SB_Show_Temp && ExAd_SB_Allow_Temp)then{call ExAd_fnc_getTempStr}else{""}),
	(if(ExAd_SB_Show_Grid && ExAd_SB_Allow_Grid)then{call ExAd_fnc_getGridStr}else{""}),
	(if(ExAd_SB_Show_Compass && ExAd_SB_Allow_Compass)then{call ExAd_fnc_getCompassStr}else{""}),
	(if(ExAd_SB_Show_PlayerCount && ExAd_SB_Allow_PlayerCount)then{call ExAd_fnc_getPlayersStr}else{""}),
	(if(ExAd_SB_Show_ClanCount && ExAd_SB_Allow_ClanCount)then{call ExAd_fnc_getClanStr}else{""})
];

_statsBarCtrl ctrlSetStructuredText parseText _text;

true