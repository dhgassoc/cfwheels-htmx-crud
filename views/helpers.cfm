<cfscript>
// Place helper functions here that should be available for use in all view pages of your application.
/**
 *	Convert any argument names that start with lower case "hx_", 
 * 		replace all "_" (underscores) with "-" (hyphen)
 *
 *	see https://stackoverflow.com/questions/5070380/using-hyphens-in-argument-names
 *
 *	returns	
 */
public any function convert_hx_args() {
	// local.argumentCollection = arguments;
	local.retArgs = {};
	if (ArrayLen(arguments) > 1) {
		for (local.key in arguments) {
			StructInsert( 
			local.retArgs, 
				( 
				  (Left(local.key,3) == "hx_") 
				  ? (Replace(local.key, "_", "-", "ALL"))
				  : (local.key) 
				  )				  
				, 
				arguments[local.key] 
				);
		}
	}
	
	return local.retArgs;
}
</cfscript>
