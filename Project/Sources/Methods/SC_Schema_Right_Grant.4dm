//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Right_Grant
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:25:20
// ============================================================================
// Description
// Grant the right $2 on schema $1 to group $3
//
// Parameters
C_TEXT:C284($1; $SchemaName_t)
$SchemaName_t:=$1

C_TEXT:C284($2; $Right_t)
$Right_t:=$2

C_TEXT:C284($3; $Group_t)
$Group_t:=$3
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_BOOLEAN:C305($ParameterOK_b)
C_TEXT:C284($Statement_t)
//
// ----------------------------------------------------
// Local_Init
$ParameterOK_b:=True:C214
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	Case of 
		: ($Right_t="READ_WRITE")
		: ($Right_t="READ")
		: ($Right_t="ALL")
		Else 
			$ParameterOK_b:=False:C215
	End case 
	
	If ($ParameterOK_b)
		
		If (SC_Schema_Exists($SchemaName_t))
			
			If (SC_GroupExists($Group_t))
				
				$Statement_t:="GRANT "+$Right_t+" ON "+$SchemaName_t+" TO "+$Group_t+";"
				SC_SQL_ExecuteImmediate($Statement_t)
				
			Else 
				SC_ERROR(Current method name:C684; "Group does not exist."; $Group_t)
				OK:=0
			End if 
			
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








