//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Tables_Load
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:11:01
// ============================================================================
// Description
// Load the table name and schema id from system table in referenced arrays.
//
// Parameters
C_POINTER:C301($1; $TableNames_at_p)
$TableNames_at_p:=$1
C_POINTER:C301($2; $SchemaIDs_al_p)
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_LONGINT:C283($LoopTables_l)
ARRAY TEXT:C222(SC__TableName_at; 0)
ARRAY LONGINT:C221(SC__TableSchemaID_al; 0)
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================


Begin SQL
	
	  /* Load all tables with Schema ID  */
	SELECT TABLE_NAME, SCHEMA_ID FROM [_USER_TABLES] into :SC__TableName_at, :SC__TableSchemaID_al;
	
End SQL

// Remove tables that are in the trash
For ($LoopTables_l; Size of array:C274(SC__TableName_at); 1; -1)
	If (SC__TableName_at{$LoopTables_l}="(@")
		DELETE FROM ARRAY:C228(SC__TableName_at; $LoopTables_l; 1)
		DELETE FROM ARRAY:C228(SC__TableSchemaID_al; $LoopTables_l; 1)
	End if 
End for 

//%W-518.1
COPY ARRAY:C226(SC__TableName_at; $TableNames_at_p->)
If (Count parameters:C259>=2)
	$SchemaIDs_al_p:=$2
	If (Not:C34(Is nil pointer:C315($SchemaIDs_al_p)))
		COPY ARRAY:C226(SC__TableSchemaID_al; $SchemaIDs_al_p->)
	End if 
End if 

// ============================================================================
//eof




