/*  
	onLoad.sqf

	Copyright 2017 ole

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
params["_display","_slide","_idc"];

_pW = 0.025;
_pH = 0.04;
_leftCol = 0;
_leftColW = 10;

_margin = 0.02;

_posX = _margin + _leftCol * _pW;

_slideClass = "ExAd_Scratchie";

// fixing index issue from ExAd_fnc_getNextIDC and ExAd_fnc_getAppCtrl
[_slideClass,"dummy"] call ExAd_fnc_getNextIDC;

[_display,_slide,([_slideClass,"InfoTitle"] call ExAd_fnc_getNextIDC),[_leftCol * _pW, 2.75 * _pH, 20 * _pW, 2 * _pH],"Counting Scratchies...","PuristaMedium",1.2,"#ffffff","left",1] call ExAd_fnc_createStructuredText;
[_display,_slide,([_slideClass,"backButton"] call ExAd_fnc_getNextIDC),[27.6 * _pW, 17.7 * _pH, 6 * _pW, 1 * _pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;','Back'] call ExAd_fnc_createButton;

/* Buy button */
[_display,_slide,([_slideClass,"picBuy"] call ExAd_fnc_getNextIDC),[_posX, 5 * _pH, _leftColW * _pW, 7 * _pH],"ExAdClient\Scratchie\icons\scratchie-buy.paa",[1,1,1,1],false,false,""] call ExAd_fnc_createPicture;
[_display,_slide,([_slideClass,"buyButton"] call ExAd_fnc_getNextIDC),[_posX, 12 * _pH, _leftColW*_pW, 1*_pH],"['buy',ExileClientSessionId, player, ''] remoteExecCall ['ExileServer_lottery_network_request', 2]; [] spawn Scratchie_UpdateCount;",'Buy Scratchie',""] call ExAd_fnc_createButton;

/* Use button */
_posX = _posX + _margin + _leftColW * _pW;
[_display,_slide,([_slideClass,"picUse"] call ExAd_fnc_getNextIDC),[_posX, 5 * _pH, _leftColW * _pW, 7 * _pH],"ExAdClient\Scratchie\icons\scratchie.paa",[1,1,1,1],false,false,""] call ExAd_fnc_createPicture;
[_display,_slide,([_slideClass,"useButton"] call ExAd_fnc_getNextIDC),[_posX, 12 * _pH, _leftColW * _pW, 1 * _pH],"['use',ExileClientSessionId, player, ''] remoteExecCall ['ExileServer_lottery_network_request', 2]; [] spawn Scratchie_UpdateCount;",'Use Scratchie',""] call ExAd_fnc_createButton;

/* Get Prize button */
_posX = _posX + _margin + _leftColW * _pW;
[_display,_slide,([_slideClass,"picPrize"] call ExAd_fnc_getNextIDC),[_posX, 5 * _pH, _leftColW * _pW, 7 * _pH],"ExAdClient\Scratchie\icons\scratchie-prize.paa",[1,1,1,1],false,false,""] call ExAd_fnc_createPicture;
[_display,_slide,([_slideClass,"useButton"] call ExAd_fnc_getNextIDC),[_posX, 12 * _pH, _leftColW * _pW, 1 * _pH],"['get',ExileClientSessionId, player, ''] remoteExecCall ['ExileServer_lottery_network_request', 2];",'Get Prize',""] call ExAd_fnc_createButton;

true