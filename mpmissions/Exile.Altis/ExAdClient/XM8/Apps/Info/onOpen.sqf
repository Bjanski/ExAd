private["_display","_message","_strTxt"];

try
{
	_message = loadFile "ExAdClient\XM8\Apps\Info\message.txt";
	
	if(count _message == 0)exitWith{
		throw "No server info provided";
	};
	
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	if(isNull _display)exitWith{
		throw "No server info provided!";
	};
	
	_strTxt = [_display,"ExAd_Info","strTxt"] call ExAd_fnc_getAppCtrl;
	_strTxt ctrlSetStructuredText parseText format[_message];
	
	_pos = ctrlPosition _strTxt;
	_strTxt ctrlSetPosition [_pos select 0, _pos select 1, _pos select 2, ctrlTextHeight _strTxt];
	_strTxt ctrlcommit 0;
	ctrlSetFocus ([_display,"ExAd_Info","ctrlGrp"] call ExAd_fnc_getAppCtrl);
}
catch
{
	["ErrorTitleAndText", ["ExAd - Server Info", _exception]] call ExileClient_gui_toaster_addTemplateToast;
	["extraApps", 1] call ExileClient_gui_xm8_slide
}