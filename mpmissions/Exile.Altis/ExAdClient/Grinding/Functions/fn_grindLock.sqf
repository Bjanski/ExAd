/*  
	fn_grindLock.sqf

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
private ["_soundSrc","_ticker"];

if(vehicle player != player)exitWith{false};

ExAd_GRINDING_OBJECT = _this select 0;
ExAd_GRINDING = true;

{
	ExileClientInteractionObject removeAction _x;
}
forEach ExileClientInteractionHandles;

if(isClass(configFile >> "CfgVehicles" >> "Sound_Factory10")) then {
	_soundSrc = createSoundSource ["Sound_Factory10", position ExAd_GRINDING_OBJECT, [], 0];
};
player playActionNow "medicStart";

ExAd_DRAW3D_HANDLER = addMissionEventHandler ["Draw3D", {
	private ["_object","_progress"];
	
	_height = ExAd_GRINDING_PROGRESSBAR_POS;
	
	_object = if(isNil "ExAd_GRINDING_OBJECT")then{ExileClientInteractionObject}else{ExAd_GRINDING_OBJECT};
	_progress = 1 min ((_object getVariable ["ExAd_Grinding_progress", 1]) / ExAd_GRINDING_OBJECT_MAX);
	
	drawLine3D [_object modelToWorld [-0.5, -0.15, _height], _object modelToWorld [0.5, -0.15, _height], [0,0,0,1]];
	drawLine3D [_object modelToWorld [-0.5, -0.15, _height - 0.05], _object modelToWorld [0.5, -0.15, _height - 0.05], [0,0,0,1]];
	drawLine3D [_object modelToWorld [-0.5, 0.15, _height], _object modelToWorld [0.5, 0.15, _height], [0,0,0,1]];
	drawLine3D [_object modelToWorld [-0.5, 0.15, _height - 0.05], _object modelToWorld [0.5, 0.15, _height - 0.05], [0,0,0,1]];
	
	drawLine3D [_object modelToWorld [-0.5, -0.15, _height], _object modelToWorld [-0.5, -0.15, _height - 0.05], [0,0,0,1]];
	drawLine3D [_object modelToWorld [0.5, -0.15, _height], _object modelToWorld [0.5, -0.15, _height - 0.05], [0,0,0,1]];
	drawLine3D [_object modelToWorld [-0.5, 0.15, _height], _object modelToWorld [-0.5, 0.15, _height - 0.05], [0,0,0,1]];
	drawLine3D [_object modelToWorld [0.5, -0.15, _height], _object modelToWorld [0.5, -0.15, _height - 0.05], [0,0,0,1]];

	for "_i" from 1 to 49 do {
		drawLine3D [_object modelToWorld [-0.5, -0.15, _height - (0.001 * _i)], _object modelToWorld [((-0.5) + _progress), -0.15, _height - (0.001 * _i)], [1,0.482,0,1]];	
		drawLine3D [_object modelToWorld [0.5, 0.15, _height - (0.001 * _i)], _object modelToWorld [((0.5) - _progress), 0.15, _height - (0.001 * _i)], [1,0.482,0,1]];

		drawLine3D [_object modelToWorld [0.5, -0.15, _height - (0.001 * _i)], _object modelToWorld [((-0.5) + _progress), -0.15, _height - (0.001 * _i)], [0.55,0.55,0.55,1]];	
		drawLine3D [_object modelToWorld [-0.5, 0.15, _height - (0.001 * _i)], _object modelToWorld [((0.5) - _progress), 0.15, _height - (0.001 * _i)], [0.55,0.55,0.55,1]];
	}
}];

_ticker = 1;
while{(ExAd_GRINDING_OBJECT == ExileClientInteractionObject) && ExAd_GRINDING}do{
	UISleep 1;
	
	if(random[0,50,100] < 1)exitWith{
		player removeItem "Exile_Item_Grinder";
		["ErrorTitleAndText", ["ExAd - Grinding", STR_ExAd_GRINDING_NOTI_BROKE]] call ExileClient_gui_toaster_addTemplateToast;
		false
	};
	
	if!("Exile_Magazine_Battery" in (magazines player))exitWith{
		["ErrorTitleAndText", ["ExAd - Grinding", STR_ExAd_GRINDING_NOTI_EMPTY_BAT]] call ExileClient_gui_toaster_addTemplateToast;
		false
	};
	
	if((_ticker % ExAd_GRINDING_PROGRESS_INTERVALL) == 0)then{
		player removeItem "Exile_Magazine_Battery";
		
		["grindProgress", [netId ExAd_GRINDING_OBJECT]] call ExAd_fnc_serverDispatch;
		["SuccessTitleAndText", ["ExAd - Grinding", STR_ExAd_GRINDING_NOTI_PROGRESS]] call ExileClient_gui_toaster_addTemplateToast;
		
		player playActionNow "medicStart";
	};
	
	if(ExAd_GRINDING_OBJECT getVariable ["ExAd_Grinding_progress", 0] > ExAd_GRINDING_OBJECT_MAX)exitWith{
		UISleep 2;
		["SuccessTitleAndText", ["ExAd - Grinding", STR_ExAd_GRINDING_NOTI_FINISHED]] call ExileClient_gui_toaster_addTemplateToast;
		["grindProgress", [netId ExAd_GRINDING_OBJECT]] call ExAd_fnc_serverDispatch;
	};
	_ticker = _ticker + 1;
};

if(isClass(configFile >> "CfgVehicles" >> "Sound_Factory10")) then {
	deleteVehicle _soundSrc;
};

player playActionNow "medicStop";
removeMissionEventHandler ["Draw3D",ExAd_DRAW3D_HANDLER]; 

ExAd_GRINDING_OBJECT = nil;
ExAd_GRINDING = false;
call ExileClient_gui_interactionMenu_unhook;

true