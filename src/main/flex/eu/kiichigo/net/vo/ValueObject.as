package eu.kiichigo.net.vo
{
	import eu.kiichigo.utils.apply;
	import eu.kiichigo.utils.definition.Definition;
	import eu.kiichigo.utils.definition.getDefinition;
	import eu.kiichigo.utils.log;
	import eu.kiichigo.utils.objectify;
	
	import flash.utils.ByteArray;
	
	public class ValueObject implements IValueObject
	{
		public function ValueObject()
		{
			super();
			
			initialize();
		}
		
		protected function initialize():void
		{
			var definition:Definition = getDefinition(this);

			for( var i:uint = 0; i < definition.properties.length; i ++ )
				log( ValueObject )( definition.properties[i].metadata );
		}
		
		
		/**
		 * @copy		eu.kiichigo.net.IValueObject#object
		 */
		public function get object():Object { return objectify( this, _properties ); }
		/**
		 * @private
		 */
		public function set object(value:Object):void { apply( value, this ); }
		

		/**
		 * @private
		 */
		protected var _properties:Vector.<String>;
		/**
		 * @copy		eu.kiichigo.net.vo.IValueObject#properties
		 */
		public function get properties():Vector.<String> { return _properties; }
		/**
		 * @private
		 */
		public function set properties(value:Vector.<String>):void { _properties = value; }
		
		/**
		 * @private
		 */
		protected function map(property:String):void
		{
			if(_properties == null)
				_properties = new Vector.<String>;
			_properties.push(property);
		}
	}
}