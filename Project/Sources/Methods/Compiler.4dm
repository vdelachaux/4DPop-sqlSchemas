//%attributes = {"invisible":true,"publishedSql":true}
// Compiler
// Must be called in the Startup process
// Must be called each time a new process is created
//

var $1; $ForceInit_b : Boolean

If (Count parameters:C259>=1)
	
	$ForceInit_b:=$1
	
End if 

If ($ForceInit_b)
	
	// Arrays will be resized.. to 0
	<>IP_Inited_b:=False:C215
	PSS_Inited_b:=False:C215
	
End if 

// Are the interprocess inited ?

var <>IP_Inited_b : Boolean

If (Not:C34(<>IP_Inited_b))
	
	// We init the IP vars
	<>IP_Inited_b:=True:C214
	Compiler_Variables_Inter
	Compiler_Arrays_Inter
	
End if 

// Are proecss vars inited ?

var PSS_Inited_b : Boolean

If (Not:C34(PSS_Inited_b))
	
	// We init the process var.
	PSS_Inited_b:=True:C214
	Compiler_Variables
	Compiler_Arrays
	
End if 