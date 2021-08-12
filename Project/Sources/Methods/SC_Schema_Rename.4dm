//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Rename
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:20:10
// ============================================================================
// Description
// Renames the given Schema
//
// Parameters
C_TEXT:C284($1; $SchemaName_t)
$SchemaName_t:=$1
C_TEXT:C284($2; $NewSchemaName_t)
$NewSchemaName_t:=$2
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_TEXT:C284($Statement_t)
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================


If (SC_Schemas_Supported)
	
	//NOTE : 
	//This is not yet implemented
	
	If (SC_Schema_Exists($SchemaName_t))
		
		If ($SchemaName_t#SC_K_Default)
			
			If ($NewSchemaName_t#SC_K_Default)
				
				
				If (Not:C34(SC_Schema_Exists($NewSchemaName_t)))
					
					ALERT:C41("To be implemeted")
					If (False:C215)
						$Statement_t:="ALTER SCHEMA "+$SchemaName_t+" RENAME TO "+$NewSchemaName_t
						SC_SQL_ExecuteImmediate($Statement_t)
					End if 
					OK:=0
					
				Else 
					SC_ERROR(Current method name:C684; "Schema already exists."; $NewSchemaName_t)
					OK:=0
				End if 
				
			Else 
				SC_ERROR(Current method name:C684; "Default schema is a reserved name."; $SchemaName_t)
				OK:=0
			End if 
			
			
		Else 
			SC_ERROR(Current method name:C684; "Default schema can not be renamed."; $SchemaName_t)
			OK:=0
		End if 
		
	Else 
		SC_ERROR(Current method name:C684; "Schema does not exist."; $SchemaName_t)
		OK:=0
	End if 
	
End if 

// ============================================================================
//eof




