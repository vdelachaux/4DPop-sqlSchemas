C_LONGINT:C283($Element_l)

Case of 
		
		//________________________________________
	: (Form event code:C388=On Selection Change:K2:29)
		
		$Element_l:=Find in array:C230(WS_Tables_ab; True:C214)
		
		If ($Element_l>=1)
			
			OBJECT SET ENABLED:C1123(WS_bDropTable; True:C214)
			
		Else 
			
			OBJECT SET ENABLED:C1123(WS_bDropTable; False:C215)
			
		End if 
		
		//________________________________________
	: (Form event code:C388=On Double Clicked:K2:5)
		
		WS_Table_Rename
		
		//________________________________________
End case 