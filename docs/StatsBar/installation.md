# Installation

Remember for this plugin to work you first need to install  
* [Core](https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)
* [XM8](https://github.com/Bjanski/ExAd/blob/master/docs/xm8/installation.md)
  
## Client

* Place the folder "StatsBar" into "mpmissions\exile.<MAP>\ExAdClient\"  
* Goto "mpmissions\exile.<MAP>\ExAdClient\RscTitles.cpp" and uncomment 
```cpp 
//#include "StatsBar\RscTitles.cpp" 
```
* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

_From_  
```cpp  
        //#include "StatsBar\CfgFunctions.cpp"	 
```  
_To_  
```cpp  
        #include "StatsBar\CfgFunctions.cpp"	
```  

* In "config.cpp" in the mission root folder, add to the following class "CfgXM8"
```js
class CfgXM8
{
	extraApps[] = {"ExAd_SB"};
	
	class ExAd_SB
	{
		title = "Statsbar Settings";
		controlID = 50400;					//IDC:50400 -> 50475 || These need to be unique and out of range from each other
		logo = "exile_assets\texture\ui\xm8_app_settings_ca.paa";
		onLoad = "ExAdClient\XM8\Apps\SB_Settings\onLoad.sqf";
	};
};  
```  
