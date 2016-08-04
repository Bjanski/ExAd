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

if(isNil "ExAd_SB_ICON_BANK")then{ExAd_SB_ICON_BANK = "ExAdClient\StatsBar\Icons\ExAd_Bank.paa";};
if(isNil "ExAd_SB_ICON_CLAN")then{ExAd_SB_ICON_CLAN = "ExAdClient\StatsBar\Icons\ExAd_Family.paa";};
if(isNil "ExAd_SB_ICON_COMPASS")then{ExAd_SB_ICON_COMPASS = "ExAdClient\StatsBar\Icons\ExAd_Compass.paa";};
if(isNil "ExAd_SB_ICON_GRID")then{ExAd_SB_ICON_GRID = "ExAdClient\StatsBar\Icons\ExAd_Grid.paa";};
if(isNil "ExAd_SB_ICON_HP")then{ExAd_SB_ICON_HP = "ExAdClient\StatsBar\Icons\ExAd_Health.paa";};
if(isNil "ExAd_SB_ICON_HUNGER")then{ExAd_SB_ICON_HUNGER = "ExAdClient\StatsBar\Icons\ExAd_Hunger.paa";};
if(isNil "ExAd_SB_ICON_KD")then{ExAd_SB_ICON_KD = "ExAdClient\StatsBar\Icons\ExAd_KD.paa";};
if(isNil "ExAd_SB_ICON_PLAYERS")then{ExAd_SB_ICON_PLAYERS = "ExAdClient\StatsBar\Icons\ExAd_Players.paa";};
if(isNil "ExAd_SB_ICON_RESPECT")then{ExAd_SB_ICON_RESPECT = "ExAdClient\StatsBar\Icons\ExAd_Respect.paa";};
if(isNil "ExAd_SB_ICON_TEMP")then{ExAd_SB_ICON_TEMP = "ExAdClient\StatsBar\Icons\ExAd_Temp.paa";};
if(isNil "ExAd_SB_ICON_THIRST")then{ExAd_SB_ICON_THIRST = "ExAdClient\StatsBar\Icons\ExAd_Thirst.paa";};
if(isNil "ExAd_SB_ICON_TIMER")then{ExAd_SB_ICON_TIMER = "ExAdClient\StatsBar\Icons\ExAd_Restart.paa";};
if(isNil "ExAd_SB_ICON_Wallet")then{ExAd_SB_ICON_Wallet = "ExAdClient\StatsBar\Icons\ExAd_Wallet.paa";};
if(isNil "ExAd_SB_ICON_LOGO")then{ExAd_SB_ICON_LOGO = "ExAdClient\Core\Img\ExAd_logo_128.paa";};

if(isNil "ExAd_SB_GUI_POS_Default")then{ExAd_SB_GUI_POS_Default = 	[safeZoneX, safeZoneY + safeZoneH - 32 * pixelH, safeZoneW, 30 * pixelH];};
if(isNil "ExAd_SB_GUI_TextColor_Default")then{ExAd_SB_GUI_TextColor_Default = [1,1,1,1];};
if(isNil "ExAd_SB_GUI_BgColor_Default")then{ExAd_SB_GUI_BgColor_Default = [0,0,0,0];};

if(isNil "ExAd_SB_Text_Margin_Default")then{ExAd_SB_Text_Margin_Default = " ";};
if(isNil "ExAd_SB_Text_InnerMargin_Default")then{ExAd_SB_Text_InnerMargin_Default = "";};
if(isNil "ExAd_SB_Text_Font_Default")then{ExAd_SB_Text_Font_Default = "OrbitronLight";};
if(isNil "ExAd_SB_Text_Align_Default")then{ExAd_SB_Text_Align_Default = "center";};
if(isNil "ExAd_SB_Text_Size_Default")then{ExAd_SB_Text_Size_Default = 1;};
if(isNil "ExAd_SB_Img_Size_Default")then{ExAd_SB_Img_Size_Default = 1;};

if(isNil "ExAd_SB_Timer")then{ExAd_SB_Timer = 3;};

