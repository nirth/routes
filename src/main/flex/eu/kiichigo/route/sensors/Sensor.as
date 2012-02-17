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
	import eu.kiichigo.route.utils.ICommitable;
	import eu.kiichigo.utils.log;
	
	/**
	 * Base class for Sensors in Route Framework. It implements <code>ISensor</code> API and defines auxiliary methods to be overriden in subclasses that can handle initialization.
	 * 
	 * @author David "Nirth" Sergey
	 * @url	http://kiichigo.eu
	 * @email d@kiichigo.eu
	 */
	public class Sensor implements ISensor
	{
		/**
		 * @private
		 */
		protected static const log:Function = eu.kiichigo.utils.log(Sensor);
		
		/**
		 * Constructor
		 */
		public function Sensor()
		{
			super();
			
			initialize();
		}
		
		
		/**
		 * @private
		 * Handles initialization of a component.
		 */
		protected function initialize():void
		{
			
		}
		
		
		/**
		 * @private
		 */
		protected var _router:IRouter
		
		/**
		 * @copy		eu.kiichigo.route.sensors.ISensor#router
		 */
		public function get router():IRouter
		{
			return _router;
		}
		/**
		 * @private
		 */
		public function set router( value:IRouter ):void
		{
			_router = value;
		}
		
		
		/**
		 * List of <code>IRoute</code> instances for current <code>Perceiver</code>.
		 * Iterate through this list in subclasses in order to pass <code>percept</code> to <code>IRoute</code> instances.
		 */
		protected const routes:Vector.<IRoute> = new Vector.<IRoute>;
		
		/**
		 * @copy		eu.kiichigo.route.sensors.ISensor#add
		 */
		public function add(route:IRoute):IRoute
		{
			if( route === null )
				return null;
			
			routes.fixed = false;
			if( routes.indexOf( route ) == -1 )
				routes.push( process( route ) );
			else
				process( route );
			routes.fixed = true;
			
			return route;
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.sensors.ISensor#pass
		 */
		public function pass(percept:Object):void
		{
			log("pass({0}) => {1}", percept, routes);
			for (var i:uint = 0; i < routes.length; i ++)
				routes[i].perceive(percept);
		}
		
		
		/**
		 * Processes instance of <code>IRoute</code> and applies any changes if needed to work with current <code>ISensor</code>.
		 * Override this method in subclasses.
		 * 
		 * @param	route	An instance of <code>IRoute</code> being added to <code>ISensor</code>.
		 * 
		 * @return			Initialized with current <code>ISensor</code> instance of <code>IRoute</code>.
		 */
		protected function process(route:IRoute):IRoute
		{
			return route;
		}
	}
}