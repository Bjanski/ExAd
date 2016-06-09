#HaloParachute  
## Instructions:   

### v0.7.6 
* Replace or merge "mpmissions\Exile.<map>\ExAdClient\HaloParachute\customize.sqf"
* Replace or merge "mpmissions\Exile.<map>\stringtable.xml"
* Replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute" - Big update  

## v0.7.5
* replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute\postInit.sqf"
* replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute\Functions"
* Replace battleye exceptions - Entities
```cpp
	!="waitUntil {sleep 0.1; ({player distance _x < (10 max (sizeOf typeOf _x))} count (player nearEntities [\"Air\", 20])) == 0};"
```

### v0.7.4 
* Replace folder "mpmissions\Exile.<map>\ExAdClient\HaloParachute\Functions"
* Replace file "mpmissions\Exile.<map>\ExAdClient\HaloParachute\CfgFunctions.cpp"
* Replace file "mpmissions\Exile.<map>\ExAdClient\HaloParachute\postInit.sqf"
* Replace, or update manually, file "mpmissions\Exile.<map>\ExAdClient\HaloParachute\customize.sqf"
 
### v0.7.3  
* Replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute\postInit.sqf"

### v0.5.1  
* Add battleye exceptions   

### v0.5.0  
* Full installation