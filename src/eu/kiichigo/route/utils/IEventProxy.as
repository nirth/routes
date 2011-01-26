package eu.kiichigo.route.utils
{
	import flash.events.IEventDispatcher;
	
	public interface IEventProxy extends IEventDispatcher
	{
		/**
		 * Property indicates a mode in which <code>ReDispatcher</code> works, accepts <code>IEventDispatcher</code> or enumerated <code>String</code>.
		 * Allowed modes:
		 * <ul>
		 * <li>"application" will use Application, either spark:Application or mx:Application.</li>
		 * <li>or any <code>IEventDispatcher</code> instance</li>
		 * </ul>
		 */
		function get mode():Object;
		/**
		 * @private
		 */
		function set mode( value:Object ):void;
	}
}