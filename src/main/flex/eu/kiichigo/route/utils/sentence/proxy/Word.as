package eu.kiichigo.route.utils.sentence.proxy
{
	import eu.kiichigo.route.utils.sentence.IWord;
	
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	public dynamic class Word extends Proxy implements IWord
	{
		use namespace flash_proxy;
		
		/**
		 * Creates new instance of <code>Word</code> class.
		 *  
		 * @param value				Optional, value of an instance of <code>IWord</code>.
		 * @param predecessor		Optional, <code>IWord</code>'s predecessor (parent) if any.
		 */
		public function Word( value:Object = null, predecessor:IWord = null )
		{
			super();
			
			if( value )
				this.value = value;
			
			if( predecessor )
				this.predecessor = predecessor;
				
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.utils.sentence.Word#sentence
		 */
		public function get sentence():Vector.<IWord>
		{
			var s:Vector.<IWord> = new Vector.<IWord>;
				s.push( this );
			var p:IWord = _predecessor;
			
			while( p != null )
				s.push( p ), p = p.predecessor;
			
			return s.reverse();
		}
		
		
		/**
		 * @private
		 */
		protected var _value:Object;
		/**
		 * @copy		eu.kiichigo.route.utils.sentence.Word#value
		 */
		public function get value():Object
		{
			return _value;
		}
		/**
		 * @private
		 */
		public function set value( value:Object ):void
		{
			_value = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _children:Vector.<IWord> = null;
		/**
		 * @copy		eu.kiichigo.route.utils.sentence.Word#children
		 */
		public function get children():Vector.<IWord>
		{
			return null;
		}
		/**
		 * @private
		 */
		public function set children( value:Vector.<IWord> ):void
		{
			_children = value;
		}
		
		
		/**
		 * @private
		 */
		protected var _predecessor:IWord;
		/**
		 * @copy		eu.kiichigo.route.utils.sentence.Word#predecessor
		 */
		public function get predecessor():IWord
		{
			return _predecessor;
		}
		/**
		 * @private
		 */
		public function set predecessor( value:IWord ):void
		{
			_predecessor = value;
		}
		
		
		/**
		 * @inheritDoc
		 */
		override flash_proxy function getProperty( name:* ):*
		{
			if( _children === null )
				_children = new Vector.<IWord>;
			
			for( var i:uint = 0; i < _children.length; i ++ )
				if( _children[i].value == name )
					return _children[i];
			
			var word:IWord = new Word( name, this );
			_children.push( word );
			return word;
		}
		
		public function toString():String
		{
			return value.toString();
		}
	}
}