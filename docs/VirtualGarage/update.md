#VirtualGarage  
## Instructions:   
 
### v0.7.7 
* Remove XM8_Apps 
* Install [XM8](https://github.com/Bjanski/ExAd/tree/master/docs/XM8)
* Replace "mpmissions\Exile.<map>\ExAdClient\VG"
* Replace and pack "@ExileServer\addons\exad_vg"
* Update "@ExileServer\extDB\sql_custom_v2\exile.ini" ->
```
[loadVehicleIdPage]
SQL1_1 = SELECT id FROM vehicle WHERE deleted_at IS NULL AND territory_id IS NULL LIMIT ?,?
Number Of Inputs = 2
SQL1_INPUTS = 1,2
OUTPUT = 1
```

### v0.7.6 
* Replace or merge "mpmissions\Exile.<map>\ExAdClient\VG\customize.sqf"
* Replace or merge "mpmissions\Exile.<map>\stringtable.xml"
* Replace "mpmissions\Exile.<map>\ExAdClient\VG" - Big update
* Replace "mpmissions\Exile.<map>\XM8_apps\apps\XM8_VG"
* Replace and pack "@ExileServer\addons\exad_vg"  
  
### v0.7.3  
* Replace "mpmissions\Exile.<map>\ExAdClient\VirtualGarage\postInit.sqf"
 
### v0.7.0  
* Copy over the new VirtualGarage Package in "stringtable.xml"  
* Replace and pack "@ExileServer\addons\exad_vg"

 
### v0.6.1  
* Modify config.cpp ("CfgInteractionMenus" >> "Flag")
```cpp
class VG : ExileAbstractAction
{
	title = "Virtual Garage";
	condition = "(([_object, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) >= ExAd_VG_ACCESS_LEVEL";
	action = "[] spawn {[] call ExileClient_gui_xm8_show; UISleep 1; call XM8_VG_checkNearByFlags}";
};
```


### v0.5.1  
* Add battleye exceptions  
* Replace "ExAdClient\VirtualGarage\Functions"
* Replace "ExAdClient\VirtualGarage\CfgHints.cpp"
* Replace "XM8_apps\apps\XM8_VG"
 
### 160428 12:00 . v0.5.0  
* Full installation
