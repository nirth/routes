package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.guards.IGuarded;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.utils.log;
	import eu.kiichigo.utils.toString;
	
	import flash.utils.describeType;
	
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
		protected var _when:Object = null;
		
		/**
		 * @copy		eu.kiichigo.route.kore.IGuard#predicate
		 */
		
		public function get when():Object
		{
			return _when;
		}
		/**
		 * @private
		 */
		public function set when( value:Object ):void
		{
			_when = value;
		}
		
		
		/**
		 * eu.kiichigo.route.kore.IAction#run
		 */
		public function run(percept:Object):IAction
		{
			if(check(percept))
				exec(percept);
			
			return this;
		}
		
		/**
		 * eu.kiichigo.route.kore.IAction#pass
		 */
		public function pass(percept:Object):Object
		{
			if (_route)
				_route.pass(percept);
			
			return percept;
		}
		
		
		/**
		 * Auxilary function, checks whether instance of <code>IAction</code> will be executed or not.
		 *  
		 * @param percept		Incoming from <code>IRoute</code> percept.
		 * @return 				<code>Boolean</code> value indicating wether function will or will not be run.
		 */
		protected function check( percept:Object = null ):Boolean
		{
			if( _when === null )
				return true;
			
			var result:Boolean = true;
			if( _when is Boolean || _when is Function )
				result = testPredicate( _when, percept );
			else if( _when is Array )
				for( var i:uint = 0; i < _when.length; i ++ )
					if( !testPredicate( _when[i], percept ) )
						result = false;
			
			log( "check:", result );
			return result;
		}
		
		
		/**
		 * Auxilary function check predicate against percept.
		 * 
		 * @param	predicate	Single predicate, can be <code>Boolean</code> or <code>Function</code>.
		 * @param	percept		Current <code>percept</code>.
		 * 
		 * @return				Boolean, 
		 */
		protected function testPredicate(predicate:Object, percept:Object):Boolean
		{
			if( predicate == null )
				var result:Boolean = true; // default is true
			else if( predicate is Boolean )
				result = predicate;
			else if( predicate is Function && _when.length == 0 )
				result = predicate.call();
			else if( predicate is Function && predicate.length == 1 )
				result = predicate.call( null, percept );
			
			
			log( "testPredicate", result );
			
			return result;
		}
		
		
		/**
		 * Override this method in subclassed, in order to implement functionality of a <code>Action</code>
		 */
		protected function exec(percept:Object):void
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