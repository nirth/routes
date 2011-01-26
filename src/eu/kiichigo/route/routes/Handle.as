package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.pattern.Pattern;
	import eu.kiichigo.route.perceive.Events;
	import eu.kiichigo.route.utils.log;

	public class Handle extends Route
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Handle );
		
		public function Handle()
		{
			super();
			
			perceiver = Events;
		}
		
		public function get event():String
		{
			if( pattern )
				return pattern.retreive( "type" );
			return null;
		}
		
		public function set event( value:String ):void
		{
			if( pattern == null )
				pattern = new Pattern;
			pattern.store( "type", value );
		}
	}
}