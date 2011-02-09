package eu.kiichigo.route.dsl.fluent
{
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.route.kore.IAction;
	import eu.kiichigo.route.kore.IActions;
	import eu.kiichigo.route.kore.IInstances;
	import eu.kiichigo.route.pattern.IPattern;
	import eu.kiichigo.route.pattern.IPatterns;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.apply;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.getDefinitionByName;
	
	import mx.core.IFactory;
	
	import org.osmf.layout.AbsoluteLayoutFacet;
	
	public class Router extends eu.kiichigo.route.kore.Router implements IRouter
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( "flow.Router" );
		
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
		 * @copy		eu.kiichigo.route.interfaces.flow.IRouter#settings
		 */
		public function settings( properties:Object ):IRouter
		{
			return apply( properties, this ) as IRouter;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.interfaces.flow.IRouter#route
		 */
		public function route( route:Object, properties:Object = null ):IRouter
		{
			end;
			
			var r:IRoute = add( create( route, properties ) as IRoute );
			
			level( r );
			
			log( "added route:{0}", r );
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.interfaces.flow.IRouter#pattern
		 */
		public function pattern( pattern:Object, properties:Object = null):IRouter
		{
			var p:IPattern = create( pattern, properties ) as IPattern;
			
			if( p is IPatterns )
				level( p );
			
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.interfaces.flow.IRouter#action
		 */
		public function action( action:Object, properties:Object = null ):IRouter
		{
			var a:IAction = ( current as IRoute ).add( create( action, properties ) as IAction );
			
			if( a is IActions )
				level( a );
			
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.interfaces.flow.IRouter#end
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