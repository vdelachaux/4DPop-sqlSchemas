//%attributes = {"invisible":true}
C_TEXT:C284($1; $Value_t)
$Value_t:=$1

If (SC_Table_Exists($Value_t))
	SC_SQL_ExecuteImmediate("DROP TABLE "+$Value_t+";")
	
	WS_Read_Tables
Else 
	OK:=0
End if 

