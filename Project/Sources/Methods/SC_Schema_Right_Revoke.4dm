//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Right_Revoke
// Module :  SC
// Username : jpupier
// Created : 01/10/08, 14:27:48
// ============================================================================
// Description
// Revoke Right $2 on schema $1

// USAGE : SC_Schema_Right_Revoke("Schema";"READ")

//
// Parameters
C_TEXT:C284($1; $SchemaName_t)
$SchemaName_t:=$1

C_TEXT:C284($2; $Right_t)
$Right_t:=$2

// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
//
C_TEXT:C284($Statement_t)

C_BOOLEAN:C305($ParameterOK_b)
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	$ParameterOK_b:=True:C214
	Case of 
		: ($Right_t="READ_WRITE")
		: ($Right_t="READ")
		: ($Right_t="ALL")
		Else 
			$ParameterOK_b:=False:C215
	End case 
	
	If ($ParameterOK_b)
		
		If (SC_Schema_Exists($SchemaName_t))
			
			
			$Statement_t:="REVOKE "+$Right_t+" ON "+$SchemaName_t+";"
			SC_SQL_ExecuteImmediate($Statement_t)
			
			
		Else 
			SC_ERROR(Current method name:C684; "Schema does not exist."; $SchemaName_t)
			OK:=0
		End if 
		
	Else 
		SC_ERROR(Current method name:C684; "Parameter error."; $SchemaName_t)
		OK:=0
	End if 
	
End if 


// ============================================================================
//eof




