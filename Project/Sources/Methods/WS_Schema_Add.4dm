//%attributes = {"invisible":true,"publishedSql":true}
// METHOD_NAME : WS_Read_Tables
// MODULE : WorkShop
// ============================================================================
// Description :

//  Creates a new schema.
//  Default name is provided and all controls are done here.
// The list containing Schema name is updated and the table listbox is reloaded to reflect the changes
// ============================================================================
C_TEXT:C284($Value_t)
C_LONGINT:C283($Value_l)
// ============================================================================

//Get the default name
$Value_l:=0
Repeat 
	$Value_l:=$Value_l+1
	$Value_t:="Schema_"+String:C10($Value_l)
Until (SC_Schema_Exists($Value_t)=False:C215)
$Value_t:=Request:C163("Schema Name"; $Value_t)


If (OK=1) & ($Value_t#"")
	//Create the schema
	SC_Schema_Create($Value_t)
	//reload from system table
	WS_Read_Schemas
	
	//Update the List so that the dropdown is up to date
	//TABLEAU VERS ENUMERATION(WS_SchemaDropDown_at;"Schemas")
	//CHOIX ENUMERATION(WS_TableSchemaName_at;"")
	//CHOIX ENUMERATION(WS_TableSchemaName_at;"Schemas")
	
	
	//Reload the listbox for tables
	WS_Read_Tables
	
	// Update the XML/SQL 
	WS_SQL_Update_Statement
End if 
// ============================================================================
//eom