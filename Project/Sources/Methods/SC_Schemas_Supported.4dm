//%attributes = {"invisible":true,"shared":true}
// METHOD_NAME : SC_Schemas_Supported
// Module : SC
// Username : jpupier
// Created : 02/10/08, 08:50:38
// ============================================================================
// Description

// Returns true if application version above 11.3 
// Schemas are not supported by previous versions
//
// Parameters
C_BOOLEAN:C305($0)
C_LONGINT:C283(<>SC_Version_OK_l)
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


If (<>SC_Version_OK_l=0)
	
	If (Application version:C493<"1130")
		<>SC_Version_OK_l:=-1
	Else 
		<>SC_Version_OK_l:=1
	End if 
	
End if 

$0:=(<>SC_Version_OK_l>0)

// ============================================================================
//eof

