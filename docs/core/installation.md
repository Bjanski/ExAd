# Installation

This is the core package that needs to be installed for all other ExAd plugins/addons to work. 

IMPORTANT!! 
Keep the folder structure at all time when copying over files.

## Client
* Copy missionconfig classes from "mpmissions\Exile.Altis\description.ext\" into your own description.ext  
Make sure their is only one appeareance of each Cfg class, e.g.  
  This will break the missionfile
```cpp
class CfgFunctions
{
	#include "ExAdClient\CfgFunctions.cpp"
};

class CfgFunctions
{
	#include "SOMEOTHER_ADDON\CfgFunctions.cpp"
};
```  
  This will work  
```cpp
class CfgFunctions
{
	#include "ExAdClient\CfgFunctions.cpp"
	#include "SOMEOTHER_ADDON\CfgFunctions.cpp"
};
```  
* Copy over "Core" from "mpmissions\Exile.Altis\ExAdClient\"  

* Copy over all files in "mpmissions\Exile.Altis\ExAdClient\"  
These files includes the installation requirements for all other ExAd plugins  
E.g in "mpmissions\Exile.Altis\ExAdClient\CfgFunctions.cpp" you can see that there are alot of lines commented out some of these need to be uncommented for plugins to work. Each plugin will describe more in detail which ones need to be adjusted.  

* Copy over "mpmissions\exile.<MAP>\stringtable.xml"  

## Server 

* Navigate to "@ExileServer\addons\" 
* Copy "exad_core"
* Pack exad_core into a .pbo file.

## BattlEye

I've put all plugins battleye exceptions in "BattlEye"  
Check the files and append appropriate exceptions into your BattlEye files.  

