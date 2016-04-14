# Installation

This is the core package that needs to be installed for all other ExAd plugins/addons to work. 

IMPORTANT!! 
Keep the folder struction att all time when copying over files.

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
* Copy over "Core" from "mpmissions\Exile.Altis\ExAd\Core"

## Server 

* Navigate to "@ExileServer\addons\" 
* Copy "exad_core"
* Pack exad_core into a .pbo file.

