//%attributes = {"invisible":true}
// METHOD_NAME : WS_Schema_Drop
// MODULE : WorkShop
// ============================================================================
// Description :

//  Drops an existing schema.
// The list containing Schema name is updated and the table listbox is reloaded to reflect the changes
// ============================================================================
C_TEXT:C284($1; $SchemaName_t)
$SchemaName_t:=$1

// ============================================================================

If ($SchemaName_t=SC_K_Default)
	ALERT:C41(SC_K_Default+" cannot be dropped.")
Else 
	
	// Drop the schema
	SC_Schema_Drop($SchemaName_t)
	
	// If no error returned
	If (OK=1)
		//Reload system table
		WS_Read_Schemas
		
		// Update drop down
		//TABLEAU VERS ENUMERATION(WS_SchemaDropDown_at;"Schemas")
		//CHOIX ENUMERATION(WS_TableSchemaName_at;"")
		//CHOIX ENUMERATION(WS_TableSchemaName_at;"Schemas")
		
		//Update the table listbox
		WS_Read_Tables
		
		//Update SQL/XML
		WS_SQL_Update_Statement
	End if 
End if 

// ============================================================================
// eom