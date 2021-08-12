//%attributes = {"invisible":true}

//TRACE
C_LONGINT:C283($Error)

If (Error#0)
	gError:=Error
	Error:=0
	
	Case of 
		: (gError=-1)
		Else 
			TRACE:C157
	End case 
	
	ARRAY LONGINT:C221($Errors_al; 0)
	ARRAY TEXT:C222($intCompArray; 0)
	ARRAY TEXT:C222($TextArray; 0)
	
	GET LAST ERROR STACK:C1015($Errors_al; $intCompArray; $TextArray)
	ALERT:C41("An error occured : \r\r"+"Error "+String:C10($Errors_al{1})+" in Module "+$intCompArray{1}+"\r\r"+$TextArray{1})
	
	TRACE:C157
End if 
