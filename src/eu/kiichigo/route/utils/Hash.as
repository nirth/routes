/*
The MIT License

Copyright (c) 2009-2011 
David "Nirth" Sergey ( nirth@kiichigo.eu, nirth.furzahad@gmail.com )

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
package eu.kiichigo.route.utils
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	public class Hash implements IHash
	{	
		/**
		 * An instance of a <code>Dictionary, that stores data.
		 */
		protected const data:Dictionary = new Dictionary;
		
		
		/**
		 * 
		 */
		protected const _keys:Vector.<Object> = new Vector.<Object>;
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#properties
		 */
		public function get keys():Vector.<Object>
		{
			return _keys;
		}
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#has
		 */
		public function has( key:Object ):Boolean
		{
			return data[key] != null;
		}
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#retreive
		 */
		public function retreive( key:Object ):Object
		{
			return data[key];
		}
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#store
		 */
		public function store( key:Object, value:Object ):Object
		{
			data[key] = value;
			if( _keys.indexOf( key ) == -1 )
				_keys.push( key );
			
			return value;
		}
		
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#clear
		 */
		public function clear():void
		{
			for( var key:* in data )
				data[key] = null;
			
			for( var i:uint = 0; i < _keys.length; i ++ )
				_keys.shift();
		}
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#initialize
		 */
		public function initialize( source:Object ):IHash
		{
			if( source != null )
				for( var property:String in source )
					store( property, source[property] );
			
			return this;
		}
		
		
		/**
		 * @copy		eu.kiichigo.routes.utils.IHash#clear
		 */
		public function forEach( closure:Function, scope:Object = null ):void
		{
			for( var key:Object in data )
				closure.call( scope, key, data[key] );
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function toString():String
		{
			var string:String = "[" + getQualifiedClassName( this ).split( "::" )[1] + " ";
			for( var property:String in data )
				string += property + "=" + data[property];
			return string + "]";
		}
	}
}