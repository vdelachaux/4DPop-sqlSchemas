//%attributes = {"invisible":true}
// METHOD_NAME : WS_Read_Groups
// MODULE : WorkShop
// ============================================================================
// Description :

//  Loads the schema definition afrom the system table and populate arrays used in listbox.
//  The schema list is stored in a list used for the drop down in the table list.
// The defaut schema is removed from the main listbox
// ============================================================================

//Load the values from system table
SC_Schemas_Load(->WS_SchemaName_at; ->WS_Read_at; ->WS_ReadWrite_at; ->WS_All_at; ->WS_SchemaID_al)

//Do some sort
SORT ARRAY:C229(WS_SchemaName_at; WS_Read_at; WS_ReadWrite_at; WS_All_at; WS_SchemaID_al; >)

//Get a copy of the actual list of schemas
COPY ARRAY:C226(WS_SchemaName_at; WS_SchemaDropDown_at)  //Keep all the schema names for the drop down


//Update dynamic menu
C_TEXT:C284(<>RefSchemasMenu)
RELEASE MENU:C978(<>RefSchemasMenu)
<>RefSchemasMenu:=Create menu:C408("MenuSchemas")
C_LONGINT:C283($i)
For ($i; 1; Size of array:C274(WS_SchemaDropDown_at))
	APPEND MENU ITEM:C411(<>RefSchemasMenu; WS_SchemaDropDown_at{$i})
	SET MENU ITEM PARAMETER:C1004(<>RefSchemasMenu; -1; WS_SchemaDropDown_at{$i})
End for 


//  `Remove the Default_schema from the listbox.
//C_LONGINT($Pos)
//$Pos:=Find in array(WS_SchemaName_at;SC_K_Default )
//If ($Pos>=1)
//DELETE FROM ARRAY(WS_SchemaName_at;$Pos;1)
//DELETE FROM ARRAY(WS_Read_at;$Pos;1)
//DELETE FROM ARRAY(WS_ReadWrite_at;$Pos;1)
//DELETE FROM ARRAY(WS_All_at;$Pos;1)
//DELETE FROM ARRAY(WS_SchemaID_al;$Pos;1)
//End if 


// ============================================================================
//eof

