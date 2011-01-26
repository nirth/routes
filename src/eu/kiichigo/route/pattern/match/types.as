
package eu.kiichigo.route.pattern.match
{
	public function types( pattern:Object, term:Object ):Boolean
	{
		for( var property:String in pattern )
			if( !( term[property] is pattern[property] ) )
				return false;
		return true;
	}
}