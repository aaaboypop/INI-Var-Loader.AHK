LoadSetting(SettingPath){
	global Setting

	If !(FileExist(SettingPath)){
	DefaultSetting =
	(
[TestFn]
TestKey=vale
	)
	FileAppend, %DefaultSetting%, %Path%
	}

	FileRead, FileSetting, %SettingPath%
	Setting:={}
	Setting._List:=[]
	Loop, Parse, FileSetting, `n, `r
	{
		i := A_index
		If RegExMatch(A_LoopField, "O)^\[(.*)\]$" , ObjMatch) ; Find ProfileName > Set Default value
		{
			FnName := ObjMatch.Value(1)
			Setting._List.Push(FnName)
			Setting[FnName] := {}
			Setting[FnName]._List := []
			Continue
		}
		If RegExMatch(A_LoopField, "O)^(.*)=(.*)$" , ObjMatch)
		{
			KEY := ObjMatch.Value(1)
			Value := ObjMatch.Value(2)
			Setting[FnName][KEY] := Value
			Setting[FnName]._List.Push(KEY)
		}
	}	
}

GetSetting(FnName){
	global Setting

	out := {}
	for i,v in Setting[FnName]._List{
		out[v] := Setting[FnName][v]
	}
	Return out
}