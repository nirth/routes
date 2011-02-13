package eu.kiichigo.utils
{
	/**
	 * Formats instance to string. 
	 */
	public function toString( instance:Object, ...properties:* ):String
	{
		var props:*;
		if( properties.length == 1 && !( properties[0] is String ) )
			props = properties[0];
		else
			props = properties;
		
		var string:String = '[' + getClassName( instance );
		for each ( var property:String in props )
			if( instance.hasOwnProperty( property ) )
				string += ' ' + property + '=' + instance[property];
		string += ']';
		return string;
	}
}