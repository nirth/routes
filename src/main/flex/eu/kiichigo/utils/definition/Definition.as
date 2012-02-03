/*
The MIT License

Copyright (c) 2008 David Sergey, nirth@fouramgames.com, nirth.furzahad@gmail.com

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
	import flash.utils.getDefinitionByName;
	
	public class Definition
	{
		public function Definition( name:String,
									base:Class,
									extendsClasses:Vector.<String>,
									implementsInterfaces:Vector.<String>,
									isDynamic:Boolean,
									isFinal:Boolean,
									isStatic:Boolean,
									variables:Vector.<Variable>,
									accessors:Vector.<Accessor>,
									methods:Vector.<Method>,
									metadata:Vector.<Metadata>)
		{
			super();
			
			_extendsClasses = extendsClasses;
			_implementsInterfaces = implementsInterfaces;
			
			_name = name;
			_base = base;
			
			_isDynamic = isDynamic;
			_isFinal = isFinal;
			_isStatic = isStatic;
			
			_accessors = accessors;
			_methods = methods;
			_variables = variables;
			
			_metadata = metadata;
			
			_members = new Vector.<Member>;
			_properties = new Vector.<IProperty>;
			
			for ( var v:int = 0; v < _variables.length; v ++ )
				_members.push( variables[v] ), _properties.push( _variables[v] );
			for ( var a:int = 0; a < _accessors.length; a ++ )
				_members.push( _accessors[a] ), _properties.push( _accessors[a] );
			for ( var m:int = 0; m < _methods.length; m ++ )
				_members.push( _methods[m] );
			
			_members.fixed = _properties.fixed = true;
			
			_type = getDefinitionByName( _name ) as Class;
		}
		
		protected var _members:Vector.<Member>;
		public function get members():Vector.<Member>
		{
			return _members;
		}
		
		protected var _properties:Vector.<IProperty>;
		public function get properties():Vector.<IProperty>
		{
			return _properties;
		}
		
		protected var _variables:Vector.<Variable>;
		public function get variables():Vector.<Variable>
		{
			return _variables;
		}
		
		protected var _accessors:Vector.<Accessor>;
		public function get accessors():Vector.<Accessor>
		{
			return _accessors
		}
		
		protected var _methods:Vector.<Method>;
		public function get methods():Vector.<Method>
		{
			return _methods;
		}
		
		protected var _metadata:Vector.<Metadata>;
		public function get metadata():Vector.<Metadata>
		{
			return _metadata;
		}
		
		protected var _extendsClasses:Vector.<String>;
		public function get extendsClasses():Vector.<String>
		{
			return _extendsClasses;
		}
		
		protected var _implementsInterfaces:Vector.<String>;
		public function get implementsInterfaces():Vector.<String>
		{
			return _implementsInterfaces;
		}
		
		protected var _type:Class;
		public function get type():Class
		{
			return _type;
		}
		
		protected var _name:String;
		public function get name():String
		{
			return _name;
		}
		
		protected var _base:Class
		public function get base():Class
		{
			return _base;
		}
		
		protected var _isDynamic:Boolean;
		public function get isDynamic():Boolean
		{
			return _isDynamic;
		}
		
		protected var _isFinal:Boolean;
		public function get isFinal():Boolean
		{
			return _isFinal;
		}
		
		protected var _isStatic:Boolean;
		public function get isStatic():Boolean
		{
			return _isStatic;
		}
		
		public function hasMember( name:String ):Boolean
		{
			for ( var i:int = 0; i < _members.length; i ++ )
				if( _members[i].name == name )
					return true;
			return false;
		}
		
		public function findMembersByMetadata( name:String ):Vector.<Member>
		{
			var result:Vector.<Member> = new Vector.<Member>;
			for ( var i:int = 0; i < _members.length; i ++ )
				if( _members[i].indexOfMetadata( name ) >= 0 )
					result.push( _members[i] );
			result.fixed = true;
			return result;
		}
		
		public function findPropertysByMetadata( name:String ):Vector.<IProperty>
		{
			var result:Vector.<IProperty> = new Vector.<IProperty>;
			for ( var i:int = 0; i < _properties.length; i ++ )
				if( _properties[i].indexOfMetadata( name ) >= 0 )
					result.push( _properties[i] );
			result.fixed = true;
			return result;
		}
		
		public function findAccessorsByMetadata( name:String ):Vector.<Accessor>
		{
			var result:Vector.<Accessor> = new Vector.<Accessor>;
			for ( var i:int = 0; i < _accessors.length; i ++ )
				if( _accessors[i].indexOfMetadata( name ) >= 0 )
					result.push( _accessors[i] );
			return result;
		}
		
		public function findVariablesByMetadata( name:String ):Vector.<Variable>
		{
			var result:Vector.<Variable> = new Vector.<Variable>;
			for ( var i:int = 0; i < _variables.length; i ++ )
				if( _variables[i].indexOfMetadata( name ) >= 0 )
					result.push( _variables[i] );
			result.fixed = true;
			return result;
		}
		
		public function findMethodsByMetadata( name:String ):Vector.<Method>
		{
			var result:Vector.<Method> = new Vector.<Method>;
			for ( var i:int = 0; i < _methods.length; i ++ )
				if( _methods[i].indexOfMetadata(  name ) >= 0 )
					result.push( _methods[i] );
			result.fixed = true;
			return result;
		}
	}
}