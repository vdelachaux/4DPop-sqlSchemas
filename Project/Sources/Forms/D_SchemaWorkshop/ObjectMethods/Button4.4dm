C_BOOLEAN:C305($Exit)
C_TEXT:C284($Doc)
C_BLOB:C604($Blob)
C_TIME:C306($Win)

Repeat 
	
	
	$Doc:=Select document:C905(""; ".sql"; "Select the catalog..."; Use sheet window:K24:11)
	
	$Exit:=True:C214
	
	If (Ok=1)
		$Doc:=document
		
		If ($Doc="@.sql")
			ExecutedSQL_t:=""
			Content_t:=""
			
			DOCUMENT TO BLOB:C525($Doc; $Blob)
			
			Content_t:=BLOB to text:C555($Blob; UTF8 text without length:K22:17)
			
			$Win:=Open form window:C675("D_SqlExecute"; Movable form dialog box:K39:8; Horizontally centered:K39:1; Vertically centered:K39:4)
			DIALOG:C40("D_SqlExecute")
			CLOSE WINDOW:C154
			$Exit:=True:C214
		Else 
			ALERT:C41("Error: You must select a .sql file.")
			$Exit:=False:C215
		End if 
		
	Else 
		$Exit:=True:C214
	End if 
	
Until ($Exit)
