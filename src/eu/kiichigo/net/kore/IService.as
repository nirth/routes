package eu.kiichigo.net.kore
{
	import eu.kiichigo.net.kore.IOperation;
	
	import flash.events.IEventDispatcher;

	public interface IService extends IEventDispatcher
	{
		/**
		 * 
		 */
		function get url():String;
		/**
		 * @private
		 */
		function set url( value:String ):void;
		
		/**
		 * <code>Class</code> or <code>mx.core.IFactory</code>.
		 */
		function get operation():Object;
		/**
		 * @private
		 */
		function set operation( value:Object ):void;
		
		/**
		 * 
		 * @param parameters
		 * @param settings
		 * @return 
		 */
		function send( parameters:Object = null, settings:Object = null ):eu.kiichigo.net.kore.IOperation
	}
}