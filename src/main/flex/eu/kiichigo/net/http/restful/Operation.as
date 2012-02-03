package eu.kiichigo.net.http.restful
{
	import eu.kiichigo.net.kore.IOperation;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	public class Operation extends EventDispatcher implements IOperation
	{
		protected const loader:URLLoader = new URLLoader;
		
		public function Operation()
		{
			super();
		}
		
		public function send(url:String, method:String = "get", parameters:Object = null):IOperation
		{
			return this;
		}
	}
}