//%attributes = {"invisible":true,"publishedSql":true}
//01_ExportSchemas_SQL (->$SchemaName_at;->$Read_at;->$ReadWrite_at;->$All_at;->$Group_at;->$TableName_at;->$TableSchemaName_at)
C_TEXT:C284($0; $Text)

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

C_TEXT:C284($Text)
C_BLOB:C604($Blob)
C_LONGINT:C283($Loop_l)
C_TEXT:C284($SchemaName_t)

$Text:=""
$Text:=$Text+"/*============================*/\r"
$Text:=$Text+"/*                     Schema creation                         */\r"
$Text:=$Text+"/*============================*/\r\r"

For ($Loop_l; 1; Size of array:C274($SchemaName_at_p->))
	$SchemaName_t:=$SchemaName_at_p->{$Loop_l}
	
	If ($SchemaName_t#SC_K_Default)
		//$Text:=$Text+"DROP SCHEMA "+$SchemaName_t+";\r"
		$Text:=$Text+"CREATE SCHEMA "+$SchemaName_t+";\r"
	End if 
	
	
	If ($Read_at_p->{$Loop_l}=SC_K_Nobody)
		$Text:=$Text+"REVOKE READ ON "+$SchemaName_t+";\r"
	Else 
		If ($Read_at_p->{$Loop_l}#SC_K_Everybody)
			$Text:=$Text+"GRANT READ ON "+$SchemaName_t+" TO "+$Read_at_p->{$Loop_l}+";\r"
		End if 
	End if 
	
	If ($ReadWrite_at_p->{$Loop_l}=SC_K_Nobody)
		$Text:=$Text+"REVOKE READ_WRITE ON "+$SchemaName_t+";\r"
	Else 
		If ($ReadWrite_at_p->{$Loop_l}#SC_K_Everybody)
			$Text:=$Text+"GRANT READ_WRITE ON "+$SchemaName_t+" TO "+$ReadWrite_at_p->{$Loop_l}+";\r"
		End if 
	End if 
	
	If ($All_at_p->{$Loop_l}=SC_K_Nobody)
		$Text:=$Text+"REVOKE ALL ON "+$SchemaName_t+";\r"
	Else 
		If ($All_at_p->{$Loop_l}#SC_K_Everybody)
			$Text:=$Text+"GRANT ALL ON "+$SchemaName_t+" TO "+$All_at_p->{$Loop_l}+";\r"
		End if 
	End if 
	
	$Text:=$Text+"\r"
End for 

$Text:=$Text+"\r"
$Text:=$Text+"/*============================*/\r"
$Text:=$Text+"/*                      Alter tables                               */\r"
$Text:=$Text+"/*============================*/\r\r"

For ($Loop_l; 1; Size of array:C274($TableName_at_p->))
	$Text:=$Text+"ALTER TABLE "+$TableName_at_p->{$Loop_l}+" SET SCHEMA "+$TableSchemaName_at_p->{$Loop_l}+";\r"
End for 

$Text:=$Text+"\r"

$0:=$Text
