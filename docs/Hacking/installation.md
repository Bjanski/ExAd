# Installation

Remember for this plugin to work you first need to install  
* [Core](https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)
* [(VirtualGarage)](https://github.com/Bjanski/ExAd/blob/master/docs/VirtualGarage/installation.md) - Only necessary if you want to be able to hack it
  
## Client

* Place the folder "Hacking" into "mpmissions\exile.<MAP>\ExAdClient\"  

* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

_From_  
```cpp  
        //#include "Hacking\CfgFunctions.cpp"	 
```  
_To_  
```cpp  
        #include "Hacking\CfgFunctions.cpp"	
```  

* In "config.cpp" find ("CfgInteractionMenus") and add the actions you want used. If you don't want to use a specific action e.g. hacking safe just ignore adding it.  
Available actions are  
	* HackVG -> ("CfgInteractionMenus" >> "Flag" >> "Actions" >> "HackVG")
	* HackSafe -> ("CfgInteractionMenus" >> "Safe" >> "Actions" >> "HackSafe")
	* StopHack -> ("CfgInteractionMenus" >> "Laptop" >> "Actions" >> "StopHack")  
  
Example
```cpp
class Flag
	{
	targetType = 2;
	target = "Exile_Construction_Flag_Static";

	class Actions 
	{
		class HackVG : ExileAbstractAction
		{
			title = "Hack Virtual Garage";
			condition = "call ExAd_fnc_canHackVG";
			action = "_this spawn ExAd_fnc_startHack";
		};
	};
};
```  

* Modify - "mpmissions\exile.<MAP>\stringtable.xml" - add package="Hacking" and change to desirable notifications  

* Now you can go into "mpmissions\exile.<MAP>\ExAdClient\Hacking\customize.sqf" and change to desirable settings.

## Server 

* Copy over and pack "@ExileServer\addons\exad_hacking" into a pbo.
