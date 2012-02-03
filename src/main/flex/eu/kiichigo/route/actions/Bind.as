package eu.kiichigo.route.actions
{
	import eu.kiichigo.utils.log;
	
	import mx.binding.utils.BindingUtils;

	public dynamic class Bind extends Properties
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.utils.log( Bind );
		
		
		/**
		 * @inheritDoc
		 */
		override protected function process( from:Object, fromField:Object,
											 to:Object, toField:Object ):void
		{
			BindingUtils.bindProperty( to, toField as String, from, fromField );
		}
	}
}