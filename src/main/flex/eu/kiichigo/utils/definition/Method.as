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
	import __AS3__.vec.Vector;
	
	public class Method extends Member
	{
		public function Method(name:String,
							   declaredBy:Class,
							   returnType:Class,
							   parameters:Vector.<Parameter>,
							   metadata:Vector.<Metadata>)
		{
			super(name, declaredBy, returnType, metadata);
			
			_parameters = parameters;
		}
		
		public function get returnType():Class
		{
			return _type;
		}
		
		protected var _parameters:Vector.<Parameter>;
		public function get parameters():Vector.<Parameter>
		{
			return _parameters;
		}
		
		public function get length():uint
		{
			if( _parameters )
				return _parameters.length;
			return 0;
		}
	}
}