//%attributes = {"invisible":true,"shared":true}
// METHOD_NAME : SC_K_Default
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:17:42
// ============================================================================
// Description
// Returns the name of the default schema
//
// Parameters
C_TEXT:C284($0; <>DefaultSchemaName_t)  //The Default schema name
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

//Use this method to have the benefit of type ahead...
If (<>DefaultSchemaName_t="")
	<>DefaultSchemaName_t:="DEFAULT_SCHEMA"
End if 

// ============================================================================
$0:=<>DefaultSchemaName_t
//eof