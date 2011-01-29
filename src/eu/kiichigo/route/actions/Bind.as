package eu.kiichigo.route.actions
{
	import mx.binding.utils.BindingUtils;

	public class Bind extends Properties
	{
		override protected function process( from:Object, fromField:Object,
											 to:Object, toField:Object ):void
		{
			//BindingUtils.bindProperty( _to, property, _from, this[property] );
			BindingUtils.bindProperty( to, toField as String, from, fromField );
		}
	}
}