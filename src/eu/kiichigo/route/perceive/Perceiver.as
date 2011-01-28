package eu.kiichigo.route.perceive
{
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.ICommitable;
	
	public class Perceiver implements IPerceiver
	{
		/**
		 * Constructor
		 */
		public function Perceiver()
		{
			super();
			
			initialize();
		}
		
		/**
		 *
		 */
		protected function initialize():void
		{
			
		}
		
		/**
		 * @private
		 */
		protected var _router:IRouter
		
		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#router
		 */
		public function get router():IRouter
		{
			return _router;
		}
		/**
		 * @private
		 */
		public function set router( value:IRouter ):void
		{
			_router = value;
		}
		
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
			if( routes.indexOf( route ) == -1 )
				routes.push( process( route ) );
			else
				process( route );
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
		
		/**
		 * @private
		 */
		protected function send( percept:Object ):void
		{
			for( var i:uint = 0; i < routes.length; i ++ )
				routes[i].perceive( percept );
		}
	}
}