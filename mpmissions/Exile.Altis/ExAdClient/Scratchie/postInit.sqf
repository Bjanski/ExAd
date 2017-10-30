/*
	postInit.sqf - Scratchie postInit used for ExAd

	Copyright 2017 - ole1986

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

if (isDedicated) exitWith {};

private _code = {
	disableSerialization;

	private _display = uiNameSpace getVariable ["RscExileXM8", displayNull];
    private _ctrl = [_display,"ExAd_Scratchie","InfoTitle"] call ExAd_fnc_getAppCtrl;

	_ctrl ctrlSetStructuredText parseText "Counting Scratchies...";
	sleep 3;
	_ctrl ctrlSetStructuredText parseText (format ["You have <t color='#1ab42e'>%1 Scratchies</t> in your pocket", missionNamespace getVariable ["scratchieCount", 0]]);
};

missionNamespace setVariable ['Scratchie_UpdateCount', _code];

diag_log "Loaded Scratchie postInit";