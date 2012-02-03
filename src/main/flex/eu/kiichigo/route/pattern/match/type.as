
package eu.kiichigo.route.pattern.match
{
	import mx.containers.Panel;

	public function type( pattern:Object, percept:Object, field:String = "type" ):Boolean
	{
		var type:Class = pattern.retreive( field ) as Class;
		
		return percept is type;
	}
}