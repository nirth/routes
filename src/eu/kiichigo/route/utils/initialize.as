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
	/**
	 * Unsafe object initializer, this method will not catch errors for performance concerns.
	 * 
	 * @param to	Object that will be initialized, if <code>Class</code> is passed, object will be automatically created.
	 * @param from	Object - holder of the properties that will be applied onto <code>to</code> argument.
	 * @return		<code>to</code> object with applied parameters.
	 */
	public function initialize( to:Object, from:Object ):Object
	{
		if( to is Class )
			to = new to;
		
		for( var property:String in from )
			to[property] = from[property];
		
		return to;
	}
}