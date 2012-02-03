package eu.kiichigo.route.utils.sentence
{
	public class Word implements IWord
	{
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
	}
}