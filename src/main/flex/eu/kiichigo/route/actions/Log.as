package eu.kiichigo.route.actions
{
	import eu.kiichigo.route.kore.Action;
	import eu.kiichigo.utils.log;
	
	public class Log extends Action
	{
		/**
		 * @private
		 */
		protected var log:Function = eu.kiichigo.utils.log( "Log" );
		
		/**
		 * @private
		 */
		protected var _filter:Object;
		/**
		 * 
		 */
		public function get filter():Object
		{
			return _filter;
		}
		/**
		 * @private
		 */
		public function set filter( value:Object ):void
		{
			if( _filter === value )
				return;
			_filter = value;
			log = eu.kiichigo.utils.log( value );
		}
		
		/**
		 * @private
		 */
		protected var _message:String = null;
		/**
		 * 
		 */
		public function get message():String
		{
			return _message;
		}
		/**
		 * @private
		 */
		public function set message( value:String ):void
		{
			if( _message === value )
				return;
			_message = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function exec( term:Object ):void
		{
			if( message != null )
				log( message, term );
			else
				log( term );
		}
	}
}