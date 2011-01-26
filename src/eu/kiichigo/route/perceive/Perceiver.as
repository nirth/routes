package eu.kiichigo.route.perceive
{
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.ICommitable;
	
	public class Perceiver implements IPerceiver
	{
		/**
		 * List of <code>IRoute</code> instances for current <code>Perceiver</code>.
		 * Iterate through this list in subclasses in order to pass <code>percept</code> to <code>IRoute</code> instances.
		 */
		protected const routes:Vector.<IRoute> = new Vector.<IRoute>;
		
		/**
		 * @copy		eu.kiichigo.route.perceive.IPerceiver#add
		 */
		public function add( route:IRoute ):IRoute
		{
			if( route === null )
				return null;
			
			routes.fixed = false;
			routes.push( process( route ) );
			routes.fixed = true;
			
			return route;
		}
		
		/**
		 * 
		 */
		protected function process( route:IRoute ):IRoute
		{
			return route;
		}
	}
}