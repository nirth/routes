
package eu.kiichigo.route.pattern.match
{
	import eu.kiichigo.route.pattern.IPattern;

	public function values( pattern:IPattern, term:Object, field:String = null ):Boolean
	{
		for( var i:uint = 0; i < pattern.keys.length; i ++ )
			if( !term.hasOwnProperty( pattern.keys[i] ) )
				return false;
			else if( term[pattern.keys[i]] != pattern.retreive( pattern.keys[i] ) )
				return false;
		return true;
	}
}