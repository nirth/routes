package eu.kiichigo.route.dsl.fluent
{
	import eu.kiichigo.route.kore.IRouter;

	public interface IRouter extends eu.kiichigo.route.kore.IRouter
	{
		function settings( properties:Object ):eu.kiichigo.route.dsl.fluent.IRouter;
		
		function route( route:Object, properties:Object = null ):eu.kiichigo.route.dsl.fluent.IRouter;
		
		function pattern( pattern:Object, properties:Object = null ):eu.kiichigo.route.dsl.fluent.IRouter;
		
		function run( action:Object, properties:Object = null ):eu.kiichigo.route.dsl.fluent.IRouter;
		
		function when( guard:Object ):eu.kiichigo.route.dsl.fluent.IRouter
		
		function get end():eu.kiichigo.route.dsl.fluent.IRouter;
	}
}