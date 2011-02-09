package eu.kiichigo.route.interfaces.flow
{
	import eu.kiichigo.route.kore.IRouter;

	public interface IRouter extends eu.kiichigo.route.kore.IRouter
	{
		function settings( properties:Object ):eu.kiichigo.route.interfaces.flow.IRouter;
		
		function route( route:Object, properties:Object ):eu.kiichigo.route.interfaces.flow.IRouter;
		
		function action( action:Object, properties:Object ):eu.kiichigo.route.interfaces.flow.IRouter;
		
		function end():eu.kiichigo.route.interfaces.flow.IRouter;
	}
}