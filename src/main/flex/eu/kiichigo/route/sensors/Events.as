package eu.kiichigo.route.sensors
{
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.utils.log;
	
	import flash.events.Event;

	/**
	 * 
	 * @author David "Nirth" Sergey
	 * @url	http://kiichigo.eu
	 * @email d@kiichigo.eu
	 * 
	 */
	public class Events extends Sensor
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( Events );
		
		
		/**
		 * @private
		 */
		protected const proxy:IEventProxy = EventProxy.create(EventProxy.FLEX);
		
		
		/**
		 * @inheritDoc
		 */
		override protected function process(route:IRoute):IRoute
		{
			if( route.pattern is IPattern )
				proxy.addEventListener((route.pattern as IPattern).retreive("type") as String, handle);
			
			return route;
		}
		
		
		/**
		 * @private
		 */
		protected function handle(event:Event):void
		{
			pass( event );
		}
	}
}