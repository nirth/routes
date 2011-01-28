package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.pattern.Pattern;
	import eu.kiichigo.route.pattern.match.type;
	import eu.kiichigo.route.perceive.Injects;
	import eu.kiichigo.route.utils.log;
	
	public class Inject extends Route
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Inject );
		
		public function Inject()
		{
			super();
			
			perceiver = Injects;
			
			pattern = new Pattern;
			pattern.matcher = eu.kiichigo.route.pattern.match.type;
		}
		
		public function get type():Class
		{
			return pattern.retreive( "type" );
		}
		/**
		 * @private
		 */
		public function set type( value:Class ):void
		{
			pattern.store( "type", value );
		}
	}
}