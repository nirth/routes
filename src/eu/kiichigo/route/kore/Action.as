package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.utils.log;
	import eu.kiichigo.utils.toString;
	
	import spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin;

	public class Action implements IAction, IGuarded
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( Action );
		
		
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
		protected var _when:Object;
		/**
		 * @copy		eu.kiichigo.route.kore.IGuard#predicate
		 */
		
		public function get when():Object
		{
			return _when;
		}
		/**
		 * 
		 */
		public function set when( value:Object ):void
		{
			_when = value;
		}
		
		
		/**
		 * eu.kiichigo.route.kore.IAction#run
		 */
		public function run( percept:Object ):IAction
		{
			if( check( percept ) )
				exec( percept );
			
			return this;
		}
		
		
		/**
		 * Auxilary function, checks whether instance of <code>IAction</code> will be executed or not.
		 *  
		 * @param percept		Incoming from <code>IRoute</code> percept.
		 * @return 				<code>Boolean</code> value indicating wether function will or will not be run.
		 */
		protected function check( percept:Object = null ):Boolean
		{
			if( _when == null )
				var result:Boolean = true; // default is true
			else if( _when is Boolean )
				result = _when;
			else if( _when is Function && _when.length == 0 )
				result = _when.call();
			else if( _when is Function && _when.length == 1 )
				result = _when.call( null, percept );
			
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
		
		
		/**
		 * @inheritDoc
		 */
		public function toString():String
		{
			return eu.kiichigo.utils.toString( this, "route" );
		}
	}
}