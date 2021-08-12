//%attributes = {"invisible":true}

Case of 
	: (True:C214)
		SC_Dial_Workshop
		
	: (True:C214)
		ARRAY LONGINT:C221($al_ind_col_position; 0)
		
		Begin SQL
			SELECT _USER_IND_COLUMNS.COLUMN_POSITION FROM [_USER_IND_COLUMNS] INTO :$al_ind_col_position;
		End SQL
		
	: (True:C214)
		
		ARRAY TEXT:C222($ColumnName; 0)
		ARRAY LONGINT:C221($TableID; 0)
		ARRAY LONGINT:C221($ColumnID; 0)
		
		Begin SQL
			select  column_name, table_id, column_id from [_user_columns] where table_name = 'Clients2' into :$ColumnName, :$TableID, :$ColumnID;
		End SQL
		
		
		
	: (True:C214)
		
		
	: (True:C214)
		
		Begin SQL
			Drop Schema Schema1;  
			Create Schema MySchema;             
		End SQL
		
	: (True:C214)
		
		Begin SQL
			/*Drop Schema MySchema1;  */
			Create Schema MySchema1;  
			Grant Read on MySchema1 to Tester;
		End SQL
		
	: (True:C214)
		SC__ERR_Handler
		
	: (True:C214)
		C_TEXT:C284($SchemaName_t; $Read_t; $ReadWrite1_t; $ReadWrite2_t)
		
		Begin SQL
			create schema myschema2;
			
			
			SELECT SCHEMA_NAME, READ_GROUP_NAME, READ_WRITE_GROUP_NAME 
			FROM [_USER_SCHEMAS] WHERE SCHEMA_NAME = 'myschema2'
			 INTO :$SchemaName_t, :$Read_t, :$ReadWrite1_t ;
			
		End SQL
		
		
		Begin SQL
			
			GRANT READ ON myschema2 TO Contacts;
			
		End SQL
		
		
		Begin SQL
			
			SELECT SCHEMA_NAME, READ_GROUP_NAME, READ_WRITE_GROUP_NAME 
			FROM [_USER_SCHEMAS] WHERE SCHEMA_NAME = 'myschema2'
			 INTO :$SchemaName_t, :$Read_t, :$ReadWrite2_t ;
			
			
		End SQL
		//
		//$a:=$ReadWrite1_t  ` is <EVERYBODY>
		//$b:=$ReadWrite2_t  ` is empty
		
		
	: (True:C214)
		CHANGE CURRENT USER:C289
		
		//USERS TO BLOB
	: (True:C214)
		Begin SQL
			ALTER SCHEMA Schema_1 RENAME TO toto;
		End SQL
		
	: (True:C214)
		Begin SQL
			ALTER TABLE Clients SET SCHEMA DEFAULT_SCHEMA;
		End SQL
		
	: (True:C214)
		
		Begin SQL
			GRANT READ ON Untitled TO Contats;
			GRANT READ_WRITE ON Untitled TO Contats;
			GRANT ALL ON Untitled TO b_b_b;
		End SQL
		
		
	: (True:C214)
		
		Begin SQL
			/*CREATE SCHEMA Untitled;*/
			GRANT READ ON Untitled TO Contats;
			GRANT READ_WRITE ON Untitled TO Contats;
			GRANT ALL ON Untitled TO b_b_b;
		End SQL
		
	: (True:C214)
		
		Begin SQL
			CREATE SCHEMA DODO2;
			/*DROP SCHEMA DODO2;*/
			GRANT READ ON DODO2 TO Worlwide;
			
		End SQL
		
		
		Begin SQL
			/*GRANT READ_WRITE ON SCHEMA Untitled TO <NOBODY>;*/
			/*GRANT ALL ON SCHEMA Untitled TO <NOBODY>;*/
		End SQL
		
		WS_Read_Schemas
		
	: (True:C214)
		C_TEXT:C284($SchemaName_t)
		$SchemaName_t:=SC_Table_Get_Schema("Clients")
		SC_Table_Set_Schema("coucou"; "Untitled")
		
		SC_Table_Set_Schema("Clients"; "Untitled3")
		
		SC_Table_Set_Schema("Untitled"; "READ")
		
		SC_Table_Set_Schema("Untitled"; "READ")
		
		SC_Schema_Create
		
		
End case 
