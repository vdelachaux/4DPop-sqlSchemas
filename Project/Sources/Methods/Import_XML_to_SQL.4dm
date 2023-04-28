//%attributes = {"invisible":true,"publishedSql":true}
C_TEXT:C284($0; $SQL_t)
$SQL_t:=""
C_TEXT:C284($1; $name_t)
$name_t:=$1
C_TEXT:C284($2; $prefix_t)
$prefix_t:=$2
C_POINTER:C301($3; $attrNames_p)
$attrNames_p:=$3
C_POINTER:C301($4; $attrValues_p)
$attrValues_p:=$4

C_TEXT:C284($SchemaName_t)
C_TEXT:C284($Read_t)
C_TEXT:C284($Read_Write_t)
C_TEXT:C284($All_t)
C_TEXT:C284($Group)
C_TEXT:C284($TableName_t)

Case of 
	: ($name_t="Schema")
		
		Case of 
			: (Find in array:C230($attrNames_p->; "name")=-1)
			: (Find in array:C230($attrNames_p->; "read")=-1)
			: (Find in array:C230($attrNames_p->; "read_write")=-1)
			: (Find in array:C230($attrNames_p->; "all")=-1)
			: (Find in array:C230($attrNames_p->; "group")=-1)
			Else 
				$SchemaName_t:=$attrValues_p->{Find in array:C230($attrNames_p->; "name")}
				$Read_t:=$attrValues_p->{Find in array:C230($attrNames_p->; "read")}
				$Read_Write_t:=$attrValues_p->{Find in array:C230($attrNames_p->; "read_write")}
				$All_t:=$attrValues_p->{Find in array:C230($attrNames_p->; "all")}
				$Group:=$attrValues_p->{Find in array:C230($attrNames_p->; "group")}
				
				$SQL_t:=$SQL_t+"CREATE SCHEMA "+$SchemaName_t+";\r"
				
				If ($Read_t="true")
					$SQL_t:=$SQL_t+"GRANT READ ON SCHEMA "+$SchemaName_t+" TO "+$Group+";\r"
				End if 
				If ($Read_Write_t="true")
					$SQL_t:=$SQL_t+"GRANT READ_WRITE ON SCHEMA "+$SchemaName_t+" TO "+$Group+";\r"
				End if 
				If ($All_t="true")
					$SQL_t:=$SQL_t+"GRANT ALL ON SCHEMA "+$SchemaName_t+" TO "+$Group+";\r"
				End if 
				$SQL_t:=$SQL_t+"\r"
		End case 
		
		
	: ($name_t="Table")
		Case of 
			: (Find in array:C230($attrNames_p->; "name")=-1)
			: (Find in array:C230($attrNames_p->; "schema")=-1)
			Else 
				
				$TableName_t:=$attrValues_p->{Find in array:C230($attrNames_p->; "name")}
				$SchemaName_t:=$attrValues_p->{Find in array:C230($attrNames_p->; "schema")}
				
				$SQL_t:=$SQL_t+"ALTER TABLE "+$TableName_t+" SET SCHEMA "+$SchemaName_t+";\r"
				$SQL_t:=$SQL_t+"\r"
				
		End case 
		
	Else 
		TRACE:C157
End case 

$0:=$SQL_t