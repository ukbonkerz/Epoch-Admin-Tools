if ((getPlayerUID player) in AdminList || (getPlayerUID player) in ModList) then {
	if (isnil "tracker") then {tracker = true;};
	if (tracker) then {
		[]spawn
		{
			private["_veh","_idx","_Fkey","_Nkey"];
			_idx = -1; _Fkey = -1; _Nkey = -1;
			
			while {true} do
			{
				if (_idx == -1 || _Fkey == -1 || _Nkey == -1) then {
					_Fkey = []execVM "admintools\KeyBindings\FunctionKeys.sqf";
					_Nkey = []execVM "admintools\KeyBindings\NumberKeys.sqf";
					_idx = (vehicle player) addaction [("<t color=""#585858"">" + ("Admin Menu") +"</t>"),"admintools\AdminToolsMain.sqf","",0,false,true,"",""];
					_veh = vehicle player;
				};
				if (_veh != vehicle player) then {
					_veh removeAction _idx;
					_idx = -1;
					_Fkey = -1;
					_Nkey = -1;		
				};
				Sleep 2;
			};
		};
		tracker = false;
	};
};