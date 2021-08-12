//TRACE
C_TEXT:C284($Path_t)
C_TEXT:C284($FileName_t)
C_BLOB:C604($Blob_x)

$Path_t:=Get 4D folder:C485(Database folder:K5:14; *)

If (rbXML=1)
	$FileName_t:="information.schema.xml"
Else 
	$FileName_t:="information.schema.sql"
End if 

If (cbEncode=1)
	$FileName_t:=$FileName_t+".b64"
End if 



TEXT TO BLOB:C554(Statement_t; $Blob_x; UTF8 text without length:K22:17)
BLOB TO DOCUMENT:C526(($Path_t+$FileName_t); $Blob_x)
ALERT:C41("\""+$FileName_t+"\" saved in the database folder")

