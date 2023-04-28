//%attributes = {"invisible":true,"publishedSql":true}

Compiler

If (<>DB_Version="")  // Not yet inited
	<>DB_Version:="1.1"
	<>DB_Date:=!2008-10-02!
	<>WS_WindowTitle_t:="Schema Workshop - version "+String:C10(<>DB_Version)+" ("+String:C10(<>DB_Date)+")"
	
	Begin SQL
		/*
		
		====================================
		v1.1 Change log - 01/10/08 
		- Code comments
		-  Adapted to 4DPop
		- Added version control : crash with previous versions of 4D. 
		- Changed local variables used in SQL statements: they are not recognized  within a component in compiled mode, 
		
		====================================
		v1.0 Change log - 25/09/08 
		- 1st version as a component :-)
		- Roland's relooking :o)
		- Handle rights as popup: lists are not supported within a component
		-
		
		====================================
		v0.0006 Change log - 23/09/08 
		- handle group selection : update the schema list
		-
		
		====================================
		v0.0005 Change log - 11/09/08 
		- Added filter for tables
		-
		
		====================================
		v0.0004 Change log - 10/09/08 
		- Included default_schema in listbox (reflects the settings in the preferences SQL pane
		- Revoke right when group is <nobody>
		- User interface cleaning
		- Code cleaning
		- 
		
		  `====================================
		  ` v0.0003 Change log - 09/09/08
		  - Added some code documentation
		  -   
		
		*/
	End SQL
	
End if 






