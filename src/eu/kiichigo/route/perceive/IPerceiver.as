package eu.kiichigo.route.perceive
{
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.routes.IRoute;

	public interface IPerceiver
	{
		/**
		 * <code>IRouter</code> reference
		 */
		function get router():IRouter;
		/**
		 * @private
		 */
		function set router( value:IRouter ):void;

		
		/**
		 * Registeres <code>IRoute</code> instance with <code>IPerceiver</code> in order to receive percepts.
		 * 
		 * @param 	route	A reference to an <code>IRoute</code> instance that will receive percepts from current <code>IPerciever</code>
		 * 	
		 * @return			Newly added to <code>IPerceiver</code> instance of <code>IRoute</code>.
		 */
		function add( route:IRoute ):IRoute;
	}
}