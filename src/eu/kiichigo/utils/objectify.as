
package eu.kiichigo.utils
{
	import flash.utils.getQualifiedClassName;

	public function objectify( instance:Object, properties:Object ):Object
	{
		var result:Object = {};
		
		if( properties is Array || getQualifiedClassName( properties ).toUpperCase().indexOf( "VECTOR" ) >= 0 )
			for( var i:uint = 0; i < properties.length; i ++ )
				result[properties[i]] = instance[properties[i]];
		else
			for( var property:String in properties )
				result[property] = instance[property];
		
		return result;
	}
}