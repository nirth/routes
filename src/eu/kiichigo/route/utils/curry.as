
package eu.kiichigo.route.utils
{
	public function curry( closure:Function, ...rest ):Function
	{
		return function( ...args ):*
		{
			closure.apply( rest.concat( args ) );
		}
	}
}