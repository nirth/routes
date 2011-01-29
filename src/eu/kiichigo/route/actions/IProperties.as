package eu.kiichigo.route.actions
{
	import eu.kiichigo.route.utils.IHash;

	public interface IProperties
	{
		/**
		 * An instance of <code>IHash</code> that represents a collection of fields, in a format:
		 * <code>hash.store( "fromField", "toField" );</code>
		 * Where "fromField" is a field on a <code>IProperty.from</code> that can be accessed by <code>IProperty.from.fromField</code>.
		 * And "toField" is a field on <code>IProperty.to</code>, that can be accessed by <code>IProperty.to.toField</code>.
		 * 
		 * In following example, value of <code>myValueObject.image</code> will be applied to <code>myManager.currentImage</code>:
		 * <code>
		 * var properties:IProperties = new PropertiesImplementor();
		 *     properties.fields.store( "image", "currentImage" );
		 *     properties.from = myValueObject;
		 *     properties.to = myManager;
		 * </code>
		 */
		function get fields():IHash;
		
		
		/**
		 * This object will be used as source for data, that will be applied to <code>IProperties.to</code>.
		 */
		function get from():Object;
		/**
		 * @private
		 */
		function set from( value:Object ):void;
		
		
		/**
		 * Target object, which will receive data from <code>IProperties.from</code>.
		 */
		function get to():Object;
		/**
		 * @private
		 */
		function set to( value:Object ):void;
		
	}
}