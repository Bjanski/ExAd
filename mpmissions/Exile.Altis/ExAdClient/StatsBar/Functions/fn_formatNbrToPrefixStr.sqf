/*  
	fn_formatNbrToPrefixStr.sqf
	
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
params [["_nbr", 0, [0]], ["_response", ""], ["_prefix", ""]];

_prefix = if( _nbr >= 1000 ) then { if( _nbr >= 1000000 ) then {_nbr = _nbr / 1000000; "M" } else {_nbr = _nbr / 1000; "K" } }else{ "" };

format["%1%2", floor _nbr, _prefix]