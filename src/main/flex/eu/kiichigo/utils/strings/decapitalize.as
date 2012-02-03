
package eu.kiichigo.utils.strings
{
	/**
	 *  Capitalizes <code>String</code>.
	 * 
	 *  @param		string
	 * 
	 *  @return					Same string, with first char - capitalized. 
	 */
	public function decapitalize( string:String ):String {
		var letters:Array = string.split( "" );
		letters[0] = letters[0].toLowerCase();
		return letters.join( "" );
	}
}