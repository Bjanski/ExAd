/*
	fn_showParachute.sqf
  
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
if(vehicle player != player)exitWith{false};

if(backpack player == "B_Parachute")exitWith{false};

_condition = false;

if((getPos player) select 2 > ExAd_ACTION_PARACHUTE_HEIGHT)then{
	_states = [
		"ladderriflestatic",
		"ladderrifledownloop",
		"ladderrifleuploop",
		"laddercivilstatic",
		"laddercivildownloop",
		"ladderciviluploop"
	];
	_condition = !((animationState player) in _states);
};

_condition