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

ExAd_GRINDING_PROGRESS_INTERVALL = 60;	//SCALAR - Grinding, interval time measured in seconds.

ExAd_GRINDING_PROGRESS = 30;			//SCALAR - Damage each finished interval will take from the code lock.

ExAd_GRINDING_OBJECT_MAX = 900;			//SCALAR - Code lock sustainability.

ExAd_GRINDING_PROGRESSBAR_POS = "Mid";	//SCALAR/STRING - You can use values between 0.3-2 or using "LOW"|"MID"|"HIGH"

/*
The default values above means that a full succesful grind will take (900 / 30) * 60 = 1800 = 20 minutes
*/