package eu.kiichigo.route.routes
{
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.sensor.ISensor;

	public interface IRoute
	{
		/**
		 * Current <code>percept</code> that's being processed by a <code>IRoute</code>.
		 * Percepts are delivered by <code>IPerceiver</code> instances and matched aganist <code>IRoute.pattern</code>, if match is successful, <code>IRoute</code will execute it's <code>IRoute.actions</code> with a <code>percept</code>.
		 */
		function get percept():Object;
		
		/**
		 * A reference to the <code>IRouter</code> instance that's a parent for current <code>IRoute</code>.
		 */
		function get router():IRouter
		/**
		 * @private
		 */
		function set router( value:IRouter ):void;
		
		/**
		 * Allowed types are:
		 * <ul>
		 * <li>An instance of <code>IAction</code> or <code>IActions</code>.</li>
		 * <li><code>Function</code> closure: A function closure with a signature:
		 * <<code>function ():void</code> or <code>function ( percept:Object ):void</code>.</li>
		 * <li><code>Array or <code>Vector</code>: of <code>Function</code> closures, or mixed type.</li>
		 * </ul>
		 */
		function get actions():Object;
		/**
		 * @private
		 */
		function set actions( value:Object ):void;
		
		/**
		 * An instance of <code>ISensor</code> associated with current <code>IRoute</code>. Acceptable values are instance of <code>ISensor</code> or <code>Class</code>.
		 */
		function get sensor():Object;
		/**
		 * @private
		 */
		function set sensor( value:Object ):void;
		
		/**
		 * <code>IPattern</code> instance or <code>closure</code> that will evaluate incoming <code>percept</code> and "decide" whether current <code>IRoute</code> instance will accept it or not.
		 * In case of closure - allowed signatures are:
		 * <code>function ( percept:Object ):Boolean</code>
		 */
		function get pattern():Object;
		/**
		 * @private
		 */
		function set pattern( value:Object ):void;
		
		
		function perceive( percept:Object ):Object;
	}
}