if(isNil "ExAd_SB_Show_KD_Default")then{ExAd_SB_Show_KD_Default = false;};
if(isNil "ExAd_SB_Show_HP_Default")then{ExAd_SB_Show_HP_Default = true;};
if(isNil "ExAd_SB_Show_Thirst_Default")then{ExAd_SB_Show_Thirst_Default = false;};
if(isNil "ExAd_SB_Show_Hunger_Default")then{ExAd_SB_Show_Hunger_Default = false;};
if(isNil "ExAd_SB_Show_Wallet_Default")then{ExAd_SB_Show_Wallet_Default = true;};
if(isNil "ExAd_SB_Show_Bank_Default")then{ExAd_SB_Show_Bank_Default = false;};
if(isNil "ExAd_SB_Show_Respect_Default")then{ExAd_SB_Show_Respect_Default = false;};
if(isNil "ExAd_SB_Show_FPS_Default")then{ExAd_SB_Show_FPS_Default = true;};
if(isNil "ExAd_SB_Show_Time_Default")then{ExAd_SB_Show_Time_Default = true;};
if(isNil "ExAd_SB_Show_Temp_Default")then{ExAd_SB_Show_Temp_Default = true;};
if(isNil "ExAd_SB_Show_Grid_Default")then{ExAd_SB_Show_Grid_Default = true;};
if(isNil "ExAd_SB_Show_Compass_Default")then{ExAd_SB_Show_Compass_Default = true;};
if(isNil "ExAd_SB_Show_PlayerCount_Default")then{ExAd_SB_Show_PlayerCount_Default = true;};
if(isNil "ExAd_SB_Show_ClanCount_Default")then{ExAd_SB_Show_ClanCount_Default = false;};


if(isNil "ExAd_SB_COMPONENTS_COLORS")then{ExAd_SB_COMPONENTS_COLORS = ["#000000", "#440B00","#FE1106","#CA7400","#A9C700","#11BF03"];};
if(isNil "ExAd_SB_Dialog_Layer")then{ExAd_SB_Dialog_Layer = 102;};
if(isNil "ExAd_SB_Dialog_CtrlLogo_IDC")then{ExAd_SB_Dialog_CtrlLogo_IDC = 1000;};
if(isNil "ExAd_SB_Dialog_CtrlBar_IDC")then{ExAd_SB_Dialog_CtrlBar_IDC = 1100;};

{
	_x call ExAd_fnc_localize;
}forEach [
	["STR_ExAd_SB_APP_GO_BACK", "Go Back"],
	["STR_ExAd_SB_APP_CB_KD", "Kill/Death Ratio"],
	["STR_ExAd_SB_APP_CB_HP", "Health"],
	["STR_ExAd_SB_APP_CB_THIRST", "Thirst"],
	["STR_ExAd_SB_APP_CB_HUNGER", "Hunger"],
	["STR_ExAd_SB_APP_CB_WALLET", "POP TABS in wallet"],
	["STR_ExAd_SB_APP_CB_BANK", "POP TABS in bank"],
	["STR_ExAd_SB_APP_CB_RESPECT", "Respect"],
	["STR_ExAd_SB_APP_CB_COLORS", "Use color indications"],
	["STR_ExAd_SB_APP_CB_FPS", "FPS"],
	["STR_ExAd_SB_APP_CB_TIMER", "Restart time"],
	["STR_ExAd_SB_APP_CB_TEMP", "Body Temperature"],
	["STR_ExAd_SB_APP_CB_GRID", "Grid location"],
	["STR_ExAd_SB_APP_CB_COMPASS", "Compass"],
	["STR_ExAd_SB_APP_CB_PLAYERS", "Players online"],
	["STR_ExAd_SB_APP_CB_CLAN_MEMBERS", "Family members online"],
	["STR_ExAd_SB_APP_CB_HIDE_EXILE_SB", "Hide Exile Status bar"],
	["STR_ExAd_SB_APP_SLIDER_BG_COLOR", "Background Color"],
	["STR_ExAd_SB_APP_SLIDER_POS_SIZE", "Position/Size"],
	["STR_ExAd_SB_APP_COMBO_FONT", "Font"],
	["STR_ExAd_SB_APP_COMBO_TOOLTIP_FONT", "Font"],
	["STR_ExAd_SB_APP_COMBO_TOOLTIP_ALIGN", "Align"],
	["STR_ExAd_SB_APP_SLIDER_TEXT_COLOR", "Text Color"],
	["STR_ExAd_SB_APP_SLIDER_UPDATE_RATE", "Update Rate"],
	["STR_ExAd_SB_APP_SLIDER_TEXT_SIZE", "Text Size"],
	["STR_ExAd_SB_APP_SLIDER_TEXT_MARGIN", "Margin"],
	["STR_ExAd_SB_APP_SLIDER_TEXT_PADDING", "Padding"],
	["STR_ExAd_SB_APP_SLIDER_IMG_SIZE", "Image Size"],
	["STR_ExAd_SB_APP_BTN_SHOW", "Show"],
	["STR_ExAd_SB_APP_BTN_HIDE", "Hide"]
];
	


