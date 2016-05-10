#VirtualGarage  
## Instructions:   
 
### 160506 09:00 . v0.7.0  
#### Update 
* Copy over the new VirtualGarage Package in "stringtable.xml"  
* Replace and pack "@ExileServer\addons\exad_vg"

 
### 160505 01:40 . v0.6.1  
#### Update 
* Modify config.cpp ("CfgInteractionMenus" >> "Flag")
```cpp
class VG : ExileAbstractAction
{
	title = "Virtual Garage";
	condition = "(([_object, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) >= ExAd_VG_ACCESS_LEVEL";
	action = "[] spawn {[] call ExileClient_gui_xm8_show; UISleep 1; call XM8_VG_checkNearByFlags}";
};
```


### 160429 14:04 . v0.5.1  
#### Update  
* Add battleye exceptions  
* Replace "ExAdClient\VirtualGarage\Functions"
* Replace "ExAdClient\VirtualGarage\CfgHints.cpp"
* Replace "XM8_apps\apps\XM8_VG"
 
### 160428 12:00 . v0.5.0  
#### Full installation
