package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.kore.Actions;
	import eu.kiichigo.route.kore.IAction;
	import eu.kiichigo.route.kore.IActions;
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.sensors.ISensor;
	import eu.kiichigo.route.utils.Cache;
	import eu.kiichigo.route.utils.ICommitable;
	import eu.kiichigo.route.utils.add;
	import eu.kiichigo.route.utils.invalidate;
	
	[Exclude(name="activate",kind="event")]
	[Exclude(name="deactivate",kind="event")]
	
	[DefaultProperty("actions")]
	
	public class Route implements IRoute
	{	
		protected namespace generator;
		protected namespace instance;
		
		/**
		 * @private
		 * Handles initialization once pattern, perceiver and actions are set.
		 */
		protected function commit():void
		{
			// If perceiver set as Class, and _router is passed, ask router to create and cache an instance of IPerceiver
			if( generator::sensor != null && instance::sensor == null && _router != null )
				instance::sensor = _router.instances.retreive( generator::sensor ) as ISensor;
				
			if( instance::sensor == null ||
				_actions 		 == null ||
				_pattern 	     == null ||
				_router 		 == null )
				return;
			
			_actions.route = this;
			
			instance::sensor.add( this );
		}
		
		/**
		 * @private
		 */
		protected var _percept:Object;
		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#percept
		 */
		public function get percept():Object
		{
			return _percept;
		}
		
		/**
		 * @private
		 */
		protected var _router:IRouter;
		
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
			commit();
		}
		
		
		/**
		 * @private
		 */
		protected var _actions:IActions;
		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#actions
		 */
		public function get actions():Object
		{
			return _actions;
		}
		/**
		 * @private
		 */
		public function set actions( value:Object ):void
		{
			if( value is IActions )
				_actions = value as IActions;
			else
			{
				if( value is Function || value is IAction )
					value = [value];
				
				_actions = new Actions;
				_actions.list = value;
			}

			commit();
		}
		
		
		/**
		 * @private
		 */
		instance var sensor:ISensor = null;
		/**
		 * @private
		 */
		generator var sensor:Class = null;

		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#perceiver
		 */
		public function get sensor():Object
		{
			return instance::sensor !== null ? instance::sensor : generator::sensor;
		}
		/**
		 * @private
		 */
		public function set sensor( value:Object ):void
		{
			if( value is ISensor )
				instance::sensor = value as ISensor;
			else if( value is Class )
				generator::sensor = value as Class;
			commit();
		}
		
		
		/**
		 * @private
		 */
		protected var _pattern:Object;

		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#pattern
		 */
		public function get pattern():Object
		{
			return _pattern;
		}
		/**
		 * @private
		 */
		public function set pattern( value:Object ):void
		{
			_pattern = value;
			commit();
		}
		
		
		/**
		 * @copy 		eu.kiichigo.route.routes.IRoute#perceive
		 */
		public function perceive( percept:Object ):Object
		{
			if( pattern == null ||
				!( pattern is IPattern ? pattern.match( percept ) : pattern( percept ) ) )
				return null;
			
			_router.percept = percept;
			
			_actions.run( percept );
			
			return percept;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#add
		 */
		public function add( action:IAction ):IAction
		{
			if( _actions == null )
				actions = [action];
			else
				action = _actions.add( action );
			
			return action;
		}
	}
}