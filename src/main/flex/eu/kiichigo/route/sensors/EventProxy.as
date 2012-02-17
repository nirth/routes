package eu.kiichigo.route.sensors
{
	import eu.kiichigo.utils.funs.curry;
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.route.routes.Handle;
	import eu.kiichigo.route.utils.add;
	import eu.kiichigo.route.utils.handler;
	import eu.kiichigo.route.utils.vector;
	import eu.kiichigo.utils.apply;
	import eu.kiichigo.utils.log;
	import eu.kiichigo.utils.toString;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getDefinitionByName;
	
	
	public class EventProxy implements IEventProxy
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( EventProxy );
		
		
		/**
		 * Mode in which EventProxy will listen to Application and SystemManager.
		 */
		public static const FLEX:String = "flex";
		
		
		public static function create(mode:String):IEventProxy
		{
			var ep:EventProxy = new EventProxy;
				
			if( mode == FLEX )
			{
				var app:IEventDispatcher = getDefinitionByName("mx.core.FlexGlobals")["topLevelApplication"];
				ep.add(app);
				
				log("EventProxy.create({0}):{1}", mode, app);
			}
			
			return ep;
		}
		
		protected const handlers:Vector.<Handler> = new Vector.<Handler>;
		
		
		/***************
		 * IEventProxy *
		 ***************/
		
		/**
		 * @private
		 */
		protected const _dispatchers:Vector.<IEventDispatcher> = new Vector.<IEventDispatcher>;
		
		/**
		 * @copy		eu.kiichigo.route.sensors.IEventProxy#dispatchers
		 */
		public function get dispatchers():Vector.<IEventDispatcher>
		{
			return _dispatchers;
		}
		/**
		 * @private
		 */
		public function set dispatchers( value:Vector.<IEventDispatcher> ):void
		{
			eu.kiichigo.route.utils.add( _dispatchers )( value );
			commit( dispatchers, handlers );
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.sensors.IEventProxy#add
		 */
		public function add(dispatcher:IEventDispatcher):IEventDispatcher
		{
			_dispatchers.fixed = false;
			_dispatchers.push( dispatcher );
			_dispatchers.fixed = true;
			
			commit( dispatcher, handlers );
			
			return dispatcher;
		}
		
		
		/********************
		 * IEventDispatcher *
		 ********************/
		
		
		/**
		 * @copy		flash.events.IEventDispatcher#addEventListener
		 */
		public function addEventListener( type:String, listener:Function, useCapture:Boolean = false,
										  priority:int = 0, useWeakReference:Boolean = false ):void
		{
			var handler:Handler = apply( { type: type, listener: listener, useCapture: useCapture, priority: priority, useWeakReference: useWeakReference },
										  new Handler ) as Handler;
			
			handlers.fixed = false;
			handlers.push( handler );
			handlers.fixed = true;
			
			commit( dispatchers, handler );
		}
		
		
		/**
		 * @copy		flash.events.IEventDispatcher#removeEventListener
		 */
		public function removeEventListener( type:String, listener:Function, useCapture:Boolean = false ):void
		{
			var handler:Handler = apply( { type: type, listener: listener, useCapture: useCapture },
										 new Handler ) as Handler;
			
			handlers.fixed = false;
			for( var i:uint = 0; i < handlers.length; i ++ )
				if( handlers[i].equals( handler ) )
					handlers.splice( i, 1 );
			handlers.fixed = true;
			
			commit( dispatchers, handler, false );
		}
		
		
		/**
		 * @copy		flash.events.IEventDispatcher#dispatchEvent
		 */
		public function dispatchEvent(event:Event):Boolean
		{
			return true;
		}
		
		
		/**
		 * @copy		flash.events.IEventDispatcher#hasEventListener
		 */
		public function hasEventListener(type:String):Boolean
		{
			return false;
		}
		
		
		/**
		 * @copy		flash.events.IEventDispatcher#willTrigger
		 */
		public function willTrigger(type:String):Boolean
		{
			return false;
		}
		
		
		protected function commit(dispatcher:Object, handler:Object, add:Boolean = true):void
		{
			var dispatchers:Vector.<IEventDispatcher> =
				( dispatcher is IEventDispatcher ?
					vector( new Vector.<IEventDispatcher>, dispatcher ) :
					dispatcher ) as Vector.<IEventDispatcher>;
			
			var handlers:Vector.<Handler> =
				( handler is Handler ?
					vector( new Vector.<Handler>, handler ) :
					handler ) as Vector.<Handler>;
			
			for( var d:uint = 0; d < dispatchers.length; d ++ )
				for( var h:uint = 0; h < handlers.length; h ++ )
					if( add )
						dispatchers[d].addEventListener( handlers[h].type, handlers[h].listener, handlers[h].useCapture,
														 handlers[h].priority, handlers[h].useWeakReference );
					else
						dispatchers[d].removeEventListener( handlers[h].type, handlers[h].listener, handlers[h].useCapture );
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function toString():String
		{
			return eu.kiichigo.utils.toString( this, "dispatchers" );
		}
	}
}

import eu.kiichigo.utils.toString;

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
	
	
	public function equals( handler:Handler ):Boolean
	{
		return ( this.type == type &&
				 this.listener == listener &&
				 this.useCapture == useCapture );
	}
	
	public function toString():String
	{
		return eu.kiichigo.utils.toString( this, "type", "useCapture", "priority", "useWeakReference" );
	}
}