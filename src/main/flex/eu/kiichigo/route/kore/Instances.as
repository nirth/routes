package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.sensors.Injects;
	import eu.kiichigo.route.utils.Cache;
	import eu.kiichigo.route.utils.ICache;
	import eu.kiichigo.utils.log;
	
	import flash.utils.getDefinitionByName;

	public class Instances implements IInstances
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log(Instances);
		
		/**
		 * @private
		 */
		protected var cache:ICache;
		
		/**
		 * @private
		 */
		protected var _group:Object = null;
		
		/**
		 * @copy		eu.kiichigo.route.kore.IInstance#group
		 */
		public function get group():Object
		{
			return _group;
		}
		/**
		 * @private
		 */
		public function set group(value:Object):void
		{
			_group = value;
			cache = Cache.group(value);
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.kore.IInstance#retreive
		 */
		public function retreive(generator:Object):Object
		{
			if (!cache.has(generator)) {
				cache.store(generator, new generator());
			}
			
			return cache.retreive( generator );
		}
		
		/**
		 * @copy		eu.kiichigo.route.kore.IInstance#store
		 */
		public function store( generator:Class, instance:Object ):Object
		{
			return cache.store( generator, instance );
		}
		
		
		/**
		 * @private
		 */
		/*protected function factorize( instance:Object ):Object
		{
			var routeFactory:Class;
			var flexFactory:Class;
			
			try {
				routeFactory = getDefinitionByName( "eu.kiichigo.route.utils.IFactory" ) as Class;				
			} catch( e:ReferenceError ) {
				
			}
			
			try {
				flexFactory = getDefinitionByName( "mx.core.IFactory" ) as Class;
			} catch ( e:ReferenceError ) {
				
			}
			
			if( routeFactory && instance is routeFactory )
				instance = instance.create();
			else if( instance is flexFactory )
				instance = instance.newInstance();
			
			return instance;
		}*/
	}
}