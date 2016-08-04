#include "base.cpp"

class ExAd_STATSBAR
{	
	idd = 2186;	
	movingEnable = 0;
	enableSimulation = 1;
	enableDisplay = 1;
	duration = 10e10;
	fadein = 0;
	fadeout = 0;
	name = "ExAd_STATSBAR"; 
	onLoad = "with uiNameSpace do { ExAd_STATSBAR = _this select 0 };";
	class controls 
	{
		class StatsBar: RscStructuredText
		{
			idc = 1100;
			text = "";
			x = "safeZoneX";
			y = "safeZoneY + safeZoneH - 32 * pixelH";
			w = "safeZoneW";
			h = "30 * pixelH";
		};
		class Logo
		{	
			type= 0;
			idc = 1000;
			x = "safeZoneX + 60 * pixelW";
			y = "safeZoneY + 60 * pixelH - 32 * pixelH";
			w = "64 * pixelW";
			h = "64 * pixelH";
			style=48;
			colorBackground[]={0,0,0,0};
			colorText[]={0,0,0,1};
			font="TahomaB";
			sizeEx=0;
			text = "";
		};	
	};
};