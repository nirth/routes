package eu.kiichigo.route.actions
{
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.Hash;
	import eu.kiichigo.route.utils.IHash;
	import eu.kiichigo.utils.log;
	
	public class Properties extends Action implements IProperties
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( Properties );
		
		
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
		public function set from( value:Object ):void
		{
			_from = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _to:Object = null;
		
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
		public function set to( value:Object ):void
		{
			_to = value;
		}
		
		
		/**
		 * @inheritDoc
		 */
		override protected function exec( percept:Object ):void
		{
			if( evaluate( percept ) )
				fields.initialize( this ).forEach( iterate );
		}
		
		
		/**
		 * @private
		 * 
		 * Auxiliary mehtod, handles intiailizaiton of <code>from</code> and <code>to</code> values.
		 * 
		 * @param	percept		A reference to the <code>percept</code> received by <code>IProperties</code>
		 * @return				Boolean value. <code>true</code> if evaluation successful, <code>false</code> otherwise.
		 */
		protected function evaluate( percept:Object ):Boolean
		{
			// If from and to are null, quit.
			log( "route: {0}", _route );
			if( _from === null || _to === null )
				return false;
			
			if( _from === null )
				_from = percept;
			
			if( _to === null )
				_to = percept;
			
			if( _from is Class )
				_from = _route.router.instances.retreive( _from as Class );
			
			if( _to is Class )
				_to = _route.router.instances.retreive( _to as Class );
			
			return true;
		}
		
		
		/**
		 * @private
		 * 
		 * Auxiliary method, you should not override it unless you want to change data flow.
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
		
		
		/**
		 * @inheritDoc
		 */
		override public function toString():String
		{
			var string:String = "[Properties from=" + from + " to=" + to;
			for( var property:String in this )
				string += " " + property + "=" + this[property].toString();
			return string + "]";
		}
	}
}