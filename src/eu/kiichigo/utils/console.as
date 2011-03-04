
package eu.kiichigo.utils
{
	import flash.external.ExternalInterface;

	public function console( message:String ):void
	{
		if( ExternalInterface.available )
			ExternalInterface.call( "console.log", message );
	}
}