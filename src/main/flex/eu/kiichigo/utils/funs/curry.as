
package eu.kiichigo.utils.funs
{
	public function curry( closure:Function, pre:Boolean, ...args ):Function
	{
		return function( ...rest ):*
		{
			return closure.apply( null, pre ? args.concat( rest ) : rest.concat( args ) );
		}
	}
}