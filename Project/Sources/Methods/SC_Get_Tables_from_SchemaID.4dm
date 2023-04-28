//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Get_Tables_from_SchemaID
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:49:05
// ============================================================================
// Description
// Returns an array of table names for a specified schema id
//
// Parameters
C_LONGINT:C283($1; SC_private_SchemaID_l)
SC_private_SchemaID_l:=$1
C_POINTER:C301($2; SC_private_TableNames_at_p)
SC_private_TableNames_at_p:=$2

// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
ARRAY TEXT:C222(SC_private_TableNames_at; 0)
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================
//%W-518.1

If (SC_Schemas_Supported)
	
	Begin SQL
		
		select TABLE_NAME from [_USER_TABLES] where SCHEMA_ID = :SC_private_SchemaID_l into :SC_private_TableNames_at;
		
	End SQL
	
	COPY ARRAY:C226(SC_private_TableNames_at; SC_private_TableNames_at_p->)
	ARRAY TEXT:C222(SC_private_TableNames_at; 0)  // Cleaning
End if 

// ============================================================================
//eof




