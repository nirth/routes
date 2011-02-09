package eu.kiichigo.route.interfaces.flow
{
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.route.kore.IAction;
	import eu.kiichigo.route.kore.IActions;
	import eu.kiichigo.route.kore.IInstances;
	import eu.kiichigo.route.pattern.IPattern;
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
		 * Temporary reference to current <code>IAction</code> holder. It can be instances of <code>IRoute</code> or <code>IActions</code>
		 */
		protected const boxes:Vector.<Object> = new Vector.<Object>;
		
		
		public function Router()
		{
			super();
		}
		
		
		public function settings( properties:Object ):IRouter
		{
			return apply( properties, this ) as IRouter;
		}
		
		
		public function route( route:Object, properties:Object ):IRouter
		{
			var r:IRoute = apply( properties, route is IRoute ?
												route : route is Class ?
													new route : null ) as IRoute;
			
			boxes.push( r );
			
			return this;
		}
		
		public function pattern( pattern:Object, properties:Object ):IRouter
		{
			var p:IPattern
			return this;
		}
		
		public function action( action:Object, properties:Object ):IRouter
		{
			var a:IAction = apply( properties, action is IAction ?
												action : action is Class ?
													new action : null ) as IAction;
			
			if( a is IActions )
				boxes.push( a );
			
			return this;
		}
		
		
		public function end():IRouter
		{
			
			
			return this;
		}
		
		protected function construct( object:Object ):Object
		{
			var result:Object = object is Class ? new object : object;
			
			if( result is ( getDefinitionByName( "mx.core.IFactory" ) as Class ))
				result = result.newInstance();
			
			return result;
		}
	}
}