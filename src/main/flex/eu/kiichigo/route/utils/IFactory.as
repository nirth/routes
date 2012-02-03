package eu.kiichigo.route.utils
{
	public interface IFactory
	{
		/**
		 * Desired <code>Class</code> which will be used to create new instances.
		 */
		function get generator():Class;
		/**
		 * @private
		 */
		function set generator( value:Class ):void;
		
		/**
		 * Properties to be applied to newly created instance.
		 */
		function get properties():Object;
		/**
		 * @private
		 */
		function set properties( value:Object ):void;
		
		
		/**
		 * Creates new instance of class provided in <code>IFactory.generator</code> and applies properties from <code>IFactory.generator</code>.
		 * 
		 * @param properties		Additional properties to be applied to newly created instance.
		 * @return					Newly created instance from <code>IFactory.generator</code>.
		 */
		function create( properties:Object = null ):Object;
	}
}