package eu.kiichigo.route.actions
{
	public dynamic class Copy extends Properties
	{
		/**
		 * @inheritDoc
		 */
		override protected function process( from:Object, fromField:Object,
											 to:Object, toField:Object ):void
		{
			to[toField] = from[fromField];
		}
	}
}