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
package eu.kiichigo.utils
{
	import flash.external.ExternalInterface;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	
	/**
	 * Logger helper, work with Web Browser console and trace.
	 * <code>
	 * // Initializer:
	 * protected static const logger:Function = eu.kiichigo.debug.log( SomeClass );
	 * // Log simple trace-like messages
	 * 
	 * // Will display "one, two"
	 * logger( "one", "two" );
	 * // Will display "collection someId initialized with 5 elements.
	 * logger( "collection {0} initialized with {2} elements", myCollection.id, myCollection.length ); 
	 * // Will display "Object SomeObject has width 120"
	 * logger( "Object $name has width $width", { name: "SomeObject", width: 120 } );
	 * </code>
	 */
	public function log( filter:Object = "", ...rest:* ):Function
	{
		if( filter is Class )
			filter = getQualifiedClassName( filter ).split( "::" )[1];
		
		if(rest && rest.length)
			rest = [filter].concat(rest), filter = "";
		
		var closure:Function = function( ...messages:* ):void
		{
			var string:String = ( ( filter &&  filter.length ) ? "[" + filter + "] " : "" );
			
			if( messages.length == 2 &&
				messages[0].toString().indexOf( "$" ) != -1 )
			{
				string += messages[0];
				var max:uint = 55;
				while( string.indexOf( "$" ) != -1 && max > 0 )
				{
					var from:int = string.indexOf( "$" );
					var to:int = string.indexOf( " ", from );
					var name:String = string.substring( from, to == -1 ? string.length : to );
					string = string.split( name ).join( messages[1][name.split( "$" ).join( "" )] );
					max --
				}
			}
			else if( messages &&
				     messages[0] &&
					 messages[0].toString().indexOf( "{" ) != -1 && 
					 messages[0].toString().indexOf( "}" ) != -1 )
			{
				string += messages.shift();
				for( var i:int = 0; i < messages.length; i ++ )
					string = string.split( "{" + i + "}" ).join( messages[i] );
			}
			else
			{
				for( var j:uint = 0; j < messages.length; j ++ )
					if( messages[j] is String )
						string += messages[j] + " ";
					else if( messages[j] == null )
						string += 'null ';
					else if( messages[j] is Number || messages[j] is Boolean )
						string += messages[j].toString() + " ";
					else if( messages[j] is XML || messages[j] is XMLList )
						string += messages[j].toXMLString() + " ";
					else
						string += messages[j].toString() + " ";
			}	
			
			if( ExternalInterface.available )
				ExternalInterface.call( "console.log", string );
			trace( string );
		}
			
		if( rest && rest.length )
			closure.apply( null, rest );
		
		return closure
	}
}