//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Table_Get_Schema_ID
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:08:22
// ============================================================================
// Description
// Returns the Schema ID for a specified table name
//
// Parameters
C_TEXT:C284($1; SC_private_TableName_t)
SC_private_TableName_t:=$1

C_LONGINT:C283($0; SC_private_SchemaID_l)
SC_private_SchemaID_l:=0

// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	Begin SQL
		select SCHEMA_ID from [_USER_TABLES] where TABLE_NAME = :SC_private_TableName_t into :SC_private_SchemaID_l;
	End SQL
	
End if 

// ============================================================================
$0:=SC_private_SchemaID_l
//eof