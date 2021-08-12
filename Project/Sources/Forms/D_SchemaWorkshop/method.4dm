// METHOD_NAME : WS_Dlg_FM
// MODULE : Workshop
// Description
// Dialog form method
// ============================================================================

Case of 
		
		//________________________________________
	: (False:C215)
		
		SET TIMER:C645(0)
		
		//________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		Compiler
		APP_Init
		
		rbSQL:=1
		cbSQL:=0
		WS_cbFilterTables:=0
		
		OBJECT SET ENABLED:C1123(cbSQL; False:C215)
		OBJECT SET ENABLED:C1123(WS_bDropSchema; False:C215)
		OBJECT SET ENABLED:C1123(WS_bDropTable; False:C215)
		WS_Read_System_Tables
		WS_SQL_Update_Statement
		
		SET WINDOW TITLE:C213(<>WS_WindowTitle_t)
		
		If (Application type:C494=4D Remote mode:K5:5)
			
			SET TIMER:C645(30*60)
			
		End if 
		
		OBJECT SET FONT:C164(*; "@"; OBJECT Get font:C1069(*; ""))
		
		WS_Dlg_SetColWidth
		
		//________________________________________
	: (Form event code:C388=On Timer:K2:25)
		
		WS_Read_System_Tables
		WS_SQL_Update_Statement
		
		//________________________________________
	: (Form event code:C388=On Resize:K2:27)
		
		WS_Dlg_SetColWidth
		
		//________________________________________
	: (Form event code:C388=On Activate:K2:9)
		
		// System table may have change while in the design mode
		// Added table, Added groups..
		WS_Read_System_Tables
		WS_SQL_Update_Statement
		
		//________________________________________
	: (Form event code:C388=On Unload:K2:2)
		
		C_TEXT:C284(<>RefSchemasMenu)
		C_TEXT:C284(<>RefGroupsMenu)
		
		RELEASE MENU:C978(<>RefSchemasMenu)
		RELEASE MENU:C978(<>RefGroupsMenu)
		
		APP_Deinit
		
		//________________________________________
End case 

// ============================================================================
// Eof