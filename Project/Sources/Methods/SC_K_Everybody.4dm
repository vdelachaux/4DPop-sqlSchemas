//%attributes = {"invisible":true,"shared":true}
// METHOD_NAME : SC_K_Everybody
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:15:21
// ============================================================================
// Description
// Returns the name of the virtual group <EVERYBODY> 
//
// Parameters
C_TEXT:C284($0; <>SC_Everybody_t)  //The generic everybody group name
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
If (<>SC_Everybody_t="")
	<>SC_Everybody_t:="<EVERYBODY>"
End if 


// ============================================================================
$0:=<>SC_Everybody_t
//eof






