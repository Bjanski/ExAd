#HaloParachute  
## Instructions:   

## 160510 21:00 . v0.7.5  
###Fixed 
* replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute\postInit.sqf"
* replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute\Functions"
* Replace battleye exceptions - Entities
```cpp
	!="waitUntil {sleep 0.1; ({player distance _x < (10 max (sizeOf typeOf _x))} count (player nearEntities [\"Air\", 20])) == 0};"
```

### 160507 18:00 . v0.7.4  
#### Update
* Replace folder "mpmissions\Exile.<map>\ExAdClient\HaloParachute\Functions"
* Replace file "mpmissions\Exile.<map>\ExAdClient\HaloParachute\CfgFunctions.cpp"
* Replace file "mpmissions\Exile.<map>\ExAdClient\HaloParachute\postInit.sqf"
* Replace, or update manually, file "mpmissions\Exile.<map>\ExAdClient\HaloParachute\customize.sqf"
 
### 160507 16:00 . v0.7.3  
#### Update
* Replace "mpmissions\Exile.<map>\ExAdClient\HaloParachute\postInit.sqf"

### 160429 14:04 . v0.5.1  
#### Update  
* Add battleye exceptions   

### 160425 12:00 . v0.5.0  
#### Full installation