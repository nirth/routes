package eu.kiichigo.route.utils
{
	public interface IHash
	{
		/**
		 * List of keys stored in <code>IHash</code>.
		 */
		function get keys():Vector.<Object>;
		
		/**
		 * Checks if there is a value associated with key, and returns <code>true</code> and <code>false</code> otherwise.
		 * @param key		<code>Object</code> representation of a key.
		 * @return 			<code>true</code> if <code>key</code> has a values assigned to it, <code>false</code> otherwise.
		 */
		function has( key:Object ):Boolean;
		/**
		 * Retreives value associated with a <code>key</code> supplied in arguments, or <code>null</code> if no key-value pair exists.
		 * @param key		<code>Object</code> representation of a key to search element by.
		 * @return 			<code>Object</code> representation of a value, if no key-value pair exists <code>null</code> is returned.
		 */
		function retreive( key:Object ):Object;
		
		/**
		 * Stores <code>value</code> passed in argument with a given <code>key</code>.
		 * @param key			<code>Object</code> representation of a key.
		 * @param value			<code>Object</code> representation of a value.
		 * @return				A <code>value</code> passed as argument.
		 */
		function store( key:Object, value:Object ):Object;
		
		/**
		 * Clears <code>ISimpleMap</code> instance.
		 */
		function clear():void;
		
		/**
		 * Executes a closure on each key-value pair.
		 * 
		 * @param closure		Funciton closure that will be invoked for each key-value pair.
		 * 						Closure should follow <code>function( key:Object, value:Object ):void;</code> signature.
		 * @param scope			Scope of a function, to which <code>this</code> will refer, set as <code>null</code> to leave scope unchanged.
		 */
		function forEach( closure:Function, scope:Object = null ):void;
	}
}