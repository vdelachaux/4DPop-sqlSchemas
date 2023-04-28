//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Table_Set_Schema
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:09:41
// ============================================================================
// Description
// 
//
// Parameters
C_TEXT:C284($1; $TableName_t)
$TableName_t:=$1

C_TEXT:C284($2; $SchemaName_t)
$SchemaName_t:=$2
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_LONGINT:C283($SchemaID_l)
C_TEXT:C284($Statement_t)
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	//Use execute immediate, because a table cannot be accessed by a 4D var
	$Statement_t:="alter table "+$TableName_t+" set schema "+$SchemaName_t+";"
	
	//Check schema first
	If (SC_Schema_Exists($SchemaName_t))
		
		//Check table
		If (SC_Table_Exists($TableName_t))
			
			SC_SQL_ExecuteImmediate($Statement_t)
			
		Else 
			//Table does not exists
			SC_ERROR(Current method name:C684; "Table does not exists"; $Statement_t)
			OK:=0
		End if 
		
	Else 
		//Schema does not exists 
		SC_ERROR(Current method name:C684; "Schema does not exists"; $Statement_t)
		OK:=0
	End if 
	
End if 

// ============================================================================
//eof






