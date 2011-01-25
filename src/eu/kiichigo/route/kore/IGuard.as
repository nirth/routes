package eu.kiichigo.route.kore
{
	public interface IGuard
	{
		/**
		 * Allowed types are: <code>Boolean</code> or <code>Function</code> closure that returns a <code>Boolean</code>.
		 * Indicates whether an <code>IGuard</code> instance will be executed or not.
		 * 
		 * Default value is <code>true</code>
		 */
		function get predicate():Object;
		/**
		 * @private
		 */
		function set predicate( value:Object ):void;
	}
}