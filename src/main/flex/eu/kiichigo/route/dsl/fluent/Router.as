package eu.kiichigo.route.dsl.fluent
{
	import eu.kiichigo.utils.funs.curry;
	import eu.kiichigo.route.guards.IGuarded;
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.route.kore.IAction;
	import eu.kiichigo.route.kore.IActions;
	import eu.kiichigo.route.kore.IInstances;
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.pattern.IPatterns;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.utils.apply;
	import eu.kiichigo.utils.log;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.getDefinitionByName;
	
	import mx.core.IFactory;
	
	public class Router extends eu.kiichigo.route.kore.Router implements IRouter
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( Router );
		
		
		/**
		 * @private 
		 */
		public static function setup( properties:Object = null ):IRouter
		{
			return apply( properties, new Router ) as IRouter
		}
		
		
		/**
		 * @private
		 * List of containers/boxes, which will get items added to them. Valid containers are: <code>IRoute</code>, <code>IActions</code> and <code>IPatterns</code>.
		 */
		protected const boxes:Vector.<Object> = new Vector.<Object>;
		
		
		/**
		 * @private
		 * Temporary reference to current <code>IAction</code> holder. It can be instances of <code>IRoute</code> or <code>IActions</code>
		 */
		protected var current:Object = null;
		
		
		/**
		 * @private
		 * Indicates current instance of <code>IAction</code>.
		 */
		protected var action:IAction = null;
		
		
		/**
		 * @copy		eu.kiichigo.route.dsl.fluent.IRouter#settings
		 */
		public function settings(properties:Object):IRouter
		{
			return apply(properties, this) as IRouter;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.dsl.fluent.IRouter#route
		 */
		public function route( route:Object, properties:Object = null ):IRouter
		{
			end;
			
			var r:IRoute = add( create( route, properties ) as IRoute );
			
			level( r );

			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.dsl.fluent.IRouter#pattern
		 */
		public function pattern( pattern:Object, properties:Object = null):IRouter
		{
			var p:IPattern = create( pattern, properties ) as IPattern;
			
			if( p is IPatterns )
				level( p );
			
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.dsl.fluent.IRouter#action
		 */
		public function run( action:Object, properties:Object = null ):IRouter
		{
			var a:IAction = ( current as IRoute ).add( create( action, properties ) as IAction );
			
			if( a is IActions )
				level( a );
			
			log( "run", a, a is IGuarded );
			this.action = a;
			
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.dsl.fluent.IRouter#when
		 */
		public function when( guard:Object, properties:Object = null ):IRouter
		{
			if( action is IGuarded )
			{
				const guarded:IGuarded = action as IGuarded;
				
				if( guard is Function && properties != null )
					guard = curry( guard as Function, true, properties is Array ? properties : [properties] );
				
				if( ( guarded.when as Array ) == null )
					guarded.when = [guard];
				else
					guarded.when.push( guard );				
			}
				
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.dsl.fluent.IRouter#end
		 */
		public function get end():IRouter
		{
			boxes.pop();
			
			if( boxes.length )
				current = boxes[boxes.length - 1];
			else
				current = null;
			
			return this;
		}
		
		
		/**
		 * @private
		 * Adds new level to the structure of <code>IRouter</code>. Use IRouter.end to 
		 * 
		 * @param	object		An instance to be added to level structure.
		 * @return				Newly added instance.
		 */
		protected function level( object:Object ):Object
		{
			boxes.push( object );
			current = object;
			return object;
		}
		
		
		/**
		 * @private
		 * Handles creation (if needed) of objects.
		 * 
		 * @param	object
		 * @param	properties
		 * @return
		 */
		protected function create( object:Object, properties:Object = null ):Object
		{
			if( object is Class )
				object = new object;
			
			if( object is ( getDefinitionByName( "mx.core.IFactory" ) as Class ))
				object = object.newInstance();
			
			return apply( properties, object, false );
		}
	}
}