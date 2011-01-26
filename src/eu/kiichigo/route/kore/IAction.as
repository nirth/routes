package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.routes.IRoute;

	public interface IAction
	{
		/**
		 * Reference to the <code>IRoute</code> instance that's a parent to current <code>IAction</code>.
		 */
		function get route():IRoute;
		/**
		 * @private
		 */
		function set route( value:IRoute ):void;
		
		/**
		 * Executes current <code>IAction</code> instance with <code>percept</code> received from the <code>IRoute</code> 
		 * @param percept		<code>Object</code> passed by <code>IRoute</code>.
		 * @return 				An instance of current <code>IAction</code>.
		 */
		function run( percept:Object ):IAction;
	}
}