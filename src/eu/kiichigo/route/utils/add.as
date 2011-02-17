
package eu.kiichigo.route.utils
{
	public function add( to:Object, initializer:Function = null ):Function
	{
		return function( from:Object, clear:Boolean = true ):void
		{
			if( clear )
				while( to.length )
					to.shift();
			
			if( to.fixed )
				to.fixed = false;
			
			for( var i:uint = 0; i < from.length; i ++ )
				if( initializer == null )
					to.push( from[i] );
				else
					to.push( initializer( from[i] ) );
			
			to.fixed = true;
		}
	}
}