package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.routes.IRoute;
	
	import spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin;

	public class Action implements IAction, IGuard
	{
		/**
		 * @private
		 */
		protected var _route:IRoute;
		/**
		 * @copy		eu.kiichigo.route.kore.IAction#route
		 */
		public function get route():IRoute
		{
			return null;
		}
		/**
		 * @private
		 */
		public function set route(value:IRoute):void
		{
			_route = value;
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
			if( evaluate() )
				exec( percept );
			
			return this;
		}
		
		protected function evaluate():Boolean
		{
			if( _predicate === null )
				return true;
			else if( _predicate is Function )
				return _predicate.call() as Boolean;
			else if( _predicate is Boolean )
				return _predicate;
			
			return true;
		}
		
		/**
		 * Override this method in subclassed, in order to implement functionality of a <code>Action</code>
		 */
		protected function exec( percept:Object ):void
		{
			
		}
	}
}