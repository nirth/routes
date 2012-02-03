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
package eu.kiichigo.utils.events
{
	import flash.events.IEventDispatcher;
	/**
	 *
	 * @example	
	 * <code>
	 * 	var listen:Function = switcher( this, handle, FlexEvent.CREATION_COMPLETE, FlexEvent.PREINITIALIZE, FlexEvent.INITIALIZE );
			listen( true );		//Adds listener "handle" to CREATION_COMPLETE, PREINITIALIZE, INITIALIZE events
			listen( false );	//Removes them
			//Or
			var listen:Function = switcher( this, FlexEvent.CREATION_COMPLETE, handleCreationComplete,
												  FlexEvent.PREINITIALIZE, handlePreInitialize,
												  FlexEvent.INITIALIZE, handleInitialize,
												  false, 0, true ); //capture = false, priority = 0, weakReference = true
				listen( true );		//Adds handleCreationComplete => CREATION_COMPLETE, handlePreInitialize => PREINITIALIZE etc.
				listen( false );	//Removes them 
	 */
	public function switcher( dispatcher:IEventDispatcher, ...rest ):Function
	{
		var closure:Function = function( add:Boolean ):Function
		{
			if( add )
				listen.apply( null, [dispatcher.addEventListener].concat( rest ) );
			else
				listen.apply( null, [dispatcher.removeEventListener].concat( rest ) );
			return closure;
		};
		return closure;
	}
}