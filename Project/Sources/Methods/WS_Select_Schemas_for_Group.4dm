//%attributes = {"invisible":true}
C_TEXT:C284($1; $GroupName_t)
$GroupName_t:=$1
C_LONGINT:C283($Loop_l)

If ($GroupName_t#"")
	ARRAY TEXT:C222($Read_at; 0)
	ARRAY TEXT:C222($ReadWrite_at; 0)
	ARRAY TEXT:C222($All_at; 0)
	
	ARRAY TEXT:C222($SchemasNames_at; 0)
	LISTBOX SELECT ROW:C912(WS_Schemas_ab; 0; lk remove from selection:K53:3)
	
	Begin SQL
		select schema_name from [_USER_SCHEMAS] where READ_GROUP_NAME = :$GroupName_t INTO :$Read_at;
	End SQL
	
	Begin SQL
		select schema_name from [_USER_SCHEMAS] where READ_WRITE_GROUP_NAME = :$GroupName_t INTO :$ReadWrite_at;
	End SQL
	
	Begin SQL
		select schema_name from [_USER_SCHEMAS] where ALL_GROUP_NAME = :$GroupName_t INTO :$All_at;
	End SQL
	
	If (Size of array:C274($Read_at)>0)
		For ($Loop_l; 1; Size of array:C274($Read_at))
			If (Find in array:C230($SchemasNames_at; $Read_at{$Loop_l})=-1)
				APPEND TO ARRAY:C911($SchemasNames_at; $Read_at{$Loop_l})
			End if 
		End for 
	End if 
	
	If (Size of array:C274($ReadWrite_at)>0)
		For ($Loop_l; 1; Size of array:C274($ReadWrite_at))
			If (Find in array:C230($SchemasNames_at; $ReadWrite_at{$Loop_l})=-1)
				APPEND TO ARRAY:C911($SchemasNames_at; $ReadWrite_at{$Loop_l})
			End if 
		End for 
	End if 
	
	If (Size of array:C274($All_at)>0)
		For ($Loop_l; 1; Size of array:C274($All_at))
			If (Find in array:C230($SchemasNames_at; $All_at{$Loop_l})=-1)
				APPEND TO ARRAY:C911($SchemasNames_at; $All_at{$Loop_l})
			End if 
		End for 
	End if 
	
	If (Size of array:C274($SchemasNames_at)>0)
		For ($Loop_l; 1; Size of array:C274(WS_SchemaName_at))
			If (Find in array:C230($SchemasNames_at; WS_SchemaName_at{$Loop_l})#-1)
				LISTBOX SELECT ROW:C912(WS_Schemas_ab; $Loop_l; lk add to selection:K53:2)
			End if 
		End for 
	End if 
	
End if 

