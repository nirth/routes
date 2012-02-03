package eu.kiichigo.route.events
{
	import flash.events.Event;
	
	public final class BuildEvent extends Event
	{
		public static const BUILD:String = "created";
		
		public function BuildEvent( type:String, instance:Object = null )
		{
			super( type );
			
			_instance = instance;
		}
		
		/**
		 * @private
		 */
		protected var _instance:Object;
		/**
		 * 
		 */
		public function get instance():Object
		{
			return _instance;
		}
		
		/**
		 * @iheritDoc
		 */
		override public function clone():Event
		{
			return new BuildEvent( type, _instance );
		}
		/**
		 * @iheritDoc
		 */
		override public function toString():String
		{
			return formatToString( "BuildEvent", "type", "instance" );
		}
	}
}