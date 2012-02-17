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
package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.routes.IRoute;

	public interface IAction
	{
		/**
		 * Reference to the <code>IRoute</code> instance that's a parent to current <code>IAction</code>.
		 */
		function get route():IRoute;
		/**
		 * @private
		 */
		function set route(value:IRoute):void;
		
		/**
		 * Executes current <code>IAction</code> instance with <code>percept</code> received from the <code>IRoute</code> 
		 * @param percept		<code>Object</code> passed by <code>IRoute</code>.
		 * @return 				An instance of current <code>IAction</code>.
		 */
		function run(percept:Object):IAction;
		
		/**
		 * Passes percept along instances of <code>IRoute</code> registered with same <code>ISensor</code>.
		 * 
		 * @param	percept
		 * @return	<code>Object</code>, percept.
		 */
		function pass(percept:Object):Object;
	}
}