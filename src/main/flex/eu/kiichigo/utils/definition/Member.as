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
	public class Member implements IMember
	{
		public function Member( name:String,
									declaredBy:Class,
									type:Class,
									metadata:Vector.<Metadata>)
		{
			super();
			
			_name = name;
			_declaredBy = declaredBy;
			_type = type;
			_metadata = metadata;
		}
		
		protected var _name:String;
		public function get name():String
		{
			return _name;
		}
		
		protected var _declaredBy:Class;
		public function get declaredBy():Class
		{
			return _declaredBy;
		}
		
		protected var _type:Class
		public function get type():Class
		{
			return _type;
		}
		
		protected var _metadata:Vector.<Metadata>;
		public function get metadata():Vector.<Metadata>
		{
			return _metadata;
		}
		
		public function indexOfMetadata( name:String ):int
		{
			if( !_metadata || !_metadata.length )
				return -1;
			for ( var i:int = 0; i < _metadata.length; i ++ )
				if( _metadata[i].name == name )
					return i;
			return -1;
		}
		
		public function findMetadata( name:String ):Vector.<Metadata>
		{
			var result:Vector.<Metadata> = new Vector.<Metadata>;
			for ( var i:int = 0; i < _metadata.length; i ++ )
				if( _metadata[i].name == name )
					result.push( _metadata[i] );
			result.fixed = true;
			return result;	
		}
	}
}