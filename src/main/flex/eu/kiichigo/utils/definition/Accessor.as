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
	/**
	 * 
	 * @author Nirth
	 * 
	 */
	public class Accessor extends Member
						  implements IMember,
						  			 IProperty
	{
		/**
		 * @private
		 */
		public static const READ:String = 'read';
		/**
		 * @private
		 */
		public static const WRITE:String = 'write';
		/**
		 * @private
		 */
		public static const READWRITE:String = 'readwrite';
		
		/**
		 * Constructor 
		 * @param name
		 * @param declaredBy
		 * @param type
		 * @param access
		 * @param metadata
		 * 
		 */
		public function Accessor(name:String = null, declaredBy:Class = null, type:Class = null,
								 access:String = null, metadata:Vector.<Metadata> = null)
		{
			super(name, declaredBy, type, metadata);
		}
		
		/**
		 * 
		 */
		public function get access():String
		{
			return _access;
		}
		/**
		* @private
		*/
		protected var _access:String
		
		
		/**
		 * 
		 */
		public function get read():Boolean
		{
			return _access.indexOf('read') >= 0;
		}
		
		/**
		 * 
		 */
		public function get write():Boolean
		{
			return _access.indexOf('write') >= 0;
		}
	}
}