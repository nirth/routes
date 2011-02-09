package eu.kiichigo.route.interfaces.fluent
{
	import eu.kiichigo.route.kore.IRouter;

	public interface IRouter extends eu.kiichigo.route.kore.IRouter
	{
		function settings( properties:Object ):eu.kiichigo.route.interfaces.fluent.IRouter;
		
		function route( route:Object, properties:Object ):eu.kiichigo.route.interfaces.fluent.IRouter;
		
		function action( action:Object, properties:Object ):eu.kiichigo.route.interfaces.fluent.IRouter;
		
		function get end():eu.kiichigo.route.interfaces.fluent.IRouter;
	}
}