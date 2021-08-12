//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Exists
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:16:26
// ============================================================================
// Description
//  Returns true if the Schema exists
//
// Parameters
C_TEXT:C284($1; SC_private_SchemaName_t)
SC_private_SchemaName_t:=$1
C_BOOLEAN:C305($0; $SchemaExists_b)
$SchemaExists_b:=False:C215

// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
//
C_LONGINT:C283(SC_private_Count_l)
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	// Just check the schema exists . We use select count(*) with a WHERE statement
	Begin SQL
		select count(*) from [_USER_SCHEMAS] where SCHEMA_NAME = :SC_private_SchemaName_t into :SC_private_Count_l;
	End SQL
	
	
	If (SC_private_Count_l=1)
		$SchemaExists_b:=True:C214
	End if 
	
End if 

// ============================================================================
$0:=$SchemaExists_b
//eof





