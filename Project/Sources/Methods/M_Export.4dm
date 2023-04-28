//%attributes = {"invisible":true,"publishedSql":true}
C_TIME:C306($ref)
C_BOOLEAN:C305($IncludeSQL_b)
C_TEXT:C284($Root_t)

If (OK=1)
	// =================== [ Dummy filling ] =====================
	//Dummy_System_Tables 
	
	
	
	Text_t:=""
	Case of 
		: (rbXML=1) & (cbSQL=0)
			M_Export_XML
			
		: (rbXML=1) & (cbSQL=1)
			M_Export_XML_SQL
			
		: (rbSQL=1)
			M_Export_SQL
			
			
		Else 
			TRACE:C157
			
	End case 
	
	
	SHOW ON DISK:C922(Document)
	
	
	
End if 
