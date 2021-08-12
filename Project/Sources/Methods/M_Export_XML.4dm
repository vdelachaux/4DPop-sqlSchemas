//%attributes = {"invisible":true}
//Dummy_System_Tables 

C_BOOLEAN:C305($IncludeSQL_b)
C_TEXT:C284($Root_t)

$IncludeSQL_b:=False:C215
$Root_t:=Export_Schemas_XML(->WS_SchemaName_at; ->WS_Read_at; ->WS_ReadWrite_at; ->WS_All_at; ->WS_TableName_at; ->WS_TableSchemaName_at; $IncludeSQL_b)
DOM EXPORT TO FILE:C862($Root_t; "Catalog.xml")
DOM CLOSE XML:C722($Root_t)
