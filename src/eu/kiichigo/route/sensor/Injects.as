package eu.kiichigo.route.sensor
{
	import eu.kiichigo.route.events.BuildEvent;
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.utils.EventProxy;
	import eu.kiichigo.route.utils.IEventProxy;
	import eu.kiichigo.route.utils.log;
	
	import flash.events.Event;
	
	import mx.core.FlexGlobals;

	public class Injects extends Sensor
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Injects );
		
		/**
		 * @private
		 */
		protected const application:IEventProxy = new EventProxy( EventProxy.APPLICATION );
		/**
		 * @priavte
		 */
		protected const parent:IEventProxy = new EventProxy;
		
		/**
		 * @iheritDoc
		 */
		override protected function initialize():void
		{
			application.addEventListener( Event.ADDED_TO_STAGE, handle, true );
			parent.addEventListener( BuildEvent.BUILD, handle );
		}
		
		/**
		 * @inheritDoc
		 */
		override public function set router( value:IRouter ):void
		{
			super.router = value;
			parent.mode = value;
		}
		
		protected function handle( event:Event ):void
		{	
			send( event is BuildEvent ? ( event as BuildEvent ).instance : event.target );
		}
	}
}