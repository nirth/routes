package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.kore.Actions;
	import eu.kiichigo.route.kore.IAction;
	import eu.kiichigo.route.kore.IActions;
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.perceive.IPerceiver;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.Cache;
	import eu.kiichigo.route.utils.ICommitable;
	import eu.kiichigo.route.utils.add;
	import eu.kiichigo.route.utils.invalidate;
	
	[Exclude(name="activate",kind="event")]
	[Exclude(name="deactivate",kind="event")]
	
	public class Route implements IRoute
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Route );
		
		protected namespace generator;
		protected namespace instance;
		
		/**
		 * @private
		 * Handles initialization once pattern, perceiver and actions are set.
		 */
		protected function commit():void
		{
			// If perceiver set as Class, and _router is passed, ask router to create and cache an instance of IPerceiver
			if( generator::perceiver != null && instance::perceiver == null && _router != null )
				instance::perceiver = _router.build( generator::perceiver ) as IPerceiver;
				
			if( instance::perceiver == null ||
				_actions 			== null ||
				_pattern 			== null ||
				_router 			== null )
				return;
			
			instance::perceiver.add( this );
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
		instance var perceiver:IPerceiver = null;
		/**
		 * @private
		 */
		generator var perceiver:Class = null;

		/**
		 * @copy		eu.kiichigo.route.routes.IRoute#perceiver
		 */
		public function get perceiver():Object
		{
			return instance::perceiver !== null ? instance::perceiver : generator::perceiver;
		}
		/**
		 * @private
		 */
		public function set perceiver( value:Object ):void
		{
			if( value is IPerceiver )
				instance::perceiver = value as IPerceiver;
			else if( value is Class )
				generator::perceiver = value as Class;
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
			
			_actions.run( percept );
			
			return percept;
		}
	}
}