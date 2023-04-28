//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : SC_Schemas_Load
// Module : SC
// Username : jpupier
// Created : 01/10/08, 14:58:10
// ============================================================================
// Description
// Loads the _USER_SCHEMA system table in referenced arrays
//

// Usage : SC_Schemas_Load(->SchemaNames_at)
// Usage : SC_Schemas_Load(->SchemaNames_at;->Read_at;->Read_Write;->All_at;->ID_al)
// Usage : SC_Schemas_Load(->SchemaNames_at;->Dummy;->Dummy;->Dummy;->ID_al)

// Parameters
C_POINTER:C301($1; $SchemaName_at_p)
$SchemaName_at_p:=$1


C_POINTER:C301($2; $Read_at_p)
C_POINTER:C301($3; $ReadWrite_at_p)
C_POINTER:C301($4; $All_at_p)
C_POINTER:C301($5; $SchemaID_al_p)
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
//
ARRAY LONGINT:C221(SC_Private_SchemaID_al; 0)
ARRAY TEXT:C222(SC_Private_SchemaName_at; 0)
ARRAY TEXT:C222(SC_Private_Read_at; 0)
ARRAY TEXT:C222(SC_Private_ReadWrite_at; 0)
ARRAY TEXT:C222(SC_Private_All_at; 0)
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

If (SC_Schemas_Supported)
	
	
	Begin SQL
		  /* Load all Schema with Schema ID */
		
		SELECT 
		SCHEMA_ID, SCHEMA_NAME, READ_GROUP_NAME, READ_WRITE_GROUP_NAME, ALL_GROUP_NAME 
		FROM
		 [_USER_SCHEMAS]
		 INTO :SC_Private_SchemaID_al, :SC_Private_SchemaName_at, :SC_Private_Read_at, :SC_Private_ReadWrite_at, :SC_Private_All_at ;
		
	End SQL
	
	//%W-518.1
	COPY ARRAY:C226(SC_Private_SchemaName_at; $SchemaName_at_p->)
	
	If (Count parameters:C259>=2)
		$Read_at_p:=$2
		If (Not:C34(Is nil pointer:C315($Read_at_p)))
			COPY ARRAY:C226(SC_Private_Read_at; $Read_at_p->)
		End if 
	End if 
	
	If (Count parameters:C259>=3)
		$ReadWrite_at_p:=$3
		If (Not:C34(Is nil pointer:C315($ReadWrite_at_p)))
			COPY ARRAY:C226(SC_Private_ReadWrite_at; $ReadWrite_at_p->)
		End if 
	End if 
	
	If (Count parameters:C259>=4)
		$All_at_p:=$4
		If (Not:C34(Is nil pointer:C315($All_at_p)))
			COPY ARRAY:C226(SC_Private_All_at; $All_at_p->)
		End if 
	End if 
	
	If (Count parameters:C259>=5)
		$SchemaID_al_p:=$5
		If (Not:C34(Is nil pointer:C315($SchemaID_al_p)))
			COPY ARRAY:C226(SC_Private_SchemaID_al; $SchemaID_al_p->)
		End if 
	End if 
	
End if 

// ============================================================================
//eof





