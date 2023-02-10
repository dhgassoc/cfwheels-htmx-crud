<cfoutput> 
	#includePartial("/shared/header")#
    #errorMessagesFor(objectName = "example", class = "bad color")#

    #startFormTag(argumentCollection= convert_hx_args( 
		hx_post		= UrlFor( route = 'Examples' ),
		hx_target	= '##htmx-container')
        )#
    #includePartial("fields")#
    
    #buttonTag(argumentCollection= convert_hx_args( 
			hx_get = UrlFor(route = "Examples"),
			hx_target = "##htmx-container",
			hx_push_url = true,
			content = "Back" )
    )# 
    #buttonTag(content = "Save")#
    #endFormTag()#
    
    #includePartial("/shared/footer")# 
    
    
    <script>
   htmx.on("htmx:responseError", function(evt) {
     var errdiv = document.getElementById("error-messages");
     errdiv.innerHTML = '<div id="errormessagealert" class="container mt-3 mb-3 alert bad" role="alert">'
	 	 + ' <h4>Request Error: ' + evt.detail.xhr.status
         + '<span style="float:right;"><a onclick="errormessagealert_off()">Close [X]</a></span></h4><code>'
		 + evt.detail.xhr.responseText + '</code></div>';
     errormessagealert_on();
   });

  function errormessagealert_on() {
    document.getElementById("errormessagealert").style.display = "block";
  }

  function errormessagealert_off() {
    document.getElementById("errormessagealert").style.display = "none";
  }
</script>     
</cfoutput> 