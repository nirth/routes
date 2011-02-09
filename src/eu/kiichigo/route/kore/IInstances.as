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
		 * 
		 * @param	generator	<code>Class</code> used for generation or retreival.
		 * @return				Newly created or cached instance of <code>generator</code>.	
		 */
		function retreive( generator:Object ):Object;
		
		/**
		 * Stores an <code>instance</code> in <code>IInstances</code> with <code>generator</code> as a key.
		 * 
		 * @param	generator		<code>Class</code> of an <code>instance</code>. Used as a key in hash<.
		 * @param	instance		<code>Object</code> to be stored in hash with key provided in <code>generator</code>.
		 * @return					Stored <code>instance</code>.
		 */
		function store( generator:Class, instance:Object ):Object;
	}
}