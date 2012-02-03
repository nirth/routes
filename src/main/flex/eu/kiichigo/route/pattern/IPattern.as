package eu.kiichigo.route.pattern
{
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.IHash;

	public interface IPattern extends IHash
	{
		/**
		 * Referece to parent instance of <code>IRoute</code>.
		 */
		function get route():IRoute;
		/**
		 * @private
		 */
		function set route( value:IRoute ):void;
		
		
		/**
		 * A <code>closure</code> that will match <code>percept</code> received by <code>IRoute<code> against current <code>IPattern</code>.
		 * Allowed signatures are:
		 * <ul>
		 * <li><code>function myMatcher( pattern:IPattern, percept:Object ):Boolean</code></li>
		 * <li><code>function myMatcher( percept:Object ):Boolean</code></li>
		 * </ul>
		 */
		function get matcher():Function;
		/**
		 * @private
		 */
		function set matcher( value:Function ):void;
		
		/**
		 * Evaluates <code>percept</code> received by <code>IRoute</code> and returns <code>Boolean</code>.
		 * If <code>true</code> <code>IRoute</code> will execute <code>IAction</code> instances and closures.
		 */
		function match( percept:Object ):Boolean;
		
		
	}
}