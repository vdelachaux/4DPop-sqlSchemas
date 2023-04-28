//%attributes = {"invisible":true,"publishedSql":true}

// METHOD_NAME : WS_Dlg_SetColWidth
// Module : 
// Username : jpupier
// Created : 01/10/08, 14:42:14
// ============================================================================
// Description
// 
//
// Parameters
// ----------------------------------------------------
// Process_Variables
//
// ----------------------------------------------------
// Local_Variables
//
C_LONGINT:C283($ScrollBarWidth)
C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($RWAWidth; $NameWidth)

C_LONGINT:C283($AverageH; $AverageV)
C_LONGINT:C283($x1; $y1; $x2; $y2)

// ----------------------------------------------------
// Local_Init
//
// ----------------------------------------------------
// ============================================================================

$ScrollBarWidth:=LISTBOX Get property:C917(*; "Schemas_LB"; lk ver scrollbar width:K53:9)

//Schemas list box 
OBJECT GET COORDINATES:C663(*; "Schemas_LB"; $x1; $y1; $x2; $y2)

$RWAWidth:=110
$NameWidth:=$x2-$x1-$ScrollBarWidth-(3*$RWAWidth)

If ($NameWidth<100)
	$NameWidth:=100
	$RWAwidth:=($x2-$x1-$ScrollBarWidth-$NameWidth)/3
End if 

LISTBOX SET COLUMN WIDTH:C833(*; "WS_Read_at"; $RWAwidth)
LISTBOX SET COLUMN WIDTH:C833(*; "WS_ReadWrite_at"; $RWAwidth)
LISTBOX SET COLUMN WIDTH:C833(*; "WS_All_at"; $RWAwidth)
LISTBOX SET COLUMN WIDTH:C833(*; "WS_SchemaName_at"; $NameWidth)


//Tables list box 
OBJECT GET COORDINATES:C663(*; "Tables_LB"; $x1; $y1; $x2; $y2)
$NameWidth:=($x2-$x1-$ScrollBarWidth)/2
LISTBOX SET COLUMN WIDTH:C833(*; "WS_TableName_at"; $NameWidth)
LISTBOX SET COLUMN WIDTH:C833(*; "WS_TableSchemaName_at"; $NameWidth)


//Splitters bullets
OBJECT GET COORDINATES:C663(*; "hSplitter"; $x1; $y1; $x2; $y2)
$AverageH:=($x1+$x2)/2
$AverageV:=($y1+$y2)/2
OBJECT MOVE:C664(*; "hBUllet"; $AverageH-4; $AverageV-4; $AverageH+4; $AverageV+4; *)

OBJECT GET COORDINATES:C663(*; "vSplitter"; $x1; $y1; $x2; $y2)
$AverageH:=($x1+$x2)/2
$AverageV:=($y1+$y2)/2
OBJECT MOVE:C664(*; "vBUllet"; $AverageH-4; $AverageV-4; $AverageH+4; $AverageV+4; *)

// ============================================================================
//eof





