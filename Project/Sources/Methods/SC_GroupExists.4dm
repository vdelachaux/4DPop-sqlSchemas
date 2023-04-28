//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_GroupExists
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:55:54
// ============================================================================
// Description
// Returns true if the specified group exists
// Returns true if the group is a predefined virtual group

// Parameters
C_TEXT:C284($1; $GroupName_t)
$GroupName_t:=$1
C_BOOLEAN:C305($0; $GroupExists_b)
$GroupExists_b:=False:C215
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

Case of 
	: ($GroupName_t=SC_K_Nobody)
		$GroupExists_b:=True:C214
		
	: ($GroupName_t=SC_K_Everybody)
		$GroupExists_b:=True:C214
		
	Else 
		
		GET GROUP LIST:C610($GroupName_at; $GroupID_al)
		
		If (Find in array:C230($GroupName_at; $GroupName_t)>0)
			$GroupExists_b:=True:C214
		End if 
		
End case 

// ============================================================================
$0:=$GroupExists_b
//eof






