package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.events.BuildEvent;
	import eu.kiichigo.route.events.RouterEvent;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.Cache;
	import eu.kiichigo.route.utils.ICache;
	import eu.kiichigo.route.utils.add;
	import eu.kiichigo.route.utils.invalidate;
	import eu.kiichigo.utils.log;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[Exclude(name="activate",kind="event")]
	[Exclude(name="deactivate",kind="event")]
	
	[DefaultProperty("routes")]
	public class Router extends EventDispatcher
						implements IRouter
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log(Router);
		
		/**
		 * @private
		 */
		public function Router() { super(); }
		
		/**************
		 * Properties *
		 **************/
		
		/**
		 * @private
		 */
		protected const _instances:IInstances = new Instances;
		
		/**
		 * @copy		eu.kiichigo.route.kore.IRouter#factory
		 */
		public function get instances():IInstances
		{
			if( _instances.group != _group )
				_instances.group = _group;
			return _instances;
		}
	
		
		/**
		 * @private
		 */
		protected var _group:Object = "global";
		
		/**
		 * @copy		eu.kiichigo.route.kore.IRouter#group
		 */
		public function get group():Object
		{
			return _group;
		}
		/**
		 * @private
		 */
		public function set group(value:Object):void
		{
			_group = value;
		}
		
		
		/**
		 * @private
		 */
		protected const _routes:Vector.<IRoute> = new Vector.<IRoute>;
		
		/**
		 * @copy		eu.kiichigo.route.kore.IRouter#routes
		 */
		public function get routes():Vector.<IRoute>
		{
			return _routes;
		}
		/**
		 * @private
		 */
		public function set routes(value:Vector.<IRoute>):void
		{
			clear();
			eu.kiichigo.route.utils.add(_routes, initialize)(value);
			//log("set:routes({0}):{1}", value, _routes);
		}
		
		
		/**
		 * @private
		 */
		protected var _percept:Object;
		
		[Bindable(event="perceptChanged")]
		/**
		 * @copy		eu.kiichigo.route.kore.IRouter#percept
		 */
		public function get percept():Object
		{
			return _percept;
		}
		/**
		 * @private
		 */
		public function set percept( value:Object ):void
		{
			if( _percept === value )
				return;
			_percept = value;
			dispatchEvent( new RouterEvent( RouterEvent.PERCEPT_CHANGED ) );
		}
		
		/**
		 * @copy		eu.kiichigo.route.kore.IRouter#add
		 */
		public function add(route:IRoute):IRoute
		{
			_routes.push( initialize( route ) );
			return route;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.kore.IRouter#clear 
		 */
		public function clear():void
		{
			if( _routes.fixed )
				_routes.fixed = false;
			
			for( var i:uint = 0; i < _routes.length; i ++ )
				_routes.shift();
			
			_routes.fixed = true;
		}
		
		/**
		 * @private
		 * Initializes <code>IRoute</code> as a part of <code>IRouter</code>.
		 */
		protected function initialize( route:IRoute ):IRoute
		{
			route.router = this;
			return route;
		}
	}
}