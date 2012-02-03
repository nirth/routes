
package eu.kiichigo.route.pattern.match
{
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.utils.log;

	public function values( pattern:IPattern, percept:Object, field:String = null ):Boolean
	{
		log( "eu.kiichigo.route.pattern.match.values" )( pattern.keys );
		for( var i:uint = 0; i < pattern.keys.length; i ++ )
			if( !percept.hasOwnProperty( pattern.keys[i] ) )
				return false;
			else if( percept[pattern.keys[i]] != pattern.retreive( pattern.keys[i] ) )
				return false;
		return true;
	}
}