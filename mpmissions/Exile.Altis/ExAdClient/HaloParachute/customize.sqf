/*  
	customize.sqf
	
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

ExAd_HALOPARACHUTE_SAFE_MODE = false;	//BOOLEAN - Force pull parachute when player reaches ExAd_ACTION_PARACHUTE_HEIGHT if they ejected from vehicle
ExAd_HALOPARACHUTE_USE_ACTIONS = true;	//BOOLEAN - Allows player to eject from all vehicles with a pressed key combination 'alt shift x'
ExAd_HALOPARACHUTE_USE_KEY_ACTIONS = true;	//BOOLEAN - Show addActions on the screen

ExAd_ACTION_PARACHUTE_HEIGHT = 10; 		//SCALAR - What is the minimum altitude a player can pull a parachute. |RECOMMENDED 30 meters when safe_mode activated
ExAd_ACTION_EJECT_HEIGHT = 100; 		//SCALAR - What is the minimum altitude a player can Halo/Eject from a vehicle.
