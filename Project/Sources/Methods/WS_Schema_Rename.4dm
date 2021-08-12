//%attributes = {"invisible":true}

C_TEXT:C284($SchemaName_t)
C_TEXT:C284($NewSchemaName_t)
C_LONGINT:C283($Pos)

$Pos:=WS_Schemas_ab
If ($Pos>=1)
	$SchemaName_t:=WS_SchemaName_at{$Pos}
	
	If ($SchemaName_t=SC_K_Default)
		ALERT:C41(SC_K_Default+" is a reserved schema name")
	Else 
		
		$NewSchemaName_t:=Request:C163("Schema name :"; $SchemaName_t)
		If (OK=1) & ($NewSchemaName_t#"")
			Case of 
				: ($NewSchemaName_t=$SchemaName_t)
					ALERT:C41("Schema : "+$SchemaName_t+" is stayed untouched.")
					
				: ($NewSchemaName_t=SC_K_Default)
					ALERT:C41(SC_K_Default+" is a reserved schema name")
					
				: (SC_Schema_Exists($NewSchemaName_t))
					ALERT:C41("Schema "+$NewSchemaName_t+" already exists.")
					
				Else 
					
					SC_Schema_Rename($SchemaName_t; $NewSchemaName_t)
					WS_Read_Schemas
					WS_Read_Tables
					
			End case 
			
		End if 
		
	End if 
	
	
	
End if 