//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_SQL_ExecuteImmediate
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:04:40
// ============================================================================
// Description
// 
//
// Parameters
C_TEXT:C284($1; SC_private_Statement_t)
SC_private_Statement_t:=$1
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_TEXT:C284($OldErrorMethod_t)
//
// ----------------------------------------------------
// Local_Init
$OldErrorMethod_t:=Method called on error:C704
//
// ----------------------------------------------------
// ============================================================================

ON ERR CALL:C155("SC__ERR_Handler")

Begin SQL
	
	execute immediate :SC_private_Statement_t;
	
End SQL

If (gError#0)
	gError:=0
	OK:=0
End if 

ON ERR CALL:C155($OldErrorMethod_t)

// ============================================================================
//eof





