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
private["_display","_exileCtrl","_text"];

disableSerialization;

_display = uiNameSpace getVariable ["RscExileHUD",displayNull];	
_exileCtrl = _display displayCtrl 1300;

_exileCtrl ctrlShow ExAd_SB_EXILE_HUD_ACTIVE;

if(ExAd_SB_EXILE_HUD_ACTIVE)then{
	_hungerLabel = _display displayCtrl 1303;
	_hungerLabel ctrlShow (ExileHudMode isEqualTo 0);
	_hungerValue = _display displayCtrl 1302;
	_hungerValue ctrlShow (ExileHudMode isEqualTo 0);
	_thirstLabel = _display displayCtrl 1305;
	_thirstLabel ctrlShow (ExileHudMode isEqualTo 0); 
	_thirstValue = _display displayCtrl 1304;
	_thirstValue  ctrlShow (ExileHudMode isEqualTo 0);
	_healthLabel = _display displayCtrl 1307;
	_healthLabel ctrlShow (ExileHudMode isEqualTo 1);
	_healthValue = _display displayCtrl 1306;
	_healthValue ctrlShow (ExileHudMode isEqualTo 1);
	_environmentTemperatureLabel = _display displayCtrl 1309;
	_environmentTemperatureLabel ctrlShow (ExileHudMode isEqualTo 2);
	_environmentTemperatureValue = _display displayCtrl 1308;
	_environmentTemperatureValue ctrlShow (ExileHudMode isEqualTo 2);
	_bodyTemperatureLabel = _display displayCtrl 1311;
	_bodyTemperatureLabel ctrlShow (ExileHudMode isEqualTo 2);
	_bodyTemperatureValue = _display displayCtrl 1310;
	_bodyTemperatureValue ctrlShow (ExileHudMode isEqualTo 2);
};

true