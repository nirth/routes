
package eu.kiichigo.route.utils
{
	import eu.kiichigo.route.kore.IInstances;
	
	import flash.utils.getDefinitionByName;

	/**
	 * Evaluates instance from <code>object</code> as follows:
	 * 1) If instance is <code>Class</code> instance will be instanciated. Constructor should be able to run without any additional arguments.
	 * 2) If instance is <code>mx.core.IFactory</code>
	 */
	public function evaluate( object:Object, instances:IInstances = null ):Object
	{
		var instance:Function = instances == null ?
									function( generator:Class ):Object
									{
										return new generator();
									} :
									instances.retreive;
		if( object is Class )
			object = instance( object as Class );
		
		
		var routeFactory:Class = getDefinitionByName( "eu.kiichigo.route.utils.IFactory" ) as Class;
		var flexFactory:Class = getDefinitionByName( "mx.core.IFactory" ) as Class;
		
		
		if( routeFactory != null && object is routeFactory )
			object = object.create();
		else if( flexFactory != null && object is flexFactory )
			object = object.newInstance();
		
		return object;
	}
}