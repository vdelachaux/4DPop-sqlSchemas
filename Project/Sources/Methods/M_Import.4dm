//%attributes = {"invisible":true,"publishedSql":true}
ExecutedSQL_t:=""
Import_Schemas

If (ExecutedSQL_t="")
	ALERT:C41("No SQL code detected...")
	
Else 
	
	//confi (ExecutedSQL_t;"OK";"Cancel";"Execute SQL :")
	
End if 
