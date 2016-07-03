/*  
	fn_restoreLock.sqf
	
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
params["_object"];

if(vehicle player != player)exitWith{false};

call ExileClient_gui_interactionMenu_unhook;
player playActionNow "medic";

UISleep 5;
player removeItem "Exile_Item_Codelock";
["SuccessTitleAndText", ["ExAd - Grinding", STR_ExAd_GRINDING_NOTI_RESTORED]] call ExileClient_gui_toaster_addTemplateToast;

["restoreLock", [netId _object]] call ExAd_fnc_serverDispatch;

call ExileClient_gui_interactionMenu_unhook;

true