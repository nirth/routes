package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.ICache;

	public interface IRouter
	{	
		/**
		 * Indicates a group to wich current <code>IRouter</code> belongs. Default value is <code>null</code> which means that no group is created.
		 */
		function get group():Object;
		/**
		 * @private
		 */
		function set group(value:Object):void;
		
		/**
		 * List of routes.
		 */
		function get routes():Vector.<IRoute>;
		/**
		 * @private
		 */
		function set routes( value:Vector.<IRoute> ):void;
		
		
		/**
		 * Indicates current <code>percept</code> that's processed by <code>IRouter</code>
		 */
		function get percept():Object;
		/**
		 * @private
		 */
		function set percept( value:Object ):void;
		
		/**
		 * Reference to an instance of <code>IFactory</code> for this <code>IRouter</code>.
		 */
		function get instances():IInstances;
		
		
		/**
		 * Adds <code>IRoute</code> to a list of <code>IRouter.routes</code> and returns newly added <code>IRoute</code>.
		 *  
		 * @param route		<code>IRoute</code> instance to be added.
		 * @return 			Added <code>IRoute</code> instance.
		 */
		function add( route:IRoute ):IRoute;
		
		
		/**
		 * Clears and removes all <code>IRoute</code> instances, reseting current <code>IRouter</code>.
		 */
		function clear():void;
	}
}