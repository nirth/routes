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
		function set group( value:Object ):void;
		
		/**
		 * 
		 */
		function get routes():Vector.<IRoute>;
		/**
		 * @private
		 */
		function set routes( value:Vector.<IRoute> ):void;
		
		
		/**
		 * Creates new instance of <code>class</code> provided in argument <code>type</code> or returns previosly cached one. 
		 * @param type			<code>Class</code> of instance to be retreived.
		 * @return 				Instance of a <code>class</code> provided in argument <code>type</code>
		 * 
		 */
		function build( type:Class ):Object;
		
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