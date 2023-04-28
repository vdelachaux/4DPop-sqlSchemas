//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Get_Tables_from_SchemaName
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:50:39
// ============================================================================
// Description

// Returns an array of table names for a given schema name
//
// Parameters
C_TEXT:C284($1; SC_private_SchemaName_t)
SC_private_SchemaName_t:=$1
C_POINTER:C301($2; SC_private_TableNames_at_p)
SC_private_TableNames_at_p:=$2
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
//
C_LONGINT:C283($SchemaID_l)
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================
//%W-518.1
If (SC_Schemas_Supported)
	
	If (SC_Schema_Exists(SC_private_SchemaName_t))
		$SchemaID_l:=SC_Schema_Get_ID(SC_private_SchemaName_t)
		
		ARRAY TEXT:C222(SC_private_TableNames_at; 0)
		
		Begin SQL
			
			select TABLE_NAME from [_USER_TABLES] where SCHEMA_ID= :$SchemaID_l into :SC_private_TableNames_at;
			
		End SQL
		
		COPY ARRAY:C226(SC_private_TableNames_at; SC_private_TableNames_at_p->)
		
	Else 
		
		SC_ERROR(Current method name:C684; "Schema does not exists"; SC_private_SchemaName_t)
	End if 
	
End if 

// ============================================================================
//eof



