ExAd_SB_fnc_prepareSlider = {
	params["_ctrl","_range","_pos"];
	_ctrl sliderSetRange _range;
	_ctrl sliderSetSpeed [500, 500];
	_ctrl sliderSetPosition _pos;
};

ExAd_SB_fnc_updateStatsBar = {
	_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
	_statsBarCtrl = _display displayCtrl ExAd_SB_Dialog_CtrlBar_IDC;
	
	_statsBarCtrl ctrlSetPosition ExAd_SB_GUI_POS;
	_statsBarCtrl ctrlSetBackgroundColor ExAd_SB_GUI_BgColor;
	_statsBarCtrl ctrlSetTextColor ExAd_SB_GUI_TextColor;
	_statsBarCtrl ctrlCommit 0;	
};

ExAd_SB_fnc_createSpace = {
	params["_size"];
	_response = "";
	for "_i" from 0 to _size do {
		_response = format["%1 ",_response]
	};
	_response
};

ExAd_SB_fnc_save = {
	profileNamespace setVariable ["ExAd_SB_Update_Rate", ExAd_SB_Update_Rate];
	profileNamespace setVariable ["ExAd_SB_Active", ExAd_SB_Active];

	profileNamespace setVariable ["ExAd_SB_GUI_POS", ExAd_SB_GUI_POS];
	profileNamespace setVariable ["ExAd_SB_GUI_TextColor", ExAd_SB_GUI_TextColor];
	profileNamespace setVariable ["ExAd_SB_GUI_BgColor", ExAd_SB_GUI_BgColor];

	profileNamespace setVariable ["ExAd_SB_Text_Margin", ExAd_SB_Text_Margin];
	profileNamespace setVariable ["ExAd_SB_Text_InnerMargin", ExAd_SB_Text_InnerMargin];
	profileNamespace setVariable ["ExAd_SB_Text_Font", ExAd_SB_Text_Font];
	profileNamespace setVariable ["ExAd_SB_Text_Align", ExAd_SB_Text_Align];
	profileNamespace setVariable ["ExAd_SB_Text_Size", ExAd_SB_Text_Size];

	profileNamespace setVariable ["ExAd_SB_Show_KD", ExAd_SB_Show_KD];
	profileNamespace setVariable ["ExAd_SB_Show_HP", ExAd_SB_Show_HP];
	profileNamespace setVariable ["ExAd_SB_Show_Thirst", ExAd_SB_Show_Thirst];
	profileNamespace setVariable ["ExAd_SB_Show_Hunger", ExAd_SB_Show_Hunger];
	profileNamespace setVariable ["ExAd_SB_Show_Wallet", ExAd_SB_Show_Wallet];
	profileNamespace setVariable ["ExAd_SB_Show_Bank", ExAd_SB_Show_Bank];
	profileNamespace setVariable ["ExAd_SB_Show_Respect", ExAd_SB_Show_Respect];
	profileNamespace setVariable ["ExAd_SB_Show_FPS", ExAd_SB_Show_FPS];
	profileNamespace setVariable ["ExAd_SB_Show_Time", ExAd_SB_Show_Time];
	profileNamespace setVariable ["ExAd_SB_Show_Temp", ExAd_SB_Show_Temp];
	profileNamespace setVariable ["ExAd_SB_Show_Grid", ExAd_SB_Show_Grid];
	profileNamespace setVariable ["ExAd_SB_Show_Compass", ExAd_SB_Show_Compass];
	profileNamespace setVariable ["ExAd_SB_Show_PlayerCount", ExAd_SB_Show_PlayerCount];
	profileNamespace setVariable ["ExAd_SB_Show_ClanCount", ExAd_SB_Show_ClanCount];

	profileNamespace setVariable ["ExAd_SB_COMPONENTS_ACTIVE_COLORS", ExAd_SB_COMPONENTS_ACTIVE_COLORS];
	profileNamespace setVariable ["ExAd_SB_EXILE_HUD_ACTIVE", ExAd_SB_EXILE_HUD_ACTIVE];
};

ExAd_SB_fnc_stop = {
	//101 cutRsc ["Default", "PLAIN", 0];
	101 cutText ["", "PLAIN"];
	[ExAd_SB_Thread] call ExileClient_system_thread_removeTask;
};

ExAd_SB_fnc_powerToggle = {
	if(ExAd_SB_Active)then{
		call ExAd_SB_fnc_stop
	}else{
		call ExAd_fnc_loadSB
	};
	ExAd_SB_Active = !ExAd_SB_Active;
	(_this select 0) ctrlSetText (if(!ExAd_SB_Active)then{"Start"}else{"Stop"});
	call ExAd_SB_fnc_thread;
};