//%attributes = {"invisible":true,"publishedSql":true}
C_TEXT:C284($1; $MethodName_t)
$MethodName_t:=$1
C_TEXT:C284($2; $Error_t)
$Error_t:=$2
C_TEXT:C284($3; $Infos_t)

C_TEXT:C284($ErrorMessage_t)


$ErrorMessage_t:=""
$ErrorMessage_t:=$ErrorMessage_t+"Error in :\r"
$ErrorMessage_t:=$ErrorMessage_t+$MethodName_t+"\r\r"

If (Count parameters:C259>=3)
	$Infos_t:=$3
	
	$ErrorMessage_t:=$ErrorMessage_t+$Error_t+"\r\r"
	$ErrorMessage_t:=$ErrorMessage_t+$Infos_t
	
End if 



ALERT:C41($ErrorMessage_t)
//