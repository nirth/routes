package eu.kiichigo.route.utils.sentence
{
	public interface IWord
	{
		/**
		 * A sequence of children constructed by reading <code>IWord.predecessor</code> consecutivly. Contructing a "sentence".
		 * Following example demostraits constructing a sentence out of two instance of <code>IWord</code>.
		 * <code>
		 * var hello:IWord = new MyWordImpl( "hello" );
		 * var world:IWord = hello.add( new MyWordImpl( "world" ) );
		 * trace( world.sentence ); // Will output [MyWordImpl value="hello"], [MyWordImpl value="world"]
		 * </code>
		 */ 
		function get sentence():Vector.<IWord>;
		
		
		/**
		 * A value assigned to current instance of <code>IWord</code>.
		 */
		function get value():Object;
		/**
		 * @private
		 */
		function set value( value:Object ):void;
		
		
		/**
		 * List of immediate children of current <code>IWord</code> instance.
		 */
		function get children():Vector.<IWord>;
		/**
		 * @private
		 */
		function set children( value:Vector.<IWord> ):void;
		
		
		/**
		 * Immidiate predecessor (parent) of current word. <code>null</code> if element is first (root).
		 */
		function get predecessor():IWord;
	}
}