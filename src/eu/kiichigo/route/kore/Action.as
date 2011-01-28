package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.log;
	
	import spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin;

	public class Action implements IAction, IGuard
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Action );
		
		
		/**
		 * @private
		 */
		protected var _route:IRoute;
		/**
		 * @copy		eu.kiichigo.route.kore.IAction#route
		 */
		public function get route():IRoute
		{
			return _route;
		}
		/**
		 * @private
		 */
		public function set route(value:IRoute):void
		{
			_route = value;
			commit();
		}
		
		
		/**
		 * @private
		 */
		protected var _predicate:Object;
		/**
		 * @copy		eu.kiichigo.route.kore.IGuard#predicate
		 */
		public function get predicate():Object
		{
			return _predicate;
		}
		/**
		 * 
		 */
		public function set predicate(value:Object):void
		{
			_predicate = value;
		}
		
		/**
		 * eu.kiichigo.route.kore.IAction#run
		 */
		public function run( percept:Object ):IAction
		{
			if( evaluate( percept ) )
				exec( percept );
			
			return this;
		}
		
		/**
		 * Auxilary function, evaluates whether instance of <code>IAction</code> will be executed or not.
		 *  
		 * @param percept		Incoming from <code>IRoute</code> percept.
		 * @return 				<code>Boolean</code> value indicating wether function will or will not be run.
		 */
		protected function evaluate( percept:Object = null ):Boolean
		{
			if( _predicate == null )
				var result:Boolean = true; // default is true
			else if( _predicate is Boolean )
				result = _predicate;
			else if( _predicate is Function && _predicate.length == 0 )
				result = _predicate.call();
			else if( _predicate is Function && _predicate.length == 1 )
				result = _predicate.call( null, percept );
			
			return result;
		}
		
		/**
		 * Override this method in subclassed, in order to implement functionality of a <code>Action</code>
		 */
		protected function exec( percept:Object ):void
		{
			
		}
		
		/**
		 *  
		 * 
		 */		
		protected function commit():void
		{
			
		}
	}
}