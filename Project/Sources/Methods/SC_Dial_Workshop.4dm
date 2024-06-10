//%attributes = {"invisible":true,"publishedSql":true}
C_POINTER:C301($1; $Ptr)
C_LONGINT:C283($2)
C_LONGINT:C283($pss)
C_TIME:C306($Ref)
C_TEXT:C284($String_t)

Compiler
APP_Init


If (Count parameters:C259<=1)
	
	If (Not:C34(SC_Schemas_Supported))
		$String_t:=Application version:C493[[1]]+Application version:C493[[2]]+"."+Application version:C493[[3]]
		ALERT:C41("sqlSchemas : \r\rYou are running 4D version "+$String_t+".\rSchemas are supported only by versions 11.3 and above.")
	Else 
		
		If (<>WS_PssID=0)
			<>WS_PssID:=New process:C317("SC_Dial_Workshop"; 0; "SC_Dial_Workshop"; $Ptr; Red:K11:4; *)
		Else 
			BRING TO FRONT:C326(<>WS_PssID)
		End if 
		
	End if 
	
Else 
	
	
	$Ref:=Open form window:C675("D_SchemaWorkshop"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	DIALOG:C40("D_SchemaWorkshop")
	CLOSE WINDOW:C154
	<>WS_PssID:=0
	
End if 

