package eu.kiichigo.route.utils
{
	import eu.kiichigo.utils.apply;

	public class Factory implements IFactory
	{
		/**
		 * Creates new instance of <code>Factory<code>.
		 *  
		 * @param generator			Desired <code>Class</code> which will be used to create new instances.
		 * @param properties		Properties to be applied to newly created instance.
		 */
		public function Factory( generator:Class = null, properties:Object = null )
		{
			super();
			
			this.generator = generator;
			this.properties = properties;
		}
		
		/**
		 * @private
		 */
		protected var _generator:Class;
		
		/**
		 * @copy		eu.kiichigo.route.utils.IFactory#generator
		 */
		public function get generator():Class
		{
			return _generator;
		}
		/**
		 * @private
		 */
		public function set generator( value:Class ):void
		{
			_generator = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _properties:Object;
		
		/**
		 * @copy		eu.kiichigo.route.utils.IFactory#properties
		 */
		public function get properties():Object
		{
			return null;
		}
		/**
		 * @private
		 */
		public function set properties( value:Object ):void
		{
			_properties = value;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.utils.IFactory#create
		 */
		public function create( properties:Object = null ):Object
		{
			const instance:Object = new generator;
			apply( _properties, instance );
			apply( properties, instance );
			return instance;
		}
	}
}