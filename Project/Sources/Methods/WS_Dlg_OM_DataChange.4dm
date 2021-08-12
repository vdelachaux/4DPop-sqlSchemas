//%attributes = {"invisible":true}
C_POINTER:C301($1; $ObjectPtr_p)
$ObjectPtr_p:=$1

C_TEXT:C284($Group_t)
C_TEXT:C284($SchemaName_t)
C_TEXT:C284($Right_t)
C_LONGINT:C283($Pos)
C_TEXT:C284($TableName_t)


C_LONGINT:C283($Column; $Line)
C_TEXT:C284($LB)
C_BOOLEAN:C305($DataChanged)
C_TEXT:C284($Ref)

Case of 
	: ($ObjectPtr_p=(->WS_Read_at))
		$LB:="Schemas_LB"
	: ($ObjectPtr_p=(->WS_ReadWrite_at))
		$LB:="Schemas_LB"
	: ($ObjectPtr_p=(->WS_All_at))
		$LB:="Schemas_LB"
	: ($ObjectPtr_p=(->WS_TableSchemaName_at))
		$LB:="Tables_LB"
	Else 
		$LB:=""
		BEEP:C151
End case 

If ($LB#"")
	
	$DataChanged:=False:C215
	
	LISTBOX GET CELL POSITION:C971(*; $LB; $Column; $Line)
	
	If ($LB="Schemas_LB")
		
		If ($Line>0) & ($Line<=Size of array:C274(WS_Schemas_ab))
			$Ref:=Dynamic pop up menu:C1006(<>RefGroupsMenu)
			If ($Ref#"") & ($Ref#$ObjectPtr_p->{$Line})
				$ObjectPtr_p->{$Line}:=$Ref
				$DataChanged:=True:C214
			End if 
		End if 
		
	Else 
		
		If ($Line>0) & ($Line<=Size of array:C274(WS_Tables_ab))
			$Ref:=Dynamic pop up menu:C1006(<>RefSchemasMenu)
			If ($Ref#"") & ($Ref#$ObjectPtr_p->{$Line})
				$ObjectPtr_p->{$Line}:=$Ref
				$DataChanged:=True:C214
			End if 
		End if 
		
	End if 
	
	If ($DataChanged)
		
		$Pos:=$ObjectPtr_p->
		
		Case of 
			: ($Pos=0)
				
				
			: ($ObjectPtr_p=(->WS_TableSchemaName_at))
				$TableName_t:=WS_TableName_at{$Pos}
				$SchemaName_t:=WS_TableSchemaName_at{$Pos}
				
				SC_Table_Set_Schema($TableName_t; $SchemaName_t)
				WS_Read_Tables
				
			Else 
				
				$Group_t:=$ObjectPtr_p->{$Pos}
				$SchemaName_t:=WS_SchemaName_at{$Pos}
				Case of 
					: ($ObjectPtr_p=(->WS_Read_at))
						$Right_t:="READ"
						
					: ($ObjectPtr_p=(->WS_ReadWrite_at))
						$Right_t:="READ_WRITE"
						
					: ($ObjectPtr_p=(->WS_All_at))
						$Right_t:="ALL"
						
					Else 
						TRACE:C157
				End case 
				
				
				Case of 
					: ($Group_t="NOBODY")  //Due to pop limitation, we have not set <NOBODY>
						SC_Schema_Right_Revoke($SchemaName_t; $Right_t)
						
						$ObjectPtr_p->{$Pos}:=SC_K_Nobody
						
					Else 
						SC_Schema_Right_Grant($SchemaName_t; $Right_t; $Group_t)
						
				End case 
				
				
		End case 
		
		WS_SQL_Update_Statement
		
	End if 
	
End if 
