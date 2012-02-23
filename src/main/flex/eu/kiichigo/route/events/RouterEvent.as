package eu.kiichigo.route.events
{
	import eu.kiichigo.utils.toString;
	
	import flash.events.Event;
	
	public class RouterEvent extends Event
	{
		public static const INSTANCE_CREATED:String = "instanceCreated";
		
		public static const PERCEPT_CHANGED:String = "perceptChanged";
		
		public function RouterEvent( type:String )
		{
			super( type );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clone():Event
		{
			return new RouterEvent( type );
		}
		
		
		/**
		 * @inheritDoc
		 */
		override public function toString():String
		{
			return eu.kiichigo.utils.toString( this, "type" );
		}
	}
}