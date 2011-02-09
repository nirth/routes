package eu.kiichigo.route.actions
{
	import eu.kiichigo.route.kore.Action;
	
	public class Run extends Action
	{
		/**
		 * @private
		 */
		protected var _closure:Function;
		/**
		 * 
		 */
		public function get closure():Function
		{
			return _closure;
		}
		/**
		 * @private
		 */
		public function set closure( value:Function ):void
		{
			_closure = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _method:String;
		/**
		 * 
		 */
		public function get method():String
		{
			return _method;
		}
		/**
		 * @private
		 */
		public function set method( value:String ):void
		{
			_method = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _on:Object;
		/**
		 * 
		 */
		public function get on():Object
		{
			return _on;
		}
		/**
		 * @private
		 */
		public function set on( value:Object ):void
		{
			_on = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _arguments:Array;
		/**
		 * 
		 */
		public function get arguments():Array
		{
			return _arguments;
		}
		/**
		 * @private
		 */
		public function set arguments( value:Array ):void
		{
			_arguments = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function exec( percept:Object ):void
		{
			var fun:Function = ( ( _closure as Function ) == null ) ? 
					( ( _on is Class ) ?
						_route.router.instances.retreive( _on as Class ) :
						_on )[_method] :
					_closure;
			
			fun.apply( null, _arguments );
		}
	}
}