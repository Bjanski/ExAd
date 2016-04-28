class CfgXM8 {
	//This slide use IDCs from 104140 to 104156
	class sideApps {
		controlID = 104140;
		title = "XM8 Apps";
		onLoadScript = "";
	};
	//This slide use IDCs from 352500 to 
	class mainVGSlide {
		controlID = 352500;
		title = "Virtual Garage";
		onLoadScript = "XM8_apps\apps\XM8_VG\scripts\XM8_VG_mainVGSlide_onLoad.sqf";
	};
};