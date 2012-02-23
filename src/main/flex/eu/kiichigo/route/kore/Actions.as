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
	import eu.kiichigo.route.utils.add;
	import eu.kiichigo.utils.log;

	[DefaultProperty("list")]
	public class Actions extends Action implements IActions
	{
		protected static const log:Function = eu.kiichigo.utils.log(Actions);
		
		/**
		 * @private
		 */
		protected const _list:Vector.<IAction> = new Vector.<IAction>;
		
		/**
		 * @copy		eu.kiichigo.route.kore.IActions#list
		 */
		public function get list():Object
		{
			return _list;
		}
		/**
		 * @private
		 */
		public function set list(value:Object):void
		{
			eu.kiichigo.route.utils.add(_list, process)(value);
			commit();
			
			//log("set:list({0}):{1}", value, _list);
		}
		
		
		/**
		 * @copy		eu.kiichigo.route.kore.IActions#add
		 */
		public function add( action:IAction ):IAction
		{
			_list.fixed = false;
			_list.push( process( action ) );
			_list.fixed = true;
			commit();
			return action;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function exec( percept:Object ):void
		{
			for (var i:uint = 0; i < _list.length; i ++)
				_list[i].run(percept);
		}
		
		
		/**
		 * @private
		 * Initializes an action with an instance of <code>IRoute</code>. Accepts instances of <code>IAction</code> and <code>Function</code>.
		 */
		protected function process(action:Object):IAction
		{
			return (action is IAction ? action : new Closure( action as Function)) as IAction;
		}
		
		
		/**
		 * @inheritDoc
		 */
		override protected function commit():void
		{
			if( _route != null && _list.length > 0 )
				for( var i:uint = 0; i < _list.length; i ++ )
					_list[i].route = _route;
		}
		
		/**
		 * @private
		 */
		override public function toString():String
		{
			return "[Actions length=" + _list.length + " actions=" + _list + "]";
		}
	}
}


import eu.kiichigo.route.kore.Action;
import eu.kiichigo.utils.log;

/**
 * @private
 */
class Closure extends Action
{
	/**
	 * @private
	 */
	public function Closure( closure:Function )
	{
		this.closure = closure;
	}
	/**
	 * @private
	 */
	protected var closure:Function;
	/**
	 * @private
	 */
	override protected function exec( percept:Object ):void
	{
		if( closure.length == 0 )
			closure.call();
		else if( closure.length == 1 )
			closure.call( null, percept );
	}
}