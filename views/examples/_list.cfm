<cfoutput>
<p>URLFor(route = "newExample")</p>

<cfset v="#convert_hx_args( 
			hx_get= 	URLFor(route = "newExample"),
			hx_target=	"##htmx-container",
			hx_push_url=true,
			content= "New Example"
            )#"
			 />
<cfdump var="#v.content#" label="v.content" />


    	#buttonTag( argumentCollection= 
        convert_hx_args( 
			content= "New Example",
			hx_get= 	URLFor(route = "newExample"),
			hx_target=	"##htmx-container",
			hx_push_url=true
            )
			)#
    
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Type</th>
			</tr>
		</thead>
		<tbody>
			<cfloop query="examples">
          
				<tr>
					<td>#examples.id#</td>
					<td>
						#linkTo(argumentCollection= 
                        convert_hx_args(                         
                            hx_get= "#URLFor(route = 'Example', key = examples.id)#",
                            hx_target= "##htmx-container",
                            hx_push_url= true,
                            text= examples.name
    					) )#
					</td>
					<td>#examples.type#</td>
				</tr>
			</cfloop>
		</tbody>
	</table>
</cfoutput>
