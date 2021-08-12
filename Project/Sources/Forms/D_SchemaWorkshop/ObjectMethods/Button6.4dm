C_LONGINT:C283($Pos)
C_TEXT:C284($SchemaName_t)

$Pos:=Find in array:C230(WS_Schemas_ab; True:C214)
If ($Pos>0)
	$SchemaName_t:=WS_SchemaName_at{$Pos}
	WS_Schema_Drop($SchemaName_t)
End if 
