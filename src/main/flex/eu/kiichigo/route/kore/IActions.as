package eu.kiichigo.route.kore
{
	public interface IActions extends IAction
	{
		/**
		 * Collection (vector) of <code>IAction</code> instances that will be run once this <code>IActions</code> instance is executed.
		 */
		function get list():Object;
		/**
		 * 
		 */
		function set list(value:Object):void;
		
		
		/**
		 * 
		 * @param action
		 * @return 
		 * 
		 */
		function add(action:IAction):IAction;
	}
}