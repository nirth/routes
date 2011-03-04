
package eu.kiichigo.utils.strings
{
	/**
	 *  Capitalizes <code>String</code>.
	 * 
	 *  @param		string
	 * 
	 *  @return					Same string, with first char - capitalized. 
	 */
	public function capitalize( string:String ):String {
		var letters:Array = string.split( "" );
			letters[0] = letters[0].toUpperCase();
		return letters.join( "" );
	}
}