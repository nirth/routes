
package eu.kiichigo.utils
{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public function getClass( value:Object ):Class
	{
		return getDefinitionByName( getQualifiedClassName( value ) ) as Class;
	}
}