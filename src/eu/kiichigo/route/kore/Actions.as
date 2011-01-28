package eu.kiichigo.route.kore
{
	import eu.kiichigo.route.utils.add;

	public class Actions extends Action implements IActions
	{
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
		public function set list( value:Object ):void
		{
			eu.kiichigo.route.utils.add( _list, process )( value );
			commit();
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function exec( percept:Object ):void
		{
			for( var i:uint = 0; i < _list.length; i ++ )
				_list[i].run( percept );
		}
		
		/**
		 * @private
		 * Initializes an action with an instance of <code>IRoute</code>. Accepts instances of <code>IAction</code> and <code>Function</code>.
		 */
		protected function process( action:Object ):IAction
		{
			return ( action is IAction ? action : new Closure( action as Function ) ) as IAction;
		}
		
		/**
		 * @inheritDoc
		 */
		override protected function commit():void
		{
		//	if( _route != null && _list.length > 0 )
		//		_list.
		}
	}
}


import eu.kiichigo.route.kore.Action;
import eu.kiichigo.route.utils.log;

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