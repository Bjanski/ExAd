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
				action = "call XM8_VG_checkNearByFlags";
			};
		};
	};
};