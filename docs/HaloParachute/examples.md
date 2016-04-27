#Examples

Below I provide with some examples of how to use HaloParachute

##Change settings 

Customize settings to allow different scenarios.
* Allow vehicle ejection
```sqf
	ExAd_ACTION_EJECT_HEIGHT = 0;
```  
* Enable safeMode - makes the parachute auto pull itself when reaching ExAd_ACTION_PARACHUTE_HEIGHT
```sqf
	ExAd_HALOPARACHUTE_SAFE_MODE = true;
```  
* Enable parachute Detach - makes it possible to detach the parachute
```sqf
	ExAd_HALOPARACHUTE_DETACH_PARACHUTE_MODE = true;
```  
##Change defined notification texts
Customizing stringtable.xml allows you to easily change defined texts or add language support.
* Change detach message in stringtable.xml.
```sqf
	<Key ID="STR_ExAd_HALOPARACHUTE_INFO_DETACH">
		<Original>You can eject from parachute with: Alt Shift x</Original>
	</Key>
```