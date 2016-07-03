# Installation

Remember for this plugin to work you first need to install  
* [Core](https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)
  
## Client

* Place the folder "XM8" into "mpmissions\exile.<MAP>\ExAdClient\"  

* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

_From_  
```cpp  
        //#include "XM8\CfgFunctions.cpp"	 
```  
_To_  
```cpp  
        #include "XM8\CfgFunctions.cpp"	
```  

* In "config.cpp" in the mission root folder, find class CfgExileCustomCode  and add the following row
```js
	ExileClient_gui_xm8_slide = "ExAdClient\XM8\CustomCode\ExileClient_gui_xm8_slide.sqf";
	ExileClient_gui_xm8_show = "ExAdClient\XM8\CustomCode\ExileClient_gui_xm8_show.sqf";  
```  

* In "config.cpp" in the mission root folder, create following class "CfgXM8", e.g. with Virtual Garage app
```js
class CfgXM8
{
	extraApps[] = {"ExAd_VG"};
	
	class ExAd_VG 
	{
		title = "Virtual Garage";
		controlID = 50000;					//IDC:50000 -> 50014
		onLoad = "ExAdClient\XM8\Apps\VG\onLoad.sqf";
		onOpen = "ExAdClient\XM8\Apps\VG\onOpen.sqf";
		onClose = "ExAdClient\XM8\Apps\VG\onClose.sqf";
	};
};  
```  
