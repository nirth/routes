package eu.kiichigo.route.perceive
{
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.EventProxy;
	import eu.kiichigo.route.utils.IEventProxy;
	
	import flash.events.Event;

	public class Events extends Perceiver
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Events );
		
		protected const proxy:IEventProxy = new EventProxy( EventProxy.APPLICATION );
		
		override protected function process( route:IRoute ):IRoute
		{
			log( "processing route:{0}", route );
			
			if( route.pattern is IPattern )
				proxy.addEventListener( ( route.pattern as IPattern ).retreive( "type" ) as String, handle );
			
			
			return route;
		}

		private function handle( event:Event ):void
		{
			log( "handling event:{0}", event );
		}
	}
}