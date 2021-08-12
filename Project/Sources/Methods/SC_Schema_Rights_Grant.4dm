//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Schema_Rights_Grant(Schema;{Group1{;Group2;{Group3}}}
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:31:43
// ============================================================================
// Description
// Grant rights to a given schema name; If a group is left empty, the right is left untouched

// Usage : SC_Schema_Rights_Grant ("Schema";"Group1;"";Group2")
//
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

If (SC_Schemas_Supported)
	
	If (SC_Schema_Exists($SchemaName_t))
		
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
		SC_ERROR(Current method name:C684; "Schema does not exist."; "Schema name : "+$SchemaName_t)
	End if 
	
End if 


// ============================================================================
//eof
