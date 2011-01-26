package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.kore.IAction;
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
		
		//ToDo: see if initialize can be run only once, or it should be transformed to something like commitProperties on IInvalidating.
		/**
		 * @private
		 * Handles initialization once pattern, perceiver and actions are set.
		 */
		protected function initialize():void
		{
			// If perceiver set as Class, and _router is passed, ask router to create and cache an instance of IPerceiver
			if( generator::perceiver != null && instance::perceiver == null && _router != null )
				instance::perceiver = _router.cache.instance( generator::perceiver ) as IPerceiver;
				
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
			
			initialize();
		}
		
		
		/**
		 * @private
		 */
		protected const _actions:Vector.<Object> = new Vector.<Object>;
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
			//In case single instance of Function or Action is passed, wrap it in an Array.
			if( value is Function || value is IAction )
				value = [value];
			
			eu.kiichigo.route.utils.add( _actions, process )( value );
			
			initialize();
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

			initialize();
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
			
			initialize();
		}
		
		
		/**
		 * @private
		 * Initializes an action with an instance of <code>IRoute</code>. Accepts instances of <code>IAction</code> and <code>Function</code>.
		 */
		protected function process( action:Object ):Object
		{
			if( action is IAction )
				action.route = this;
			return action;
		}
	}
}