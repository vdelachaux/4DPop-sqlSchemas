
//Drop all schemas first
ARRAY TEXT:C222($SchemaName_at; 0)
C_LONGINT:C283($Loop_l)
SC_Schemas_Load(->$SchemaName_at)
For ($Loop_l; 1; Size of array:C274($SchemaName_at))
	If ($SchemaName_at{$Loop_l}#SC_K_Default)
		SC_Schema_Drop($SchemaName_at{$Loop_l})
	End if 
End for 

SC_SQL_ExecuteImmediate(Content_t)


ALERT:C41("Schema updated..")

