/*
The MIT License

Copyright (c) 2008 David Sergey, nirth@fouramgames.com, nirth.furzahad@gmail.com

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
package eu.kiichigo.utils.definition
{	
	public class Metadata
	{
		public function Metadata( name:String = null, args:Vector.<Arg> = null )
		{
			super();
			
			_name = name;
			_args = args;
			
			if( args )
			{
				_keys = new Vector.<String>;
				_values = new Vector.<String>;
				
				for ( var i:int = 0; i < _args.length; i ++ )
					_keys.push( args[i].key ), _values.push( args[i].value );

				_keys.fixed = _values.fixed = true;
			}	
		}
		
		protected var _name:String;
		public function get name():String
		{
			return _name;
		}
		
		protected var _args:Vector.<Arg>;
		public function get args():Vector.<Arg>
		{
			return _args;
		}
		
		protected var _keys:Vector.<String>;
		public function get keys():Vector.<String>
		{
			return _keys;
		}
		
		protected var _values:Vector.<String>;
		public function get values():Vector.<String>
		{
			return _values;
		}
		
		public function getValue( key:String ):String
		{
			var index:int = _keys.indexOf( key );
			if( index >= 0 )
				return _values[index];
			return null;
		}
	}
}