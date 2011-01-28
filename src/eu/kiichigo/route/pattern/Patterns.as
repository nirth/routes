package eu.kiichigo.route.pattern
{
	import eu.kiichigo.route.utils.log;

	public class Patterns extends Pattern implements IPatterns
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Patterns );
		
		public static const LOGIC_GATE_AND:String = "and";
		public static const LOGIC_GATE_OR:String = "or";
		public static const LOGIC_GATE_XOR:String = "xor";
		public static const LOGIC_GATE_NAND:String = "nand";
		public static const LOGIC_GATE_NOR:String = "nor";
		public static const LOGIC_GATE_XNOR:String = "xnor";
		
		protected namespace lg_and;
		protected namespace lg_or;
		protected namespace lg_xor;
		
		
		public function Patterns( ...rest )
		{
			super();
			
			if( rest.length )
			{
				var patterns:Vector.<IPattern> = new Vector.<IPattern>;
				for( var i:uint = 0; i < rest.length; i ++ )
					patterns.push( rest[i] );
				patterns.fixed = true;
				this.patterns = patterns;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		override public function get keys():Vector.<Object>
		{
			var result:Vector.<Object> = new Vector.<Object>;
			for( var i:uint = 0; i < _patterns.length; i ++ )
				result.concat( _patterns[i].keys );
			return result;
		}
		
		
		/**
		 * @priavte
		 */
		protected var _logicGate:String = "and";
		
		[Inspectable(name="logicGate", type="String", defaultValue="and", enumeration="and,or,xor,nand,nor,xnor")]
		/**
		 * @copy		eu.kiichigo.route.pattern.IPatterns#and
		 */
		public function get logicGate():String
		{
			return _logicGate;
		}
		/**
		 * @private
		 */
		public function set logicGate( value:String ):void
		{
			_logicGate = value;
		}
		
		/**
		 * @private
		 */
		protected var _patterns:Vector.<IPattern>;
		
		/**
		 * @copy		eu.kiichigo.route.pattern.IPatterns#patterns
		 */
		public function get patterns():Vector.<IPattern>
		{
			return _patterns;
		}
		/**
		 * @private
		 */
		public function set patterns(value:Vector.<IPattern>):void
		{
			_patterns = value;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function retreive( key:Object ):Object
		{
			var result:Object = null;
			for( var i:uint = 0; i < _patterns.length; i ++ )
				if( _patterns[i].has( key ) )
					result = _patterns[i].retreive( key );
			return result;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function match( percept:Object ):Boolean
		{
			if( _logicGate == LOGIC_GATE_AND )
				return lg_and::match( percept );
			else if ( _logicGate == LOGIC_GATE_OR )
				return lg_or::match( percept );
			
			return false;
		}
		
		lg_and function match( percept:Object ):Boolean
		{
			for( var i:uint = 0; i < _patterns.length; i ++ )
				if( !_patterns[i].match( percept ) )
					return false;
			return true;
		}
		
		lg_or function match( percept:Object ):Boolean
		{
			for( var i:uint = 0; i < _patterns.length; i ++ )
				if( _patterns[i].match( percept ) )
					return true;
			return false;
		}
	}
}