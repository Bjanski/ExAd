#Documentation  
Each subfolder withholds the subproject's documentation including installation instruction and examples of useage.
  
To simplify the proccess for me, I've decided to simply devide everything and leave a changelog and update instructions in every subprojects documentation folder. This way you won't miss any information related to that subproject and it will be simple for me to keep the track off all changes with out skimming a general changelog. 

## How to Update  
Since this project consist of multiple subprojects I've had some issues deciding how to structure the project for a simple update process. 

#### Problems remember which version you have?
General update for all mods are to 
* Replace plugin specific server files 
* Copy and save plugin specific customization file
* Replace plugin client folder, e.g. "mpmission\Exile.<map>\ExAdClient\HaloParachute"
* Compare old with new customize.sqf file - add extras 
* Replace app specific files if there are any, e.g. for Virtual Garage