//%attributes = {"invisible":true}
// METHOD_NAME : WS_Read_Tables
// MODULE :  WorkShop
// ============================================================================
// Description :

//  Loads the table definition from the system table.
//  Build a associated array with the corresponding schema name.
// ============================================================================
C_LONGINT:C283($Loop_l)
C_LONGINT:C283($Element_l)
C_TEXT:C284($SelectedSchemaName_t)
// ============================================================================

//Load table names from the system table
SC_Tables_Load(->WS_TableName_at)


//Create an associated array
ARRAY TEXT:C222(WS_TableSchemaName_at; Size of array:C274(WS_TableName_at))
For ($Loop_l; 1; Size of array:C274(WS_TableName_at))
	
	//Fill with with the corresponding array
	WS_TableSchemaName_at{$Loop_l}:=SC_Table_Get_Schema(WS_TableName_at{$Loop_l})
	
End for 

SORT ARRAY:C229(WS_TableName_at; WS_TableSchemaName_at; >)

COPY ARRAY:C226(WS_TableName_at; WS_TableName_all_at)
COPY ARRAY:C226(WS_TableSchemaName_at; WS_TableSchemaName_all_at)


If (WS_cbFilterTables=1)
	$Element_l:=Find in array:C230(WS_Schemas_ab; True:C214)
	If ($Element_l>0)
		$SelectedSchemaName_t:=WS_SchemaName_at{$Element_l}
		For ($Loop_l; Size of array:C274(WS_TableName_at); 1; -1)
			If (WS_TableSchemaName_at{$Loop_l}#$SelectedSchemaName_t)
				DELETE FROM ARRAY:C228(WS_TableName_at; $Loop_l; 1)
				DELETE FROM ARRAY:C228(WS_TableSchemaName_at; $Loop_l; 1)
			End if 
		End for 
	End if 
End if 



// ============================================================================
//eom