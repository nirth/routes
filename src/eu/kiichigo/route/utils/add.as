
package eu.kiichigo.route.utils
{
	public function add( to:Object, initializer:Function ):Function
	{
		return function( from:Object ):void
		{
			if( to.fixed )
				to.fixed = false;
			
			for( var i:uint = 0; i < from.length; i ++ )
				to.push( initializer( from[i] ) );
			
			to.fixed = true;
		}
	}
}