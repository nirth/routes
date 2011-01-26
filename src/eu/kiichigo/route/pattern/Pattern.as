package eu.kiichigo.route.pattern
{
	import eu.kiichigo.route.routes.IRoute;
	import eu.kiichigo.route.utils.Hash;
	import eu.kiichigo.route.utils.ICommitable;
	import eu.kiichigo.route.utils.IHash;

	public class Pattern extends Hash implements IPattern
	{	
		/**
		 * @private
		 */
		protected var _route:IRoute;
		
		/**
		 * @copy		eu.kiichigo.route.pattern.IPattern#route
		 */
		public function get route():IRoute
		{
			return _route;
		}
		/**
		 * @private
		 */
		public function set route( value:IRoute ):void
		{
			_route = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _matcher:Function;
		/**
		 * @copy		eu.kiichigo.route.pattern.IPattern#matcher
		 */
		public function get matcher():Function
		{
			return _matcher;
		}
		/**
		 * private
		 */
		public function set matcher(value:Function):void
		{
			_matcher = value;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.pattern.IPattern#matcher
		 */
		public function match( percept:Object ):Boolean
		{
			if( matcher as Function )
				return matcher( this, percept );
			return false;
		}
	}
}