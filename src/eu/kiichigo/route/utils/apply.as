
package eu.kiichigo.route.utils
{
	public function apply( from:Object, to:Object ):Object
	{
		for( var property:String in from )
			if( to.hasOwnProperty( property ) )
				to[property] = from[property];
		
		return to;
	}
}