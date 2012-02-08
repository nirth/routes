package eu.kiichigo.vo
{
	import eu.kiichigo.utils.apply;
	import eu.kiichigo.utils.definition.Definition;
	import eu.kiichigo.utils.definition.getDefinition;
	import eu.kiichigo.utils.getClassName;
	import eu.kiichigo.utils.log;
	import eu.kiichigo.utils.objectify;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.ByteArray;
	
	import mx.events.PropertyChangeEvent;
	
	[Bindable]
	public class ValueObject extends EventDispatcher implements IValueObject
	{
		public function ValueObject()
		{
			super();
			
			initialize();
		}
		
		protected function initialize():void
		{
			//var definition:Definition = getDefinition(this);

			//for( var i:uint = 0; i < definition.properties.length; i ++ )
			//	log( ValueObject )( definition.properties[i].metadata );
		}
		
		/**
		 * @private
		 */
		protected const _properties:Vector.<String> = new Vector.<String>;
		/**
		 * @copy		eu.kiichigo.net.vo.IValueObject#properties
		 */
		public function get properties():Vector.<String> { return _properties; }
		
		/**
		 * @private
		 * Dispatches <code>PropertyChangeEvent</code> with selected parameters. Used for bindings.
		 *  
		 * @param property	Property name, which dispatches event.
		 * @param old		Old value.
		 * @param value		New value.
		 * @return 			Boolean, indicates whether event was sent or not.
		 * 
		 * @see	mx.events.PropertyChangeEvent
		 */
		protected function propertyChange(property:String, old:*, value:*):Boolean
		{
			return dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, property, old, value))
		}
		
		/**
		 * @private
		 */
		protected function map(property:String):IValueObject
		{
			_properties.push(property);
			return this;
		}
		
		protected function formatToString():String
		{
			var result:String = "[" + getClassName(this);
			for (var i:int = 0; i < _properties.length; i ++)
				result += " " + _properties[i] + "=" + this[_properties[i]];
			return result + "]";
		}
		
		override public function toString():String
		{
			return formatToString();
		}
	}
}