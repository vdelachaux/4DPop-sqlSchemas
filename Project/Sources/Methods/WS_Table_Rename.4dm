//%attributes = {"invisible":true}
C_LONGINT:C283($pos)
C_TEXT:C284($TableName_t)
C_TEXT:C284($NewTableName_t)
C_TEXT:C284($Statement_t)

$pos:=Find in array:C230(WS_Tables_ab; True:C214)
If ($pos>=1)
	$TableName_t:=WS_TableName_at{$pos}
	
	$NewTableName_t:=Request:C163("Rename table as : "; $TableName_t)
	If (OK=1) & ($NewTableName_t#"") & ($NewTableName_t#$TableName_t)
		
		If (Not:C34(SC_Table_Exists($NewTableName_t)))
			$Statement_t:="RENAME TABLE "+$TableName_t+" TO "+$NewTableName_t
			SC_SQL_ExecuteImmediate($Statement_t)
			
			WS_Read_Tables
			
		Else 
			SC_ERROR(Current method name:C684; "Table "+$NewTableName_t+" already exists.")
		End if 
		
	End if 
End if 

