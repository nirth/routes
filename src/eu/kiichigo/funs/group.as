
package eu.kiichigo.funs
{
	public function group( ...closures ):Function
	{
		if( closures.length < 1 )
			return null;
							
		return function( ...rest ):void {
			for( var i:uint = 0; i < closures.length; i ++ )
				if( closures[i] is Function && rest != null )
					closures[i].apply( null, rest.shift() );
				else if( closures[i] is Object && closures[i].hasOwnProperty( "closure" ) )
					closures[i].closure.apply( null, closures[i].args );
		}
	}
}