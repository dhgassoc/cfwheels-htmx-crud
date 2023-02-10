<cfoutput>
	#includePartial("/shared/header")#

	<dl>
		<dt>ID:</dt><dd>#example.key()#</dd>
		<dt>Name:</dt><dd>#example.name#</dd>
		<dt>Type:</dt><dd>#example.type#</dd>
		<dt>Created:</dt><dd>#timeAgoInWords(example.createdAt)#</dd>
	</dl>

		#buttonTag( argumentCollection= 
        	convert_hx_args(
            content=	"Back",
			hx_get=		UrlFor( route = 'Examples' ),
			hx_target=	"##htmx-container",
			hx_push_url=true,
			class= 		"float<" )
			)#

		#buttonTag( argumentCollection= convert_hx_args(
			content= 	 "Edit",
        	hx_get=		 "#UrlFor( route = 'editExample', key = example.key() )#",
			hx_target=	 "##htmx-container",
			hx_push_url= true,
			class= 		 "float<" )
        	)#
		#buttonTo( argumentCollection= convert_hx_args(
        	hx_delete=		"#UrlFor( route = 'Example', key = example.key() )#",
			hx_target=		"##htmx-container",
			hx_confirm= 	"Are you sure?",
			text= 			"Delete",
			class= 			"float<" )
    	    )#
		#includePartial("/shared/footer")#
</cfoutput>
