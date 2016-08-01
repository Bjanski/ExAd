/*  
	postInit.sqf
	
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

_path = "ExAdClient\StatsBar\customize.sqf";
call compile preprocessFileLineNumbers _path;

if(isNil "ExAd_SB_ICON_BANK")then{ExAd_SB_ICON_BANK = "exile_assets\texture\ui\map_safe_ca.paa";};
if(isNil "ExAd_SB_ICON_CLAN")then{ExAd_SB_ICON_CLAN = "exile_assets\texture\ui\xm8_app_clan_ca.paa";};
if(isNil "ExAd_SB_ICON_COMPASS")then{ExAd_SB_ICON_COMPASS = "ExAdClient\StatsBar\icons\compass.paa";};
if(isNil "ExAd_SB_ICON_GRID")then{ExAd_SB_ICON_GRID = "\a3\ui_f\data\gui\rsc\rscdisplayarsenal\compass_ca.paa";};
if(isNil "ExAd_SB_ICON_HP")then{ExAd_SB_ICON_HP = "exile_assets\texture\ui\xm8_app_health_scanner_ca.paa";};
if(isNil "ExAd_SB_ICON_HUNGER")then{ExAd_SB_ICON_HUNGER = "ExAdClient\StatsBar\icons\hunger.paa";};
if(isNil "ExAd_SB_ICON_PLAYERS")then{ExAd_SB_ICON_PLAYERS = "ExAdClient\StatsBar\icons\players.paa";};
if(isNil "ExAd_SB_ICON_RESPECT")then{ExAd_SB_ICON_RESPECT = "ExAdClient\StatsBar\icons\respect.paa";};
if(isNil "ExAd_SB_ICON_TEMP")then{ExAd_SB_ICON_TEMP = "ExAdClient\StatsBar\icons\thermostat.paa";};
if(isNil "ExAd_SB_ICON_THIRST")then{ExAd_SB_ICON_THIRST = "ExAdClient\StatsBar\icons\thirst.paa";};
if(isNil "ExAd_SB_ICON_TIMER")then{ExAd_SB_ICON_TIMER = "ExAdClient\StatsBar\icons\restart.paa";};
if(isNil "ExAd_SB_ICON_Wallet")then{ExAd_SB_ICON_Wallet = "exile_assets\texture\ui\poptab_ca.paa";};
if(isNil "ExAd_SB_ICON_LOGO")then{ExAd_SB_ICON_LOGO = "";};
	
if(isNil "ExAd_SB_COMPONENTS_COLORS")then{ExAd_SB_COMPONENTS_COLORS = ["#000000", "#440B00","#FE1106","#CA7400","#A9C700","#11BF03"];};

ExAd_SB_Dialog_CtrlBar_IDC = 1100;
ExAd_SB_Dialog_CtrlLogo_IDC = 1000;

ExAd_SB_Update_Rate = profileNamespace getVariable ["ExAd_SB_Update_Rate", 1];
ExAd_SB_Active = profileNamespace getVariable ["ExAd_SB_Active", true];

ExAd_SB_GUI_POS = profileNamespace getVariable ["ExAd_SB_GUI_POS", [safeZoneX, safeZoneY + safeZoneH - 32 * pixelH, safeZoneW, 30 * pixelH]];
ExAd_SB_GUI_TextColor = profileNamespace getVariable ["ExAd_SB_GUI_TextColor", [0,0,0,1]];
ExAd_SB_GUI_BgColor = profileNamespace getVariable ["ExAd_SB_GUI_BgColor", [0.6,0.05,0,1]];

ExAd_SB_Text_Margin = profileNamespace getVariable ["ExAd_SB_Text_Margin", " "];
ExAd_SB_Text_InnerMargin = profileNamespace getVariable ["ExAd_SB_Text_InnerMargin", ""];
ExAd_SB_Text_Font = profileNamespace getVariable ["ExAd_SB_Text_Font", "OrbitronLight"];
ExAd_SB_Text_Align = profileNamespace getVariable ["ExAd_SB_Text_Align", "center"];
ExAd_SB_Text_Size = profileNamespace getVariable ["ExAd_SB_Text_Size", 1];

ExAd_SB_Show_KD = profileNamespace getVariable ["ExAd_SB_Show_KD", true];
ExAd_SB_Show_HP = profileNamespace getVariable ["ExAd_SB_Show_HP", true];
ExAd_SB_Show_Thirst = profileNamespace getVariable ["ExAd_SB_Show_Thirst", true];
ExAd_SB_Show_Hunger = profileNamespace getVariable ["ExAd_SB_Show_Hunger", true];
ExAd_SB_Show_Wallet = profileNamespace getVariable ["ExAd_SB_Show_Wallet", true];
ExAd_SB_Show_Bank = profileNamespace getVariable ["ExAd_SB_Show_Bank", true];
ExAd_SB_Show_Respect = profileNamespace getVariable ["ExAd_SB_Show_Respect", true];
ExAd_SB_Show_FPS = profileNamespace getVariable ["ExAd_SB_Show_FPS", true];
ExAd_SB_Show_Time = profileNamespace getVariable ["ExAd_SB_Show_Time", true];
ExAd_SB_Show_Temp = profileNamespace getVariable ["ExAd_SB_Show_Temp", true];
ExAd_SB_Show_Grid = profileNamespace getVariable ["ExAd_SB_Show_Grid", true];
ExAd_SB_Show_Compass = profileNamespace getVariable ["ExAd_SB_Show_Compass", true];
ExAd_SB_Show_PlayerCount = profileNamespace getVariable ["ExAd_SB_Show_PlayerCount", true];
ExAd_SB_Show_ClanCount = profileNamespace getVariable ["ExAd_SB_Show_ClanCount", true];

ExAd_SB_COMPONENTS_ACTIVE_COLORS = profileNamespace getVariable ["ExAd_SB_COMPONENTS_ACTIVE_COLORS", true];
ExAd_SB_EXILE_HUD_ACTIVE = profileNamespace getVariable ["ExAd_SB_EXILE_HUD_ACTIVE", true];

if(!ExAd_SB_Active)exitWith{false};

[] spawn {
	waituntil {!isnil "bis_fnc_init" && !isNull findDisplay 46 && alive player && ExileClientLoadedIn};

	call ExAd_fnc_loadSB;
	
	if(!ExAd_SB_EXILE_HUD_ACTIVE)then{
		call ExAd_fnc_toggleExileHUD;
	};

};