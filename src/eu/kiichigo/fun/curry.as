
package eu.kiichigo.fun
{
	public function curry( closure:Function, ...args ):Function
	{
		return function( ...rest ):*
		{
			return closure.apply( null, args.concat( rest ) );
		}
	}
}