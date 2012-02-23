package eu.kiichigo.route.pattern.match
{
	public function type(pattern:Object, percept:Object, field:String = "type"):Boolean
	{
		var type:Class = pattern.retreive( field ) as Class;
		
		return percept is type;
	}
}