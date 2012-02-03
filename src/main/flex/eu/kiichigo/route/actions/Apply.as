package eu.kiichigo.route.actions
{
	public dynamic class Apply extends Properties
	{
		/**
		 * @inheritDoc
		 */
		override protected function process( from:Object, fromField:Object,
											 to:Object, toField:Object ):void
		{
			to[toField] = fromField;
		}
	}
}