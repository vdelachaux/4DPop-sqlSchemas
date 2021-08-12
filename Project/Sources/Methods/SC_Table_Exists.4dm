//%attributes = {"invisible":true,"shared":true,"publishedSql":true}
// METHOD_NAME : SC_Table_Exists
// Module : SC
// Username : jpupier
// Created : 01/10/08, 15:05:33
// ============================================================================
// Description
// Returns True if the given table name exists
//
// Parameters
C_TEXT:C284($1; SC_private_TableName_t)
SC_private_TableName_t:=$1
C_BOOLEAN:C305($0; $TableExists_b)
$TableExists_b:=False:C215
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
C_LONGINT:C283(SC_private_Count_l)
//
// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

// Just check the schema exists . We can also have used select count
Begin SQL
	select count(*) from [_USER_TABLES] where TABLE_NAME = :SC_private_TableName_t into :SC_private_Count_l;
End SQL


If (SC_private_Count_l=1)
	$TableExists_b:=True:C214
End if 


// ============================================================================
$0:=$TableExists_b
//eof





