ExAd_journal_fnc_addNote = {
	params["_listCtrl","_editCtrl", "_text"];

	_text = ctrlText _editCtrl;

	if(count _text == 0)exitWith{
		["ErrorTitleAndText", ["ExAd - Journal", "Nothing to save, write something first!!"]] call ExileClient_gui_toaster_addTemplateToast;
	};

	_index = lbAdd [_listCtrl, _text];
	lbSetTooltip [_listCtrl, _index, _text];

	ctrlSetText [_editCtrl, ""];

	[_listCtrl] call ExAd_journal_fnc_updateDB;
};

ExAd_journal_fnc_removeNote = {
	params["_listCtrl"];

	_index = lbCurSel _listCtrl;

	if(_index == -1)exitWith{
		["ErrorTitleAndText", ["ExAd - Journal", "Select a note to remove!!"]] call ExileClient_gui_toaster_addTemplateToast;
	};

	lbDelete [_listCtrl, _index];

	[_listCtrl] call ExAd_journal_fnc_updateDB;
};

ExAd_journal_fnc_updateDB = {
	params["_listCtrl"];

	_notes = [];
	for "_i" from 0 to (lbSize _listCtrl) -1 do {
		_notes pushBack (lbText [_listCtrl, _i])
	};

	profileNamespace setVariable ["ExAd_Journal_Notes",_notes];
};