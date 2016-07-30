#Installation Instructions

* Move "DeployVehicle" into your "mpmissions\Exile.Tanoa\ExAdClient\XM8\Apps\" folder. 
* Navigate and open "mpmissions\Exile.Tanoa\config.cpp" insert the classes "PackDeployedVehicle" into appropriate parent classes.
```cpp
class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			class PackDeployedVehicle: ExileAbstractAction
			{
				title = "Pack Vehicle";
				condition = "call ExAd_XM8_DV_fnc_canPack";
				action = "call ExAd_XM8_DV_fnc_pack";
			};
		};
	};
	class Bikes
	{
		targetType = 2;
		target = "Bicycle";

		class Actions
		{
			class PackDeployedVehicle: ExileAbstractAction
			{
				title = "Pack Bike";
				condition = "call ExAd_XM8_DV_fnc_canPack";
				action = "call ExAd_XM8_DV_fnc_pack";
			};
		};
	};
};
```

* Move over and pack exad_dv into "@ExileServer\addons\"
* Add deploy classes into CfgXM8 in "mpmissions\Exile.Tanoa\config.cpp" and add them to the extraApps array; E.g.
```cpp
class CfgXM8
{
	extraApps[] = {"ExAd_Bike","ExAd_Quad"};

	class ExAd_Bike
	{
		title = "Deploy Bike";
		config = "ExadClient\XM8\Apps\DeployVehicle\config.sqf";
		bambiState = 0;
		vehicleClass = "Exile_Bike_MountainBike";
		recipe[] = {{"Exile_Item_ExtensionCord",-1}};
		packable = 1;
		autoCleanUp = 1;
		quickFunction = "['ExAd_Bike'] call ExAd_XM8_DV_fnc_spawnVehicle";
	};
	class ExAd_Quad
	{
		title = "Deploy Quad";
		bambiState = 0;
		vehicleClass = "Exile_Bike_QuadBike_Fia";
		recipe[] = {{"Exile_Item_ExtensionCord",1}};
		packable = 1;
		quickFunction = "['ExAd_Quad'] call ExAd_XM8_DV_fnc_spawnVehicle";
	};
}; 

```
## How to use
Each class added to the CfgXM8 will represent a vehicle possible to deploy and add commit a "More" button to it.
One of the deploy classes needs to include the config script so all needed functions will be prepared and read to memory. 

### Options 
* title = "Deploy Bike"; -- Button title 
* bambiState = 0; -- Bambistate required || 1 = True / 0 = False
* vehicleClass = "Exile_Bike_MountainBike"; -- CfgVehicles class name of desired vehicle
* recipe[] = {
    {"Exile_Item_ExtensionCord",-1}
  }; -- items needed to craft vehicle, first class name then amount (-1 means required but will not be taken from inventory)
* packable = 1; -- Deployed vehicle can be pack again || 1 = True / 0 = False
* autoCleanUp = 1; -- Server monitize crafted vehicles and despawn if idle to long. || 1 = True / 0 = False
* quickFunction = "['ExAd_Bike'] call ExAd_XM8_DV_fnc_spawnVehicle"; -- Function that is binded to the button if slide is not neccessary.
