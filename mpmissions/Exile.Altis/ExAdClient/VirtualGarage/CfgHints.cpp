/*  
	CfgHints.cpp

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

class VGStore
{
	displayName = "Vehicle stored";
	/*displayNameShort = "Your vehicle has been stored and is available through the Virtual Garage interface";*/
	description = "Your vehicle has been stored and is only available through the territory it has been stored at. ";
	image = "ExAdClient\Core\Img\logo.paa";
	noImage = false;
	tip = "";
	arguments[] = {};
};
class VGLoad
{
	displayName = "Vehicle loaded to world";
	description = "%1Your vehicle has been loaded to the world, the pin code is %11";
	image = "ExAdClient\Core\Img\logo.paa";
	noImage = false;
	tip = "";
	arguments[] = {"VGLoad select 0"};
	parameters[] = {"STRING"};
};