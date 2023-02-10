/**
 * This is the parent controller file that all your controllers should extend.
 * You can add functions to this file to make them available in all your controllers.
 * Do not delete this file.
 *
 * NOTE: When extending this controller and implementing `config()` in the child controller, don't forget to call this
 * base controller's `config()` via `super.config()`, or else the call to `protectsFromForgery` below will be skipped.
 *
 * Example controller extending this one:
 *
 * component extends="Controller" {
 *   function config() {
 *     // Call parent config method
 *     super.config();
 *
 *     // Your own config code here.
 *     // ...
 *   }
 * }
 */
component extends="wheels.Controller" {

	/* FIX adobe-2016 ERROR: "Could not find the included template ../../views/examples/setlayout.cfm. "
            ** When specifying conditions or a function, pass in 'true' to use the 
            ** default layout.cfm if none of the conditions are met. 
            * Need to change function from "private" to "Public", 
            * so that the IsCustomFunction( "setLayout" ) in 
            * wheels usesLayout() function will return true
            */
	public string function setLayout() {
		if (isHTMXRequest()) {
			return false;
		} 
	}


	function config() {
		protectsFromForgery();
		usesLayout( "setLayout" );
	}


	/**
	 * Returns true if a request has the htmx header present
	 */
	public boolean function isHTMXRequest() {
		return StructKeyExists(GetHTTPRequestData().headers, "HX-Request");
	}

}
