//%attributes = {"invisible":true}
C_LONGINT:C283($Value_l)
C_TEXT:C284($Value_t)
$Value_l:=0
Repeat 
	$Value_l:=$Value_l+1
	$Value_t:="Table_"+String:C10($Value_l)
Until (SC_Table_Exists($Value_t)=False:C215)
$Value_t:=Request:C163("Table Name"; $Value_t)
If ($Value_t#"")
	SC_SQL_ExecuteImmediate("CREATE TABLE "+$Value_t+"(ID INT);")
	WS_Read_Tables
	WS_SQL_Update_Statement
Else 
	OK:=0
End if 
