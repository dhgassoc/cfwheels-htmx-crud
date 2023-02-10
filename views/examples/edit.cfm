<cfoutput>
	#includePartial("/shared/header")#
	#errorMessagesFor(objectName = "example", class = "bad color")#
    
    <cfscript>
 /* HACK:	because codefusion variables/arguments can not have hyphens in name */

 		
</cfscript>
		#startFormTag(argumentCollection=	
        	convert_hx_args( 
                hx_put= UrlFor(route = "Example", key = example.key()),
                hx_target= "##htmx-container"
            )
		)#
		#includePartial("fields")#
		#buttonTag(argumentCollection=		
        	convert_hx_args( 
                hx_get= UrlFor(route = "Example", key = example.key()),
                hx_target= "##htmx-container",
                hx_push_url= true,
                content= "Back")
        	)#
		#buttonTag(content = "Save")#
		#endFormTag()#
		#includePartial("/shared/footer")#
</cfoutput>