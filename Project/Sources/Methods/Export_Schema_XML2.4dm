//%attributes = {"invisible":true}
//01_ExportSchemas_XML (->$SchemaName_at;->$Read_at;->$ReadWrite_at;->$All_at;->$Group_at;->$TableName_at;->$TableSchemaName_at)
C_TEXT:C284($0; $Root_t)
C_POINTER:C301($1; $SchemaName_at_p)
$SchemaName_at_p:=$1
C_POINTER:C301($2; $Read_at_p)
$Read_at_p:=$2
C_POINTER:C301($3; $ReadWrite_at_p)
$ReadWrite_at_p:=$3
C_POINTER:C301($4; $All_at_p)
$All_at_p:=$4

C_POINTER:C301($5; $TableName_at_p)
$TableName_at_p:=$5
C_POINTER:C301($6; $TableSchemaName_at_p)
$TableSchemaName_at_p:=$6

C_BOOLEAN:C305($7; $IncludeSQL_b)
$IncludeSQL_b:=$7

C_TEXT:C284($Root_t)
C_LONGINT:C283($Loop_l)
C_TEXT:C284($Path_t)
C_TEXT:C284($Ref_t)
C_TEXT:C284($RefSchema_t)
C_TEXT:C284($Ref2_t)

$Root_t:=DOM Create XML Ref:C861("Catalog")


For ($Loop_l; 1; Size of array:C274($SchemaName_at_p->))
	
	If ($SchemaName_at_p->{$Loop_l}#SC_K_Default)
		
		$Path_t:="/Catalog/Schemas/Schema["+String:C10($Loop_l)+"]"
		//$Ref_t:=DOM Create XML element($Root_t;$Path_t;"name";$SchemaName_at_p->{$Loop_l};"read";$Read_at_p->{$Loop_l};"read_write";$ReadWrite_at_p->{$Loop_l};"all";$All_at_p->{$Loop_l})
		
		$RefSchema_t:=DOM Create XML element:C865($Root_t; $Path_t)
		
		$Ref2_t:=DOM Create XML element:C865($RefSchema_t; "Name")
		DOM SET XML ELEMENT VALUE:C868($RefSchema_t; $SchemaName_at_p->{$Loop_l}; *)
		$Ref2_t:=DOM Create XML element:C865($RefSchema_t; "Read")
		DOM SET XML ELEMENT VALUE:C868($Ref2_t; $Read_at_p->{$Loop_l}; *)
		$Ref2_t:=DOM Create XML element:C865($RefSchema_t; "Readwrite")
		DOM SET XML ELEMENT VALUE:C868($Ref2_t; $ReadWrite_at_p->{$Loop_l}; *)
		$Ref2_t:=DOM Create XML element:C865($RefSchema_t; "All")
		DOM SET XML ELEMENT VALUE:C868($Ref2_t; $All_at_p->{$Loop_l}; *)
		//DOM CLOSE XML($RefSchema_t)
		
	End if 
	
End for 

For ($Loop_l; 1; Size of array:C274($TableName_at_p->))
	
	$Path_t:="/Catalog/Tables/Table["+String:C10($Loop_l)+"]"
	$Ref_t:=DOM Create XML element:C865($Root_t; $Path_t; "name"; $TableName_at_p->{$Loop_l}; "schema"; $TableSchemaName_at_p->{$Loop_l})
	
End for 

If ($IncludeSQL_b)
	$Ref_t:=DOM Create XML element:C865($Root_t; "/Catalog/SQL/")
	DOM SET XML ELEMENT VALUE:C868($Ref_t; Export_Schemas_SQL($SchemaName_at_p; $Read_at_p; $ReadWrite_at_p; $All_at_p; $TableName_at_p; $TableSchemaName_at_p); *)
End if 

$0:=$Root_t

