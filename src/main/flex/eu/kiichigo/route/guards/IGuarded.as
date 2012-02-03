package eu.kiichigo.route.guards
{
	public interface IGuarded
	{
		/**
		 * Allowed types are: <code>Boolean</code> or <code>Function</code> closure that returns a <code>Boolean</code>.
		 * Indicates whether an <code>IGuarded</code> instance will be executed or not.
		 * 
		 * Default value is <code>true</code>
		 */
		function get when():Object;
		/**
		 * @private
		 */
		function set when( value:Object ):void;
	}
}