ExAd_SB_Update_Rate = profileNamespace getVariable ["ExAd_SB_Update_Rate", 1];
ExAd_SB_Active = profileNamespace getVariable ["ExAd_SB_Active", true];

ExAd_SB_GUI_POS = profileNamespace getVariable ["ExAd_SB_GUI_POS", ExAd_SB_GUI_POS_Default];
ExAd_SB_GUI_TextColor = profileNamespace getVariable ["ExAd_SB_GUI_TextColor", ExAd_SB_GUI_TextColor_Default];
ExAd_SB_GUI_BgColor = profileNamespace getVariable ["ExAd_SB_GUI_BgColor", ExAd_SB_GUI_BgColor_Default];

ExAd_SB_Text_Margin = profileNamespace getVariable ["ExAd_SB_Text_Margin", ExAd_SB_Text_Margin_Default];
ExAd_SB_Text_InnerMargin = profileNamespace getVariable ["ExAd_SB_Text_InnerMargin", ExAd_SB_Text_InnerMargin_Default];
ExAd_SB_Text_Font = profileNamespace getVariable ["ExAd_SB_Text_Font", ExAd_SB_Text_Font_Default];
ExAd_SB_Text_Align = profileNamespace getVariable ["ExAd_SB_Text_Align", ExAd_SB_Text_Align_Default];
ExAd_SB_Text_Size = profileNamespace getVariable ["ExAd_SB_Text_Size", ExAd_SB_Text_Size_Default];
ExAd_SB_Img_Size = profileNamespace getVariable ["ExAd_SB_Img_Size", ExAd_SB_Img_Size_Default];

ExAd_SB_Show_KD = profileNamespace getVariable ["ExAd_SB_Show_KD", ExAd_SB_Show_KD_Default];
ExAd_SB_Show_HP = profileNamespace getVariable ["ExAd_SB_Show_HP", ExAd_SB_Show_HP_Default];
ExAd_SB_Show_Thirst = profileNamespace getVariable ["ExAd_SB_Show_Thirst", ExAd_SB_Show_Thirst_Default];
ExAd_SB_Show_Hunger = profileNamespace getVariable ["ExAd_SB_Show_Hunger", ExAd_SB_Show_Hunger_Default];
ExAd_SB_Show_Wallet = profileNamespace getVariable ["ExAd_SB_Show_Wallet", ExAd_SB_Show_Wallet_Default];
ExAd_SB_Show_Bank = profileNamespace getVariable ["ExAd_SB_Show_Bank", ExAd_SB_Show_Bank_Default];
ExAd_SB_Show_Respect = profileNamespace getVariable ["ExAd_SB_Show_Respect", ExAd_SB_Show_Respect_Default];
ExAd_SB_Show_FPS = profileNamespace getVariable ["ExAd_SB_Show_FPS", ExAd_SB_Show_FPS_Default];
ExAd_SB_Show_Time = profileNamespace getVariable ["ExAd_SB_Show_Time", ExAd_SB_Show_Time_Default];
ExAd_SB_Show_Temp = profileNamespace getVariable ["ExAd_SB_Show_Temp", ExAd_SB_Show_Temp_Default];
ExAd_SB_Show_Grid = profileNamespace getVariable ["ExAd_SB_Show_Grid", ExAd_SB_Show_Grid_Default];
ExAd_SB_Show_Compass = profileNamespace getVariable ["ExAd_SB_Show_Compass", ExAd_SB_Show_Compass_Default];
ExAd_SB_Show_PlayerCount = profileNamespace getVariable ["ExAd_SB_Show_PlayerCount", ExAd_SB_Show_PlayerCount_Default];
ExAd_SB_Show_ClanCount = profileNamespace getVariable ["ExAd_SB_Show_ClanCount", ExAd_SB_Show_ClanCount_Default];

ExAd_SB_COMPONENTS_ACTIVE_COLORS = profileNamespace getVariable ["ExAd_SB_COMPONENTS_ACTIVE_COLORS", true];
ExAd_SB_EXILE_HUD_ACTIVE = profileNamespace getVariable ["ExAd_SB_EXILE_HUD_ACTIVE", true];

if(!ExAd_SB_Active)exitWith{false};

[] spawn {
	waituntil { !isnil "bis_fnc_init" && !isNull findDisplay 46 && alive player && !isNil "ExileClientLoadedIn" };
	waitUntil { ExileClientLoadedIn };

	call ExAd_fnc_loadSB;
	
	if(!ExAd_SB_EXILE_HUD_ACTIVE)then{
		call ExAd_fnc_toggleExileHUD;
	};

};