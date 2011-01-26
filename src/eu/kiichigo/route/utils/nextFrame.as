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
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public function nextFrame( closure:Function ):Function
	{	
		var beacon:Beacon = new Beacon;
		
		return function():void
		{	
			beacon.add( closure );
		}
	}
}
import eu.kiichigo.route.utils.log;

import flash.display.Sprite;
import flash.events.Event;

/**
 * @private
 */
class Beacon extends Sprite
{
	/**
	 * @private
	 */
	protected const closures:Vector.<Function> = new Vector.<Function>;
	/**
	 * @private
	 */
	public function add( closure:Function ):void
	{
		if( closures.indexOf( closure ) >= 0 )
			return;
		
		closures.push( closure );
		addEventListener( Event.ENTER_FRAME, handle );
	}
	/**
	 * @private
	 */
	protected function handle( event:Event ):void
	{
		removeEventListener( Event.ENTER_FRAME, handle );
		
		for( var i:uint = 0; i < closures.length; i ++ )
			closures.shift().apply();
	}
}