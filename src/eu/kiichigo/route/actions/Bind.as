package eu.kiichigo.route.actions
{
	import eu.kiichigo.route.utils.log;
	
	import mx.binding.utils.BindingUtils;

	public dynamic class Bind extends Properties
	{
		/**
		 * @private
		 * Logging
		 */
		protected static const log:Function = eu.kiichigo.route.utils.log( Bind );
		
		
		/**
		 * @inheritDoc
		 */
		override protected function process( from:Object, fromField:Object,
											 to:Object, toField:Object ):void
		{
			log( "Binding {0}.{1} to {2}.{3}", from, fromField, to, toField );
			BindingUtils.bindProperty( to, toField as String, from, fromField );
		}
	}
}