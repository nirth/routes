package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.pattern.Pattern;
	import eu.kiichigo.route.pattern.Patterns;
	import eu.kiichigo.route.pattern.match.type;
	import eu.kiichigo.route.pattern.match.values;
	import eu.kiichigo.route.sensor.Events;
	import eu.kiichigo.route.utils.log;
	
	import flash.events.Event;

	public class Handle extends Route
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Handle );
		
		/**
		 * @private
		 */
		protected const eventPattern:IPattern = new Pattern;
		
		public function Handle()
		{
			super();
			
			sensor = Events;
			
			var typePattern:Pattern = new Pattern;
			typePattern.matcher = type;
				typePattern.store( "type", Event );
				
			eventPattern.matcher = values;

			pattern = new Patterns( typePattern, eventPattern );
		}
		
		public function get event():String
		{
			return eventPattern.retreive( "type" ) as String;
		}
		
		public function set event( value:String ):void
		{
			eventPattern.store( "type", value );
		}
	}
}