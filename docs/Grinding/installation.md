# Installation

Remember for this plugin to work you first need to install  
* [Core]((https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)
  
## Client

* Place the folder "Grinding" into "mpmissions\exile.<MAP>\ExAdClient\"  

* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

_From_  
```cpp  
        //#include "Grinding\CfgFunctions.cpp"	 
```  
_To_  
```cpp  
        #include "Grinding\CfgFunctions.cpp"	
```  

* In "config.cpp" find "CfgInteractionMenus" and add to "Construction".
```cpp
class Construction
	{
	targetType = 2;
	target = "Exile_Construction_Abstract_Static";

	class Actions 
	{
		class Grind : ExileAbstractAction
		{
			title = "Grind Lock";
			condition = "call ExAd_fnc_canGrindLock";
			action = "_this spawn ExAd_fnc_grindLock";
		};
		
		class RestoreLock : ExileAbstractAction
		{
			title = "Restore Lock";
			condition = "_object call ExAd_fnc_canRestoreLock";
			action = "_this spawn ExAd_fnc_restoreLock";
		};
	};
};
```

* Modify - "mpmissions\exile.<MAP>\stringtable.xml" - add package="Grinding" and change to desirable notifications
  
* Now you can go into "mpmissions\exile.<MAP>\ExAdClient\Grinding\customize.sqf" and change to desirable settings.
  
## Server 

* Copy over and pack "@ExileServer\addons\exad_grinding" into a pbo.