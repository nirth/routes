/*
The MIT License

Copyright (c) 2010 David Sergey, nirth@fouramgames.com, nirth.furzahad@gmail.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

package eu.kiichigo.utils.definition
{
	import eu.kiichigo.utils.getClass;
	
	import flash.utils.describeType;

	public function getDefinition(value:Object):Definition
	{	
		if(!cache)
			cache = new Vector.<Definition>;
		for (var i:int = 0; i < cache.length; i ++)
			if(cache[i].type === getClass( value))
				return cache[i];
		
		cache.fixed = false;
		
		var xml:XML = describeType(value);
		//Extend Classes
		var extendsClasses:Vector.<String> = new Vector.<String>;
		for each (var extendsClassNode:XML in xml.extendsClass)
			extendsClasses.push(extendsClassNode.@type.toString());
		extendsClasses.fixed = true;
		//Impelemts Interfaces
		var implementsInterfaces:Vector.<String> = new Vector.<String>;
		for each (var implementsInterfaceNode:XML in xml.implementsInterface)
			implementsInterfaces.push(implementsInterfaceNode.@type.toString());
		implementsInterfaces.fixed = true;
		//Variables
		var variables:Vector.<Variable> = new Vector.<Variable>;
		for each (var variableNode:XML in xml.variable)
			variables.push( $variable( variableNode));
		variables.fixed = true;
		//Accessors
		var accessors:Vector.<Accessor> = new Vector.<Accessor>;
		for each (var accessorNode:XML in xml.accessor)
			accessors.push( $accessor(accessorNode));
		accessors.fixed = true;
		//Methods
		var methods:Vector.<Method> = new Vector.<Method>;
		for each (var methodNode:XML in xml.method)
			methods.push($method( methodNode));
		methods.fixed = true;
		
		var definition:Definition = new Definition (xml.@name.toString(),
													$clazz(xml.@base),
													extendsClasses,
													implementsInterfaces,
													$boolean(xml.@isDynamic),
													$boolean(xml.@isFinal),
													$boolean(xml.@isStatic),
													variables,
													accessors,
													methods,
													$metadata( xml.metadata));
		
		cache.push(definition);
		cache.fixed = true;
		
		return definition;
	}
}
	import eu.kiichigo.utils.definition.Accessor;
	import eu.kiichigo.utils.definition.Arg;
	import eu.kiichigo.utils.definition.Definition;
	import eu.kiichigo.utils.definition.Metadata;
	import eu.kiichigo.utils.definition.Method;
	import eu.kiichigo.utils.definition.Parameter;
	import eu.kiichigo.utils.definition.Variable;
	
	import flash.utils.getDefinitionByName;
	
var cache:Vector.<Definition>;

function $variable(xml:XML):Variable
{
	return new Variable(xml.@name.toString(),
						$clazz(xml.@type),
						$metadata(xml.metadata));
}
		
function $accessor( xml:XML ):Accessor
{
	return new Accessor(xml.@name.toString(),
						$clazz(xml.@type),
						$clazz(xml.@declaredBy),
						xml.@access.toString(),
						$metadata(xml.metadata));
}

function $method(xml:XML):Method
{
	return new Method(xml.@name.toString(),
					  $clazz(xml.@declaredBy),
					  $clazz(xml.@returnType),
					  $parameters(xml.parameter),
					  $metadata(xml.metadata));
}
		
function $parameters(xmlList:XMLList):Vector.<Parameter>
{
	var parameters:Vector.<Parameter> = new Vector.<Parameter>;
	for each (var parameterNode:XML in xmlList)
		parameters.push(new Parameter($integer(parameterNode.@index),
									  $clazz(parameterNode.@type),
									  $boolean(parameterNode.@optional)));
	parameters.fixed = true;
	return parameters;
}
		
function $metadata(xmlList:XMLList):Vector.<Metadata>
{
	var metadata:Vector.<Metadata> = new Vector.<Metadata>;
	for each (var metadataNode:XML in xmlList)
				metadata.push(new Metadata(metadataNode.@name.toString(),
										   $args( metadataNode.arg)));
	metadata.fixed = true;
	return metadata;
}
		
function $args(xmlList:XMLList):Vector.<Arg>
{
	var args:Vector.<Arg> = new Vector.<Arg>;
	for each (var argNode:XML in xmlList)
		args.push(new Arg(argNode.@key.toString(), argNode.@value.toString()));
	args.fixed = true;
	return args;
}
		
function $clazz(value:*):Class
{
	value = value.toString();
	if(value == 'void')
		return null;
	else if(value == '*')
		return Object;
	return getDefinitionByName(value) as Class;
}
		
function $boolean(value:*):Boolean
{
	if(!(value is String))
		value = value.toString();

	return value == 'true' ? true : false;
}
		
function $integer(value:*):int
{
	if(!(value is String))
		value = value.toString();
				
	return parseInt(value);
}