//%attributes = {"invisible":true}
C_LONGINT:C283($Action_l; $Loop_l; $Pos)
C_TEXT:C284($SchemaName_t)

$Pos:=Find in array:C230(WS_Schemas_ab; True:C214)

If ($Pos>=1)
	
	$SchemaName_t:=WS_SchemaName_at{$Pos}
	
End if 

If (WS_cbFilterTables=0)
	
	For ($Loop_l; 1; Size of array:C274(WS_TableName_at); 1)
		
		$Action_l:=lk remove from selection:K53:3
		
		If (WS_TableSchemaName_at{$Loop_l}=$SchemaName_t)
			
			$Action_l:=lk add to selection:K53:2
			
		End if 
		
		LISTBOX SELECT ROW:C912(WS_Tables_ab; $Loop_l; $Action_l)
		
	End for 
	
Else 
	
	LISTBOX SELECT ROW:C912(WS_Tables_ab; 0; lk remove from selection:K53:3)
	
End if 

If ($Pos<0)\
 | ($SchemaName_t=SC_K_Default)
	
	OBJECT SET ENABLED:C1123(WS_bDropSchema; False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(WS_bDropSchema; True:C214)
	
End if 

WS_Read_Tables