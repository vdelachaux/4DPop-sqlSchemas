//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Table_Get_Schema
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:06:48
// ============================================================================
// Description
// Returns the schema name for a specified table name
//
// Parameters
C_TEXT:C284($1; SC_private_TableName_t)
SC_private_TableName_t:=$1

C_TEXT:C284($0; SC_private_SchemaName_t)
SC_private_SchemaName_t:=""
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_LONGINT:C283(SC_private_SchemaID_l)
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	If (SC_Table_Exists(SC_private_TableName_t))
		
		Begin SQL
			
			select SCHEMA_ID from [_USER_TABLES] where TABLE_NAME = :SC_private_TableName_t into :SC_private_SchemaID_l;
			select SCHEMA_NAME from [_USER_SCHEMAS] where SCHEMA_ID= :SC_private_SchemaID_l into :SC_private_SchemaName_t;
			
		End SQL
		
	Else 
		
		SC_ERROR(Current method name:C684; "Table does not exists."; SC_private_SchemaName_t)
		OK:=0
		
	End if 
	
End if 


// ============================================================================
$0:=SC_private_SchemaName_t
//eof