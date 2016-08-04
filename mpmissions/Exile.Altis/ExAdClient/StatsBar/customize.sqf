/*  
	customize.sqf
	
	Copyright 2016 Jan Babor

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.
*/

ExAd_SB_ICON_BANK = 	"ExAdClient\StatsBar\Icons\ExAd_Bank.paa";		//STRING - Path to bank icon
ExAd_SB_ICON_CLAN = 	"ExAdClient\StatsBar\Icons\ExAd_Family.paa";	//STRING - Path to family icon
ExAd_SB_ICON_COMPASS = 	"ExAdClient\StatsBar\Icons\ExAd_Compass.paa";	//STRING - Path to compass icon
ExAd_SB_ICON_GRID = 	"ExAdClient\StatsBar\Icons\ExAd_Grid.paa";		//STRING - Path to grid icon
ExAd_SB_ICON_HP = 		"ExAdClient\StatsBar\Icons\ExAd_Health.paa";	//STRING - Path to health icon
ExAd_SB_ICON_HUNGER = 	"ExAdClient\StatsBar\Icons\ExAd_Hunger.paa";	//STRING - Path to hunger icon
ExAd_SB_ICON_KD = 		"ExAdClient\StatsBar\Icons\ExAd_KD.paa";		//STRING - Path to kill death ratio icon
ExAd_SB_ICON_PLAYERS = 	"ExAdClient\StatsBar\Icons\ExAd_Players.paa";	//STRING - Path to players icon
ExAd_SB_ICON_RESPECT = 	"ExAdClient\StatsBar\Icons\ExAd_Respect.paa";	//STRING - Path to respect icon
ExAd_SB_ICON_TEMP = 	"ExAdClient\StatsBar\Icons\ExAd_Temp.paa";		//STRING - Path to temperature icon
ExAd_SB_ICON_THIRST = 	"ExAdClient\StatsBar\Icons\ExAd_Thirst.paa";	//STRING - Path to thirst icon
ExAd_SB_ICON_TIMER = 	"ExAdClient\StatsBar\Icons\ExAd_Restart.paa";	//STRING - Path to restart icon
ExAd_SB_ICON_Wallet = 	"ExAdClient\StatsBar\Icons\ExAd_Wallet.paa";	//STRING - Path to POP TABS icon
ExAd_SB_ICON_LOGO = 	"ExAdClient\Core\Img\ExAd_logo_128.paa";		//STRING - Path to logo

ExAd_SB_COMPONENTS_COLORS = ["#000000", "#440B00","#FE1106","#CA7400","#A9C700","#11BF03"]; //STRINGS - Array of color codes, from bad to good. 

ExAd_SB_Timer = 3; 										//SCALAR - Restart time measured in hours. 

ExAd_SB_GUI_POS_Default = 	[safeZoneX, safeZoneY + safeZoneH - 32 * pixelH, safeZoneW, 30 * pixelH]; //ARRAY - Position with this attributes [x,y,w,h];
ExAd_SB_GUI_TextColor_Default = [1,1,1,1];				//ARRAY - rgba array with values between 0-1, 0 => 0 | 255 => 1
ExAd_SB_GUI_BgColor_Default = [0,0,0,0];				//ARRAY - rgba array with values between 0-1, 0 => 0 | 255 => 1

ExAd_SB_Text_Margin_Default = " ";						//STRING - Margin between components measured in blankspaces
ExAd_SB_Text_InnerMargin_Default = "";					//STRING - Margin between icon and text within the component measured in blankspaces
ExAd_SB_Text_Font_Default = "OrbitronLight";			//STRING - Font family
ExAd_SB_Text_Align_Default = "center";					//STRING - Alignment (left,center,right)
ExAd_SB_Text_Size_Default = 1;							//SCALAR - Text size ( 0-2 )
ExAd_SB_Img_Size_Default = 1;							//SCALAR - Icon size ( 0-2 )

ExAd_SB_Show_KD_Default = false;						//BOOLEAN - Template, show kill death ratio
ExAd_SB_Show_HP_Default = true;							//BOOLEAN - Template, show health
ExAd_SB_Show_Thirst_Default = false;					//BOOLEAN - Template, show thirst
ExAd_SB_Show_Hunger_Default = false;					//BOOLEAN - Template, show hunger
ExAd_SB_Show_Wallet_Default = true;						//BOOLEAN - Template, show pop tabs on player
ExAd_SB_Show_Bank_Default = false;						//BOOLEAN - Template, show pop tabs in locker
ExAd_SB_Show_Respect_Default = false;					//BOOLEAN - Template, show respect
ExAd_SB_Show_FPS_Default = true;						//BOOLEAN - Template, show fps
ExAd_SB_Show_Time_Default = true;						//BOOLEAN - Template, show restart timer
ExAd_SB_Show_Temp_Default = true;						//BOOLEAN - Template, show body temperature
ExAd_SB_Show_Grid_Default = true;						//BOOLEAN - Template, show grid location
ExAd_SB_Show_Compass_Default = true;					//BOOLEAN - Template, show compass
ExAd_SB_Show_PlayerCount_Default = true;				//BOOLEAN - Template, show online players count
ExAd_SB_Show_ClanCount_Default = false;					//BOOLEAN - Template, show online family members count 


ExAd_SB_Allow_KD = 			true;						//BOOLEAN - Allow showing kill death ratio
ExAd_SB_Allow_HP = 			true;						//BOOLEAN - Allow showing health
ExAd_SB_Allow_Thirst = 		true;						//BOOLEAN - Allow showing thirst
ExAd_SB_Allow_Hunger = 		true;						//BOOLEAN - Allow showing hunger
ExAd_SB_Allow_Wallet = 		true;						//BOOLEAN - Allow showing wallet
ExAd_SB_Allow_Bank = 		true;						//BOOLEAN - Allow showing bank saldo
ExAd_SB_Allow_Respect = 	true;						//BOOLEAN - Allow showing respect
ExAd_SB_Allow_FPS = 		true;						//BOOLEAN - Allow showing fps
ExAd_SB_Allow_Time = 		true;						//BOOLEAN - Allow showing restart timer
ExAd_SB_Allow_Temp = 		true;						//BOOLEAN - Allow showing body temperature
ExAd_SB_Allow_Grid = 		true;						//BOOLEAN - Allow showing grid location
ExAd_SB_Allow_Compass = 	true;						//BOOLEAN - Allow showing compass
ExAd_SB_Allow_PlayerCount = true;						//BOOLEAN - Allow showing players count 
ExAd_SB_Allow_ClanCount = 	false;						//BOOLEAN - Allow showing online family members count
