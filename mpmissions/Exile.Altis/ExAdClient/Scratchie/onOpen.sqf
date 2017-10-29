private ["_flags","_flag"];

try
{
	_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
	if(isNull _display)exitWith{
		throw "XM8 not loaded!";
	};

	diag_log "Opening Scratchies slide";

	[] spawn Scratchie_UpdateCount;
}
catch
{
	["ErrorTitleAndText", ["ExAd - Scratchies", _exception]] call ExileClient_gui_toaster_addTemplateToast;
	["extraApps", 1] call ExileClient_gui_xm8_slide
}