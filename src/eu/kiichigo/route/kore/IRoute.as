package eu.kiichigo.route.kore
{
	public interface IRoute
	{
		/**
		 * 
		 */
		function get percept():Object;
		
		/**
		 * A reference to the <code>IRouter</code> instance that's a parent for current <code>IRoute</code>.
		 */
		function get router():IRouter;
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
		 * 
		 */
		function get perceiver():Object;
		/**
		 * @private
		 */
		function set perceiver( value:Object ):void;
		
		/**
		 * <code>IPattern</code> instance or <code>closure</code> that will evaluate incoming <code>percept</code> and "decide" whether current <code>IRoute</code> instance will accept it or not.
		 * In case of closure - allowed signatures are:
		 * <code>function ( percept:Object ):Boolean</code>
		 * <code>function ( pattern:Object, percept:Object ):Boolean</code>.
		 */
		function get pattern():Object;
		/**
		 * @private
		 */
		function set pattern( value:Object ):void;
	}
}