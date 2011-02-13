package eu.kiichigo.net.vo
{
	import flash.utils.ByteArray;

	public interface IValueObject
	{
		/**
		 * Parses an instance of <code>IValueObject</code> to <code>Object</code> and vice versa.
		 */
		function get object():Object;
		/**
		 * @private
		 */
		function set object( value:Object ):void;
		
		
		/**
		 * List of properties for current <code>IValueObject</code> that will be counted while serialization/deserialization process.
		 */
		function get properties():Vector.<String>;
		/**
		 * @private
		 */
		function set properties( value:Vector.<String> ):void;
	}
}