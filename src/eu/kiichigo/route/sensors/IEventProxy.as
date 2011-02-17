package eu.kiichigo.route.sensors
{
	import flash.events.IEventDispatcher;
	
	public interface IEventProxy extends IEventDispatcher
	{
		/**
		 * List of instances of <code>IEventDispatchers</code> associated with current <code>IEventProxy</code>.
		 */
		function get dispatchers():Vector.<IEventDispatcher>;
		/**
		 * @private
		 */
		function set dispatchers( value:Vector.<IEventDispatcher> ):void;
		
		
		/**
		 * 
		 */
		function add( dispatcher:IEventDispatcher ):IEventDispatcher;
	}
}