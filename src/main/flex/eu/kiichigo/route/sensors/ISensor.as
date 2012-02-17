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
package eu.kiichigo.route.sensors
{
	import eu.kiichigo.route.kore.IRouter;
	import eu.kiichigo.route.routes.IRoute;

	/**
	 * The ISensor interface defines API for Sensors that will provide percept to <code>IRoute</code> instances. 
	 * @author David "Nirth" Sergey
	 * @url	http://kiichigo.eu
	 * @email d@kiichigo.eu
	 */
	public interface ISensor
	{
		/**
		 * <code>IRouter</code> reference
		 */
		function get router():IRouter;
		/**
		 * @private
		 */
		function set router( value:IRouter ):void;

		
		/**
		 * Registeres <code>IRoute</code> instance with <code>IPerceiver</code> in order to receive percepts.
		 * 
		 * @param 	route	A reference to an <code>IRoute</code> instance that will receive percepts from current <code>IPerciever</code>
		 * 	
		 * @return			Newly added to <code>IPerceiver</code> instance of <code>IRoute</code>.
		 */
		function add( route:IRoute ):IRoute;
		
		
		/**
		 * Passes percept along to the <code>IRoute</code> instances registered with current sensor.
		 * 
		 * @param	percept	A percept that will be passed down to instances of <code>IRoute</code>
		 */
		function pass(percept:Object):void;
	}
}