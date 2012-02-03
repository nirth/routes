
package eu.kiichigo.route.utils
{
	public function vector( to:Object, ...rest ):Object
	{
		to.fixed = false;
		for( var i:uint = 0; i < rest.length; i ++ )
			to.push( rest[i] );
		to.fixed = true;
		
		return to;
	}
}