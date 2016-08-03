#<img src="logo.png" alt="ExAd" width="200" />
# Changelog:  

## 160801 17:00 . v0.8.0  
### Fixed
* "ExadClient\CfgFunctions.cpp" to work with StatsBar (Core)
* "ExadClient\RscTitles.cpp" to work with StatsBar (Core)
* Go Back button didn't show text when VG wasn't loaded in the package (Apps; Info, Journal)
* Loading before ExileClientLoadedIn was declared

### Added 
* New plugin - StatsBar (StatsBar)
* New App to configure the StatsBar (XM8)
* New functions (XM8)
* Stringtable compability (StatsBar)

### Removed
* removed all individual changelogs - took to much time to update. 

## 1607330 11:00 . v0.7.11  
### Fixed 
* Modified fn_addApps. (XM8)

### Added 
* New App function , fn_createCombo (XM8)

## 160726 17:15 . v0.7.10  
### Fixed 
* Apply custom functions to "More" app buttons. (XM8)

### Added 
* New App, deploy vehicles (XM8)

## 160720 01:15 . v0.7.9  
### Fixed 
* Some design flaws in the Apps functions. (XM8)
* Added ExAd_Journal class to config.cpp (XM8)

### Added 
* New App, which is a tutorial app on YouTube (XM8)

## 160703 20:15 . v0.7.7  
###Fixed
* Made the ExAd system compatible with Exile 0.9.8 (All)

###Added
* XM8 - a feature to add apps to the XM8 "More" button
* App for XM8 (Virtual Garage)

###Removed
* Support for Improved_XM8_Apps by Vitaly

## 160610 01:20 . v0.7.6  
###Fixed
* Quick-fix - VG App scroll for stored list(Virtual Garage)
* The configuration file could be reed after the postInit script (All) - IMPORTANT TO UPDATE ALL PLUGINS.

###Added
* Extra loggin functionality (All) 
* Progress bar height customizable (Grinding)
* Added a lot of new custom UI Display texts - Check stringtabl.xml for new ones. (All)
* Added vehicle details to VirtualGarage DetailsView (Virtual Garage)
* Added function ExAd_fnc_territoryPlayerPresent, to see if a player with permissions for a specific flag is online (Core)
* Added a feature so the server owner can decide if hacking should require a player with premissions to be online.(Hacking)

## 160510 21:00 . v0.7.5  
###Fixed 
* Syntax error in postInit.sqf (HaloParachute)
* Added battleye exceptions (HaloParachute)

## 160510 18:00 . v0.7.4  
###Fixed 
* Various documentation has been updated. 
  
###Added 
* Some small features for HaloParachute
  
## 160510 16:00 . v0.7.3  
###Fixed   
* Cleaned the code (Hacking)  
* Declaration of un custamized variables (All)  

## 160507 09:00 . v0.7.2  
### Added 
* "docs\core\update.md" & "docs\core\changelog.md"
* "docs\Grinding\update.md" & "docs\Grinding\changelog.md"
* "docs\Hacking\update.md" & "docs\Hacking\changelog.md"
* "docs\HaloParachute\update.md" & "docs\HaloParachute\changelog.md"
* "docs\VirtualGarage\update.md" & "docs\VirtualGarage\changelog.md"

### Deleted  
* "mpmissions\Exile.Altis\ExAdClient\core\update.md" & "mpmissions\Exile.Altis\ExAdClient\core\changelog.md"
* "mpmissions\Exile.Altis\ExAdClient\Grinding\update.md" & "mpmissions\Exile.Altis\ExAdClient\Grinding\changelog.md"
* "mpmissions\Exile.Altis\ExAdClient\Hacking\update.md" & "mpmissions\Exile.Altis\ExAdClient\Hacking\changelog.md"
* "mpmissions\Exile.Altis\ExAdClient\HaloParachute\update.md" & "mpmissions\Exile.Altis\ExAdClient\HaloParachute\changelog.md"
* "mpmissions\Exile.Altis\ExAdClient\VirtualGarage\update.md" & "mpmissions\Exile.Altis\ExAdClient\VirtualGarage\changelog.md"

## 160507 09:00 . v0.7.1  
### Fixed 
* Hacking isn't dependent on VirtualGarage anymore (Hacking)
  
## 160506 09:00 . v0.7.0  
### Fixed 
* Small issue where VG didn't show an advancedHint when storing. (VirtualGarage)

### Added
* New stringtable values (VirtualGarage)
* New customizable values (Core)
Must be implemented for Hacking to work proparly
* Implemented Hacking (Hacking)
* Added battleye Hacking exceptions

## 160505 01:40 . v0.6.1  
### Fixed 
* Display null when entering Virtual Garage from Flag (Virtual Garage)
* Sound error for grinding, tmp fix, sound will work on Chernarus (Grinding)

## 160502 23:15 . v0.6.0  
### Added
* Implemented Grinding
* Added battleye grinding exceptions  

## 160423 14:04 . v0.5.2  
### Fixed  
* Description.ext was wrongly configured (Core) 

## 160426 14:04 . v0.5.1  
### Fixed  
* BattlEye filters been updated  (All)
* VG App return to sideApp on unLoad  (VirtualGarage)
* VG App clear lists before onLoad and content being loaded. (VirtualGarage)
* AdvHint trying to show EXO Logo  (VirtualGarage)
  
### Added
* ExAd Logo.png  (Core)
  
### Deleted
* EXO Logo.png (Core)

## 160426 . v0.5.0  
### Added
* Changelog introduced (All)
* Repo public  (All)
