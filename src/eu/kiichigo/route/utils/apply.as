
package eu.kiichigo.route.utils
{
	public function apply( from:Object, to:Object, check:Boolean = true ):Object
	{
		for( var property:String in from )
			if( check && to.hasOwnProperty( property ) )
				to[property] = from[property];
			else if( !check )
				to[property] = from[property];
		
		return to;
	}
}