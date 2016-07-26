ExAd_DV_DESPAWN_IDLE_TIME = 600;

ExAd_XM8_DV_fnc_itemsInCargo = {
	params ["_container","_itemArray","_item","_amount","_response"];

	_item = toLower (_itemArray select 0);
	_amount = _itemArray select 1;

	_response = false;
	{
		if(_item == toLower _x)then{
			_amount = _amount - 1;
		};
		if(_amount <= 0)exitWith{_response = true}
	}forEach magazines player;

	_response	
};

ExAd_XM8_DV_fnc_itemsMissing = {
	params["_recipe","_recipeStr"];
	
	_recipeStr = "";
	{
		private["_amount","_configName","_displayName","_text"];
		_amount = if(count _x > 1)then{_x select 1}else{1};
		_text = [_x select 0] call ExAd_XM8_DV_fnc_getDisplayName;
		_recipeStr = _recipeStr + format["%1x : %2<br />",(if(_amount < 0)then{((-1) * _amount)}else{_amount}), _text];
	}forEach _recipe;
	
	_response = format["You need <br />%1",_recipeStr];

	_response
};

ExAd_XM8_DV_fnc_getDisplayName = {
	params["_class","_configName","_displayName"];
	_configName = _class call ExileClient_util_gear_getConfigNameByClassName;
	_displayName = getText(configFile >> _configName >> _class >> "displayName");
	_text = if(count _displayName > 0)then{_displayName}else{_class};

	_text
};

ExAd_XM8_DV_fnc_canPack = {
	( ExileClientInteractionObject getVariable["ExAd_DV_Packable", false] )
};

ExAd_XM8_DV_fnc_pack = {
	[ExileClientInteractionObject] spawn {
		params["_obj"];
	
		disableUserInput true;
		player playActionNow "Medic";

		uiSleep 3;
		["despawnDeployableVehicle", [netId _obj]] call ExAd_fnc_serverDispatch;
		uiSleep 1;

		["SuccessTitleAndText", ["Vehicle Packed"]] call ExileClient_gui_toaster_addTemplateToast;
		disableUserInput false;
	};
};

ExAd_XM8_DV_fnc_spawnVehicle = {
	params["_slideClass","_bambiState","_delopyRecipe","_vehicleClass"];

	try
	{	
		_bambiState = if(isNumber(missionConfigFile >> "CfgXM8" >> _slideClass >> "bambiState")) then
		{
			if(getNumber(missionConfigFile >> "CfgXM8" >> _slideClass >> "bambiState") > 0)then{true}else{false}
		} else {true};

		if(_bambiState && !ExileClientPlayerIsBambi) then { throw "You can only spawn vehicles as a bambi!"};

		_delopyRecipe = getArray(missionConfigFile >> "CfgXM8" >> _slideClass >> "recipe");
		if(count _delopyRecipe > 0) then
		{
			{
				if(count _x > 1) then
				{
					_amount = if(_x select 1 == -1)then{1}else{_x select 1};
					if!([player, [_x select 0, _amount]] call ExAd_XM8_DV_fnc_itemsInCargo) then 
					{
						throw ([_delopyRecipe] call ExAd_XM8_DV_fnc_itemsMissing);
					};
				} else {
					if!([player, _x select 0] call ExileClient_util_playerEquipment_contains) then 
					{
						throw ([_delopyRecipe] call ExAd_XM8_DV_fnc_itemsMissing);
					}
				}
			}forEach _delopyRecipe;

			{
				_count = if(count _x > 1)then{(_x select 1)}else{1};
				for "_i" from 1 to _count do {
					[player, _x select 0] call ExileClient_util_playerCargo_remove
				}
			}forEach _delopyRecipe;
		};

		_vehicleClass = getText(missionConfigFile >> "CfgXM8" >> _slideClass >> "vehicleClass");
		if!(isClass(configFile >> "CfgVehicles" >> _vehicleClass ))then { throw "The vehicle class doesn't exist"};

		[_slideClass] spawn {
			params["_slideClass"];
			disableUserInput true;
			player playActionNow "Medic";

			uiSleep 3;
			["spawnDeployableVehicle", [netId player, _slideClass]] call ExAd_fnc_serverDispatch;
			uiSleep 1;
			["SuccessTitleAndText", ["Vehicle deployed"]] call ExileClient_gui_toaster_addTemplateToast;
			ExileClientXM8CurrentSlide = "extraApps";
			disableUserInput false;
		};	

		["extraApps", 1] call ExileClient_gui_xm8_slide;
		closeDialog 0;


	}
	catch{
		[_exception] spawn {
			UISleep 0.5; 
			["ErrorTitleAndText", ["ExAd - Deploy Vehicle", _this select 0]] call ExileClient_gui_toaster_addTemplateToast;
			["extraApps", 1] call ExileClient_gui_xm8_slide;
		};
	};
};