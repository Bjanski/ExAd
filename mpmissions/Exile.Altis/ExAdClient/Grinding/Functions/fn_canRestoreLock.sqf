/*  
	fn_canRestoreLock.sqf

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

(('Exile_Item_Codelock' in (magazines player)) && (ExileClientInteractionObject getVariable ['ExAd_Grinding_progress', 0] > 0) && (ExileClientInteractionObject getVariable ['ExAd_Grinding_progress', 0] < ExAd_GRINDING_OBJECT_MAX))