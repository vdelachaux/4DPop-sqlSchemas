//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Drop
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:15:38
// ============================================================================
// Description
//  Drop a schema specified by $1
//
// Parameters
C_TEXT:C284($1; $SchemaName_t)
$SchemaName_t:=$1
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
	
	If (SC_Schema_Exists($SchemaName_t))
		If ($SchemaName_t#SC_K_Default)
			
			
			$Statement_t:="DROP SCHEMA "+$SchemaName_t+";"
			
			
			//Read the related table for this schema, they should be reset to default schema
			ARRAY TEXT:C222($TableNames_at; 0)
			SC_Get_Tables_from_SchemaName($SchemaName_t; ->$TableNames_at)
			
			SC_SQL_ExecuteImmediate($Statement_t)
			
			// Check if table have been reseted to default :should be automatic
			C_LONGINT:C283($Loop_l)
			For ($Loop_l; 1; Size of array:C274($TableNames_at))
				
				If (SC_Table_Get_Schema($TableNames_at{$Loop_l})#SC_K_Default)
					SC_ERROR(Current method name:C684; "Internal error"; "Table "+$TableNames_at{$Loop_l}+" not reset to "+SC_K_Default)
				End if 
				
			End for 
			
			
			
		Else 
			OK:=0
		End if 
		
		
	Else 
		OK:=0
	End if 
	
End if 

// ============================================================================
//eof




