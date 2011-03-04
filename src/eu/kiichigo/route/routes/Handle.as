package eu.kiichigo.route.routes
{
	import eu.kiichigo.funs.curry;
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.pattern.Pattern;
	import eu.kiichigo.route.pattern.Patterns;
	import eu.kiichigo.route.pattern.match.type;
	import eu.kiichigo.route.pattern.match.values;
	import eu.kiichigo.route.sensors.Events;
	import eu.kiichigo.utils.log;
	
	import flash.events.Event;

	public class Handle extends Route
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( Handle );
		
		
		/**
		 * @private
		 */
		protected const eventPattern:IPattern = new Pattern;
		
		/**
		 * @private
		 */
		protected const typePattern:IPattern = new Pattern;
		
		
		/**
		 * Constructor 
		 * 
		 */
		public function Handle()
		{
			super();
			
			sensor = Events;
			
			typePattern.matcher = curry( type, false, "generator" );
				
			eventPattern.matcher = values;

			pattern = new Patterns( typePattern, eventPattern );
			
			generator = Event;
		}
		
		
		/**
		 * Indicates event name, that current instance of <code>Handle</code> should listen to.
		 */
		public function get event():String
		{
			return eventPattern.retreive( "type" ) as String;
		}
		/**
		 * @private
		 */
		public function set event( value:String ):void
		{
			eventPattern.store( "type", value );
		}
		
		
		/**
		 * Indicates type of Event, default value is <code>flash.events.Event</code>
		 */
		public function get generator():Class
		{
			return typePattern.retreive( "generator" ) as Class
		}
		/**
		 * @private
		 */
		public function set generator( value:Class ):void
		{
			typePattern.store( "generator", value );
		}
	}
}