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
		protected const _actions:Vector.<IAction> = new Vector.<IAction>;
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
		
		
		public function perceive( percept:Object ):Object
		{
			if( pattern == null ||
				!( pattern is IPattern ? pattern.match( percept ) : pattern( percept ) ) )
				return null;
			
			for( var i:uint = 0; i < _actions.length; i ++ )
				actions[i].run( percept );
			
			return percept;
		}
		
		
		/**
		 * @private
		 * Initializes an action with an instance of <code>IRoute</code>. Accepts instances of <code>IAction</code> and <code>Function</code>.
		 */
		protected function process( action:Object ):IAction
		{
			if( action is IAction )
				action.route = this;
			
			return ( action is IAction ? action : new Closure( action as Function ) ) as IAction;
		}
	}
}
import eu.kiichigo.route.kore.Action;
import eu.kiichigo.route.utils.log;

class Closure extends Action
{
	public function Closure( closure:Function )
	{
		this.closure = closure;
	}
	
	protected var closure:Function;
	
	override protected function exec( percept:Object ):void
	{
		trace( "closure.exec", closure.length );
		if( closure.length == 0 )
			closure.call();
		else if( closure.length == 1 )
			closure.call( null, percept );
	}
}