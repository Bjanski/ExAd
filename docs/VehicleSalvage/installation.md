# Installation

Remember for this plugin to work you first need to install  
* [Core]((https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)
  
## Client

* Make sure the VehicleSalvage folder is present in mpmissions\missionname.mapname\ExAdClient

* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

_From_  
```cpp  
        //#include "VehicleSalvage\CfgFunctions.cpp"	 
```  
_To_  
```cpp  
        #include "VehicleSalvage\CfgFunctions.cpp"	
```  

* In "config.cpp" find "CfgInteractionMenus"

* Under CfgInteractionMenus you will see "class Car"

* Add to the bottom of "class Car" menus this: 
			
```cpp
		class ExAdSalvage: ExileAbstractAction
            	{
                title = "<t color='#ff0000'>ExAd Salvage Aircraft</t>";
                condition = "(!(alive (ExileClientInteractionObject)))";
                action = "_this call ExAd_fnc_vehicleSalvage";
		};
```
			
* Make sure it follows the formatting of the rest of the actions.

* Repeat this to add it to "class Air", "class Boat" and "class Tank" if you have it. Vanilla servers do not have "class Tank" so you may need to add it yourself.

ALL DONE! Enjoy :D
