package eu.kiichigo.route.actions
{
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.route.utils.Hash;
	import eu.kiichigo.route.utils.IHash;
	import eu.kiichigo.route.utils.log;
	
	public dynamic class Properties extends Action implements IProperties
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Properties );
		
		
		/**
		 * @private
		 */
		protected const _fields:IHash = new Hash;
		/**
		 * @copy		eu.kiichigo.route.actions.IProperty#fields
		 */
		public function get fields():IHash
		{
			return _fields;
		}
		
		
		/**
		 * 
		/**
		 * @private
		 */
		protected var _from:Object = null;
		
		/**
		 * @copy		eu.kiichigo.route.actions.IProperty#from
		 */
		public function get from():Object
		{
			return _from;
		}
		/**
		 * @private
		 */
		public function set from(value:Object):void
		{
			_from = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _to:Object;
		
		/**
		 * @copy		eu.kiichigo.route.actions.IProperty#to
		 */
		public function get to():Object
		{
			return _to;
		}
		/**
		 * @private
		 */
		public function set to(value:Object):void
		{
			_to = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function exec( percept:Object ):void
		{
			// We assume that all properties was stored as dynamic fields of a IProperty
			for( var field:String in this )
				fields.store( field, this[field] );
			
			// If <code>from</code> is not defined, percept is used as a source.
			if( _from === null )
				_from = percept;
			
			fields.forEach( iterate );
		}
		
		
		/**
		 * @private
		 * 
		 * Auxilary function, you should not override it unless you want to change data flow.
		 * 
		 * @param key		<code>key</code> element a <code>IProperty.fields</code>
		 * @param value		<code>value</code> element a <code>IProperty.fields</code>
		 */
		protected function iterate( key:Object, value:Object ):void
		{
			process( _from, value,
				     _to, key );
		}
		
		
		/**
		 * Override this method in subclasses in order to change functionality of <code>IProperty</code>.
		 * 
		 * @param from			Reference to the <code>IProperty.from</code>
		 * @param fromField		<code>key</code> on the <code>IProperty.fields</code>.
		 * @param to			Reference to the <code>IProperty.to</code>.
		 * @param toField		<code>value</code> on the <code>IProperty.fields</code>.
		 */
		protected function process( from:Object, fromField:Object,
									to:Object, toField:Object ):void
		{
			log( "processing from:{0}, fromField:{1}, " +
				 "to:{2}, toField:{3}", from, fromField, to, toField );
		}
	}
}