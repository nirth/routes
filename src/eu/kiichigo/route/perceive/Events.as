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
		
		/**
		 * @private
		 */
		protected const proxy:IEventProxy = new EventProxy( EventProxy.APPLICATION );
		
		/**
		 * @inheritDoc
		 */
		override protected function process( route:IRoute ):IRoute
		{
			if( route.pattern is IPattern )
				proxy.addEventListener( ( route.pattern as IPattern ).retreive( "type" ) as String, handle );
			
			log( "processing route:{0}, total:{1}", route, routes.length  );
			
			return route;
		}
		
		/**
		 * @private
		 */
		protected function handle( event:Event ):void
		{
			log( "handle:", event );
			for( var i:uint = 0; i < routes.length; i ++ )
				routes[i].perceive( event );
		}
	}
}