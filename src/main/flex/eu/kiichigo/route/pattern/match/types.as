
package eu.kiichigo.route.pattern.match
{
	public function types( pattern:Object, percept:Object ):Boolean
	{
		for( var property:String in pattern )
			if( !( percept[property] is pattern[property] ) )
				return false;
		return true;
	}
}