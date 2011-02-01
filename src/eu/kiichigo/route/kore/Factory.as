package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.utils.Cache;
	import eu.kiichigo.route.utils.ICache;
	import eu.kiichigo.route.utils.log;

	public class Factory implements IFactory
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Factory );
		
		/**
		 * @private
		 */
		protected var cache:ICache;
		
		/**
		 * @private
		 */
		protected var _group:Object = null;
		
		/**
		 * @copy		eu.kiichigo.route.kore.IFactory#group
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
			cache = Cache.group( value );
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.kore.IFactory#create
		 */
		public function create( generator:Class ):Object
		{
			if( !cache.has( generator ) )
				cache.store( generator, new generator );
			
			return cache.retreive( generator );
		}
	}
}