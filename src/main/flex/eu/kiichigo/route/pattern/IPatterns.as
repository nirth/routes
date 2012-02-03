package eu.kiichigo.route.pattern
{
	public interface IPatterns extends IPattern
	{
		/**
		 * 
		 */
		function get logicGate():String;
		/**
		 * @private
		 */
		function set logicGate( value:String ):void;
		
		/**
		 * 
		 */
		function get patterns():Vector.<IPattern>;
		/**
		 * @private
		 */
		function set patterns( value:Vector.<IPattern> ):void;
	}
}