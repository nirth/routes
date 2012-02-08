package eu.kiichigo.vo
{
	import flash.utils.ByteArray;

	public interface IValueObject
	{	
		/**
		 * List of properties for current <code>IValueObject</code> that will be counted while serialization/deserialization process.
		 */
		function get properties():Vector.<String>;
	}
}