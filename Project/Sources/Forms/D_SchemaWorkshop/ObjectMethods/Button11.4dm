C_LONGINT:C283($Pos_l)
$Pos_l:=Find in array:C230(WS_Tables_ab; True:C214)
If ($Pos_l>0) & ($Pos_l<=Size of array:C274(WS_TableName_at))
	WS_Table_Drop(WS_TableName_at{$Pos_l})
	If (OK=1)
		WS_SQL_Update_Statement
	End if 
End if 
