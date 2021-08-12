//%attributes = {"invisible":true,"shared":true}
// METHOD_NAME : SC_K_Nobody
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:14:26
// ============================================================================
// Description
//  Returns the name of the virtual group <NOBODY>
//
// Parameters
C_TEXT:C284($0; <>SC_Nobody_t)  //The Nobody generic group name
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
If (<>SC_Nobody_t="")
	<>SC_Nobody_t:="<NOBODY>"
End if 


// ============================================================================
$0:=<>SC_Nobody_t
//eof





