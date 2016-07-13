# Installation

Remember for this plugin to work you first need to install  
* [Core](https://github.com/Bjanski/ExAd/blob/master/docs/core/installation.md)  
* [XM8](https://github.com/Bjanski/ExAd/blob/master/docs/XM8/installation.md)
  
## Client

* Place the folder "VirtualGarage" into "mpmissions\exile.<MAP>\ExAdClient\"  

* Goto "mpmissions\exile.<MAP>\ExAdClient\CfgFunctions" and uncomment  

_From_  
```cpp  
        //#include "VirtualGarage\CfgFunctions.cpp"	 
```  
_To_  
```cpp  
        #include "VirtualGarage\CfgFunctions.cpp"	
```  
* Repeat last step for "CfgHints"  

* In "config.cpp" in the mission root folder, find class CfgExileCustomCode  and add the following row
```js
	ExileServer_system_territory_database_load = "ExAdClient\VirtualGarage\CustomCode\ExileServer_system_territory_database_load.sqf";  
```
* In "config.cpp" you can also add the ("CfgInteractionMenus" >> "Flag" >> "VG") class if you want to be able to fast load the app through your flag pole.  

* Modify - "mpmissions\exile.<MAP>\stringtable.xml" - add if missing package="VirtualGarage" and change to desirable notifications

* Now you can go into "mpmissions\exile.<MAP>\ExAdClient\VirtualGarage\customize.sqf" and change to desirable settings.

### XM8 App

* Copy over "ExileClient\XM8\Apps\VG"  
* Add ("CfgXM8" >> "Exad_VG") to "mpmissions\exile.<MAP>\config.cpp"
```
class CfgXM8
{
	extraApps[] = {"ExAd_VG"};
	
	class ExAd_VG 
	{
		title = "Virtual Garage";
		controlID = 50000;					//These need to be unique
		onLoad = "ExAdClient\XM8\Apps\VG\onLoad.sqf";
		onOpen = "ExAdClient\XM8\Apps\VG\onOpen.sqf";
		onClose = "ExAdClient\XM8\Apps\VG\onClose.sqf";
	};
}; 
```

## Server 

* Copy over and pack "@ExileServer\addons\exad_vg" into a pbo.

## Database
* Run the following sql command in you database. 
```sql
	ALTER TABLE `vehicle` ADD `territory_id` INT(11) UNSIGNED NULL DEFAULT NULL;
	ALTER TABLE `vehicle` ADD CONSTRAINT `vehicle_ibfk_2` FOREIGN KEY (`territory_id`) REFERENCES `territory`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;
```

* Copy over content from "@ExileServer\extDB\sql_custom_v2\exile.ini" - Follow the instructions in the file. 
