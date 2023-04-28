//%attributes = {"invisible":true,"publishedSql":true}
//Dummy_System_Tables 
C_TEXT:C284($Text_t)
C_BLOB:C604($Blob)

$Text_t:=Export_Schemas_SQL(->WS_SchemaName_at; ->WS_Read_at; ->WS_ReadWrite_at; ->WS_All_at; ->WS_TableName_at; ->WS_TableSchemaName_at)
If ($Text_t#"")
	TEXT TO BLOB:C554($Text_t; $Blob; UTF8 text without length:K22:17)
	BLOB TO DOCUMENT:C526("Catalog.sql"; $Blob)
End if 
