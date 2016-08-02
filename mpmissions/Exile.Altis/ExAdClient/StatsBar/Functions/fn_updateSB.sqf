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
private ["_display","_statsBarCtrl"];
_display = uiNameSpace getVariable ["ExAd_STATSBAR",displayNull];	
_statsBarCtrl = _display displayCtrl ExAd_SB_Dialog_CtrlBar_IDC;

_statsBarCtrl ctrlSetPosition ExAd_SB_GUI_POS;
_statsBarCtrl ctrlSetBackgroundColor ExAd_SB_GUI_BgColor;
_statsBarCtrl ctrlSetTextColor ExAd_SB_GUI_TextColor;
_statsBarCtrl ctrlCommit 0;	

true