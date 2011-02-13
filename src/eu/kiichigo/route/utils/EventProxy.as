package eu.kiichigo.route.utils
{	
	import eu.kiichigo.utils.apply;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getDefinitionByName;
	
	public class EventProxy implements IEventDispatcher,
									   IEventProxy
	{
		/**
		 * In this mode <code>IEventProxy</code> will attempt to listen events on Flex Application instance.
		 */
		public static const APPLICATION:String = "application";
		
		/**
		 * In this mode <code>IEventProxy</code> will attempt to listen events on root of the display list.
		 */
		public static const ROOT:String = "root";
		
		/**
		 * In this mode <code>IEventProxy</code> will attempt to listen events on <code>stage</code> of the display list.
		 */
		public static const STAGE:String = "stage";

		
		/**
		 * Actual Dispatcher.
		 */
		protected var dispatcher:IEventDispatcher;
		
		/**
		 * List of Handlers to Suscribe if no <code>dispatcher</code> is set.
		 */
		protected const handlers:Vector.<Handler> = new Vector.<Handler>;
		
		public function EventProxy( mode:Object = null )
		{
			super();
			
			if( mode )
				this.mode = mode;
		}
		
		/********************
		 * IEventDispatcher *
		 ********************/
		
		/**
		 * @inheritDoc
		 */
		public function addEventListener( type:String, listener:Function,
										  useCapture:Boolean = false, priority:int = 0,
										  useWeakReference:Boolean = false ):void
		{
			if( dispatcher )
				dispatcher.addEventListener( type, listener, useCapture, priority, useWeakReference );
			
			handlers.push( apply( { type: type,
									listener: listener,
									useCapture: useCapture,
									priority: priority,
									useWeakReference: useWeakReference },
								  new Handler ) );
			
			//log( "addEventListener", type, useCapture, priority, useWeakReference );
		}
		/**
		 * @inheritDoc
		 */
		public function removeEventListener( type:String, listener:Function,
											 useCapture:Boolean = false ):void
		{
			if( dispatcher )
				dispatcher.removeEventListener( type, listener, useCapture );
			
			handlers.splice( handlers.indexOf( handlers.filter(
				function( item:Handler, index:int, vector:Vector.<Handler> ):Boolean
				{ return item.type == type && item.listener == listener && item.useCapture == useCapture } ) ), 1 );
		}
		/**
		 * @inheritDoc
		 */
		public function dispatchEvent( event:Event ):Boolean
		{
			return dispatcher == null ? false : dispatcher.dispatchEvent( event );
		}
		/**
		 * @inheritDoc
		 */
		public function hasEventListener( type:String ):Boolean
		{
			return false;
		}
		/**
		 * @inheritDoc
		 */
		public function willTrigger( type:String ):Boolean
		{
			return false;
		}
		
		/***************
		 * IEventProxy *
		 ***************/
		
		/**
		 * @private
		 */
		protected var _mode:Object;
		/**
		 * @copy		eu.kiichigo.route.utils.IEventProxy#mode
		 */
		public function get mode():Object
		{
			return _mode;
		}
		/**
		 * @private
		 */
		public function set mode( value:Object ):void
		{
			if( _mode === value )
				return;
			
			var old:IEventDispatcher = dispatcher;
			
			_mode = value;
	
			if( value === APPLICATION )
				dispatcher = getDefinitionByName( "mx.core::FlexGlobals" ).topLevelApplication;
			else if( value is IEventDispatcher )
				dispatcher = value as IEventDispatcher;
			
			applyHandlers( dispatcher, old, handlers );
		}

		/**
		 * @private
		 * Applies current proxy to newly added or removed <code>dispatcher</code>.
		 * 
		 * @param dispatcher		Newly added <code>IEventDispatcher</code> or removed in case of <code>null</code>.
		 * @param old				Old <code>IEventDispatcher</code> if any.
		 * @param handlers			Coolection of <code>Handler</code> instances representing currently listened events.
		 * 
		 */
		protected function applyHandlers( dispatcher:IEventDispatcher, old:IEventDispatcher, handlers:Vector.<Handler> ):void
		{
			//log( "applyHandlers dispatcher: {0} old: {1}, handlers: {2}", dispatcher, old, handlers.length );
			for( var i:uint = 0; i < handlers.length; i ++ )
			{
				var item:Handler = handlers[i];
				
				if( dispatcher )
					dispatcher.addEventListener( item.type, item.listener,
						item.useCapture, item.priority, item.useWeakReference );
				if( old )
					old.removeEventListener( item.type, item.listener, item.useCapture );
			}
		}
	}
}
/**
 * Class represents data about event listener/handler. It's stored in a collection in case of change in <code>IEventDispatcher</code> instance so that we can unsuscribe old one, and fully initialize new one.
 * This also allows us to queue <code>IEventDispatcher.addEventListener</code> calls in case if no dispatcher is assigned yet.
 */
class Handler
{
	public var type:String;
	public var listener:Function;
	public var useCapture:Boolean;
	public var priority:int;
	public var useWeakReference:Boolean;
	
	public function toString():String
	{
		return "[Handler " + type + "]";
	}
}