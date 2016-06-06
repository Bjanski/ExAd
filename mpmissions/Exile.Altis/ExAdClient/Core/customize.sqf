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

ExAd_Debug = true; 						//BOOLEAN - If you want the ExAd code to generate debug logs 
Exad_Logging = true;					//BOOLEAN - If you want the ExAd code to generate extra logs. - Requires InfiStar installed 
ExAd_Log_Folder = "ExAd_Logs";			//STRING - The folder ExAd writes logs to. You need to create the defined folder if it doesn't exist. If you don't create it - the DLL won't be able to write any Log files

ExAd_Hint_Title_Color = "#E48A36";		//STRING - Hint message color
ExAd_Hint_Title_Size = 1.5;				//SCALAR - Hint title size
ExAd_Hint_Title_Font = "TahomaB";		//STRING - Hint title font

ExAd_Hint_Msg_Color = "#ffffff";		//STRING - Hint message color
ExAd_Hint_Msg_Size = 1;					//SCALAR - Hint message size
ExAd_Hint_Msg_Font = "TahomaB";			//STRING - Hint message font
