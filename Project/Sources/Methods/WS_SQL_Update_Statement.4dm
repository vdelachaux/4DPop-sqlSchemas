//%attributes = {"invisible":true,"publishedSql":true}
C_BOOLEAN:C305($IncludeSQL_b)
C_TEXT:C284($Text_t)
C_TEXT:C284($Root_t)

Case of 
	: (rbXML=1)
		$IncludeSQL_b:=(cbSQL=1)
		$Root_t:=Export_Schema_XML2(->WS_SchemaName_at; ->WS_Read_at; ->WS_ReadWrite_at; ->WS_All_at; ->WS_TableName_all_at; ->WS_TableSchemaName_all_at; $IncludeSQL_b)
		DOM EXPORT TO VAR:C863($Root_t; $Text_t)
		DOM CLOSE XML:C722($Root_t)
		
		
	: (rbSQL=1)
		$Text_t:=Export_Schemas_SQL(->WS_SchemaName_at; ->WS_Read_at; ->WS_ReadWrite_at; ->WS_All_at; ->WS_TableName_all_at; ->WS_TableSchemaName_all_at)
		
		
	Else 
		
		TRACE:C157
		
End case 

If (cbEncode=1)
	C_BLOB:C604($Blob)
	C_LONGINT:C283($Loop_l)
	C_TEXT:C284($Char)
	
	TEXT TO BLOB:C554($Text_t; $Blob; UTF8 text without length:K22:17)
	BASE64 ENCODE:C895($Blob)
	$Text_t:=BLOB to text:C555($Blob; UTF8 text without length:K22:17)
	
End if 


Statement_t:=$Text_t