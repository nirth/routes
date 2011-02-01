package eu.kiichigo.route.actions
{
	import mx.binding.utils.BindingUtils;

	public dynamic class Bind extends Properties
	{
		/**
		 * @inheritDoc
		 */
		override protected function process( from:Object, fromField:Object,
											 to:Object, toField:Object ):void
		{
			//BindingUtils.bindProperty( _to, property, _from, this[property] );
			BindingUtils.bindProperty( to, toField as String, from, fromField );
		}
	}
}