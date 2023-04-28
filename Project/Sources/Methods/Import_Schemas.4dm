//%attributes = {"invisible":true,"publishedSql":true}
C_TEXT:C284($Doc)
C_TEXT:C284($Root)
C_TEXT:C284($Ref)
C_TEXT:C284($CData)
C_TEXT:C284($CData2)
C_BLOB:C604($Blob)
C_BOOLEAN:C305($IsSQL_b; $IsXML_SQL_b; $IsXML_Simple_b)
C_TEXT:C284($SQL_t)
C_TIME:C306($DocRef)
C_LONGINT:C283($SAX_Event_l)

$Doc:=Select document:C905(""; "xml;sql;b64"; "Select the catalog..."; 0)
If (OK=1)
	ExecutedSQL_t:=""
	Content_t:=""
	
	DOCUMENT TO BLOB:C525($Doc; $Blob)
	
	If ($Doc="@.b64")
		BASE64 DECODE:C896($Blob)
	End if 
	
	Content_t:=BLOB to text:C555($Blob; UTF8 text without length:K22:17)
	
	
	Case of 
		: ($Doc="@.sql")
			$IsSQL_b:=True:C214
			
		: ($Doc="@.xml")
			$Root:=DOM Parse XML variable:C720($Blob)
			If (OK=1)
				$Ref:=DOM Find XML element:C864($Root; "/Catalog/SQL/")
				If (OK=1)
					$IsXML_SQL_b:=True:C214
				Else 
					$IsXML_Simple_b:=True:C214
					OK:=1
				End if 
			End if 
			
			
	End case 
	
End if 


Case of 
	: (OK=0)
		
	: ($IsSQL_b)
		ExecutedSQL_t:=Content_t
		
	: ($IsXML_SQL_b)
		DOM GET XML ELEMENT VALUE:C731($Ref; $CData; $CData2)
		DOM CLOSE XML:C722($Root)
		ExecutedSQL_t:=$CData2
		
	: ($IsXML_Simple_b)
		$SQL_t:=""
		DOM CLOSE XML:C722($Root)
		
		$DocRef:=Open document:C264($Doc; "xml"; Read mode:K24:5)
		If (OK=1)
			Repeat 
				$SAX_Event_l:=SAX Get XML node:C860($DocRef)
				Case of 
					: ($SAX_Event_l=XML start document:K45:7)
						//DoSomething
					: ($SAX_Event_l=XML comment:K45:8)
						//DoSomethingElse
					: ($SAX_Event_l=XML processing instruction:K45:9)
						//DoSomethingElse
					: ($SAX_Event_l=XML start element:K45:10)
						SAX GET XML ELEMENT:C876($DocRef; $name; $prefix; $attrNames; $attrValues)
						If ($name="Schema") | ($name="Table")
							$SQL_t:=$SQL_t+Import_XML_to_SQL($name; $prefix; ->$attrNames; ->$attrValues)
						End if 
						
					: ($SAX_Event_l=XML end element:K45:11)
						//DoSomethingElse
					: ($SAX_Event_l=XML DATA:K45:12)
						//DoSomethingElse
					: ($SAX_Event_l=XML CDATA:K45:13)
						//DoSomethingElse
					: ($SAX_Event_l=XML entity:K45:14)
						//DoSomethingElse
						
				End case 
				
			Until ($SAX_Event_l=XML end document:K45:15)
			
			ExecutedSQL_t:=$SQL_t
		End if 
		CLOSE DOCUMENT:C267($DocRef)
		
		
End case 
