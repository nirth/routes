package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.pattern.Pattern;
	import eu.kiichigo.route.pattern.match.type;
	import eu.kiichigo.route.sensors.Injects;
	import eu.kiichigo.utils.log;
	
	public class Inject extends Route
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log(Inject);
		
		public function Inject()
		{
			super();
			
			sensor = Injects;
			pattern = new Pattern;
			pattern.matcher = eu.kiichigo.route.pattern.match.type;
		}
		
		override public function perceive(percept:Object):Object
		{	
			const result:* =  super.perceive(percept);
			
			if (result)
				log("percieve(type={0})", pattern.retreive("type"));
			
			return result;
		}
		
		public function get type():Class
		{
			return pattern.retreive("type");
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