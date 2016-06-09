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

ExAd_VG_MIN_ALLOWED_VEH = 5;			//SCALAR - Minimun allowed vehicles in the virtual garage.

ExAd_VG_ALLOWED_VEH_MULTIPLE_FACTOR = 3;//SCALAR - How many extra vehicle slots for each territory level.

ExAd_VG_ACCESS_LEVEL = 1; 				//SCALAR - Lowest level that can access the Virtual Garage --> 1|2|3 -> Pleb|Moderator|Owner.

ExAd_VG_CLEAN_ON_STORE = true;			//BOOLEAN - If vehicle inventory should reset when stored.

ExAd_VG_SHOW_ADVHINT = false; 			//BOOLEAN - If the virtual garage should display an Advanced hint upon store and fetch.

ExAd_VG_ALLOWED_VEH_TYPE = ["Car","Air"];//ARRAY - Array with allowed vehicle types for the virtual garage. | "Car", "Tank", "Helicopter", "Plane" or "Air" for both WARNING DON'T USE "LandVehicle" Can crash the Exile system.  