# Introduction

PLEASE NOTE THIS GUIDE ONLY COVERES THE ExAd MISSION FILE INSTALLATION.<br />
THE MISSING SERVER AND DATABASE INSTRUCTION CAN BE FOUND [HERE](https://github.com/ole1986/a3-exile-scratchie/tree/ExAd)

**Requirements**

Please note that the Scratchie plugin has the following ExAd dependencies

* Core
* XM8

**Installation**

* Copy the folder "source\ExAdClient\Scratchie" into "mpmissions\exile.\ExAdClient"

* Open the "mpmissions\exile.\ExAdClient\CfgFunctions.cpp" and add the following line inside `class ExAd`

```
#include "Scratchie\CfgFunctions.cpp"
```

* Amend the `class CfgXM8` from "mpmissions\exile.\config.cpp" the following (to make Scratchie app available in XM8)

```
class CfgXM8 {
    extraApps[] = {"ExAd_Scratchie"};

    class ExAd_Scratchie
	{
		title = "Play Scratchie";
		controlID = 80000;
        logo = "ExAdClient\Scratchie\icons\scratchie.paa";
        onLoad = "ExAdClient\Scratchie\onLoad.sqf";
		onOpen = "ExAdClient\Scratchie\onOpen.sqf";
		onClose = "ExAdClient\Scratchie\onClose.sqf";
	};
}
```

* Customize the "mpmissions\exile.\description.ext" by adding the below line into `class CfgRemoteExec` -> `class Functions`

```
class ExileServer_lottery_network_request { allowedTargets = 2; }
```