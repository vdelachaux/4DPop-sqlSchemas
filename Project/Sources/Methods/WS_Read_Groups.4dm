//%attributes = {"invisible":true}
// METHOD_NAME : WS_Read_Groups
// MODULE :  WorkShop
// ============================================================================
// Description :

//  Loads the group list into an array
//  A second array is built adding the one virtual group ( <NOBODY>) for the schemes
// The second array is stored in a list and used as a dropdown in the schema definition
// ============================================================================

ARRAY TEXT:C222(WS_GroupNames_at; 0)
ARRAY LONGINT:C221(WS_GroupNumbers_al; 0)

//Load the groups with 4D command
GET GROUP LIST:C610($WS_GroupNames_at; WS_GroupNumbers_al)
COPY ARRAY:C226($WS_GroupNames_at; WS_GroupNames_at)

//Append to this array the virtual groups
ARRAY TEXT:C222($WS_Groups_at; 0)

INSERT IN ARRAY:C227($WS_GroupNames_at; 1; 1)
$WS_GroupNames_at{1}:="NOBODY"  // Do not use <NOBODY>, it will fail in the popup menu


//TABLEAU VERS ENUMERATION($WS_GroupNames_at;"Groups")

//Update dynamic menu
C_TEXT:C284(<>RefGroupsMenu)
RELEASE MENU:C978(<>RefGroupsMenu)
<>RefGroupsMenu:=Create menu:C408("MenuGroups")

C_LONGINT:C283($i)
For ($i; 1; Size of array:C274($WS_GroupNames_at))
	APPEND MENU ITEM:C411(<>RefGroupsMenu; $WS_GroupNames_at{$i})
	SET MENU ITEM PARAMETER:C1004(<>RefGroupsMenu; -1; $WS_GroupNames_at{$i})
End for 


// ============================================================================
//eom


