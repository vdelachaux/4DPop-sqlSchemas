//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Create
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:14:19
// ============================================================================
// Description

// SC_Schema_Create("SchemaName"{;R_Goup{;RW_Group{;All_Group}}})
// If Group is left empty, then right is left untouched 
//
//Create a schema and Grant  READ_WRITE to Group1
// SC_Schema_Create("SchemaName";"";"Group1";"")

// Parameters
C_TEXT:C284($1; $SchemaName_t)
$SchemaName_t:=$1

C_TEXT:C284($2; $Read_Group_t)
C_TEXT:C284($3; $ReadWrite_Group_t)
C_TEXT:C284($4; $All_Group_t)

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

C_TEXT:C284($Statement_t)

If (SC_Schemas_Supported)
	
	If ($SchemaName_t#SC_K_Default)
		If (SC_Schema_Exists($SchemaName_t)=False:C215)
			
			$Statement_t:="CREATE SCHEMA "+$SchemaName_t
			SC_SQL_ExecuteImmediate($Statement_t)
			
			
			If (Count parameters:C259>=2)
				$Read_Group_t:=$2
				If ($Read_Group_t#"")
					SC_Schema_Right_Grant($SchemaName_t; "READ"; $Read_Group_t)
				End if 
			End if 
			
			If (Count parameters:C259>=3)
				$ReadWrite_Group_t:=$3
				If ($ReadWrite_Group_t#"")
					SC_Schema_Right_Grant($SchemaName_t; "READ_WRITE"; $ReadWrite_Group_t)
				End if 
			End if 
			
			If (Count parameters:C259>=4)
				$All_Group_t:=$4
				If ($All_Group_t#"")
					SC_Schema_Right_Grant($SchemaName_t; "ALL"; $All_Group_t)
				End if 
			End if 
			
			
		Else 
			SC_ERROR(Current method name:C684; "Schema already exist."; $SchemaName_t)
			OK:=0
			
		End if 
		
	Else 
		SC_ERROR(Current method name:C684; "Default Schema already is reserved."; $SchemaName_t)
		OK:=0
		
	End if 
	
End if 


// ============================================================================
//eof

