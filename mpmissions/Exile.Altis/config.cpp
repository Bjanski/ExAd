class CfgExileCustomCode 
{
	ExileServer_system_territory_database_load = "ExAdClient\VirtualGarage\CustomCode\ExileServer_system_territory_database_load.sqf";
};

class CfgInteractionMenus
{
	class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";
		class Actions
		{
			class VG : ExileAbstractAction
			{
				title = "Virtual Garage";
				condition = "(([_object, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) >= ExAd_VG_ACCESS_LEVEL";
				action = "[] spawn {[] call ExileClient_gui_xm8_show; UISleep 1; call XM8_VG_checkNearByFlags}";
			};
			class HackVG : ExileAbstractAction
			{
				title = "Hack Virtual Garage";
				condition = "call ExAd_fnc_canHackVG";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};
	class Construction
	{
		targetType = 2;
		target = "Exile_Construction_Abstract_Static";

		class Actions 
		{
			class Grind : ExileAbstractAction
			{
				title = "Grind Lock";
				condition = "call ExAd_fnc_canGrindLock";
				action = "_this spawn ExAd_fnc_grindLock";
			};
			
			class RestoreLock : ExileAbstractAction
			{
				title = "Restore Lock";
				condition = "_object call ExAd_fnc_canRestoreLock";
				action = "_this spawn ExAd_fnc_restoreLock";
			};
		};
	};
	class Safe
	{
		targetType = 2;
		target = "Exile_Container_Safe";

		class Actions 
		{
			class HackSafe : ExileAbstractAction
			{
				title = "Hack Safe";
				condition = "call ExAd_fnc_canHackSafe";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};
	class Laptop
	{
		targetType = 2;
		target = "Exile_Construction_Laptop_Static";

		class Actions
		{
			class StopHack: ExileAbstractAction
			{
				title = "Interupt Hack";
				condition = "(ExileClientInteractionObject getVariable ['ExAd_HACKING_IN_PROGRESS', false])";
				action = "_this spawn ExAd_fnc_stopHack";
			};
		};
	};
};