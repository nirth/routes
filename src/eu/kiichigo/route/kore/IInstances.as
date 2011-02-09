package eu.kiichigo.route.kore
{
	public interface IInstances
	{
		/**
		 * Indicates a group to wich current factory belongs. Group should be set via <code>IRouter.group</code> and not directly.
		 */
		function get group():Object;
		/**
		 * @private
		 */
		function set group( value:Object ):void;
		
		
		/**
		 * Creates new instance from class provided in <code>generator</code> argument or retreives cached one.
		 */
		function get( generator:Class ):Object;
	}
}