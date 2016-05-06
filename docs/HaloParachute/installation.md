# Installation

* Remember for this plugin to work you first need to install [Core](https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)  
  
## Client

* Place the folder "HaloParachute" into "mpmissions\exile.<MAP>\ExAd\"
* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

From
```cpp
        //#include "HaloParachute\CfgFunctions.cpp"	
```
To
```cpp
        #include "HaloParachute\CfgFunctions.cpp"	
```

* Modify - "mpmissions\exile.<MAP>\stringtable.xml" - add if missing package="HaloParachute" and change to desirable notifications

* Now you can go into "mpmissions\exile.<MAP>\ExAdClient\HaloParachute\customize.sqf" and change to desirable settings.

## Server 

No installation needed.
