package eu.kiichigo.route.actions
{
	public dynamic class Apply extends Properties
	{
		/**
		 * @inheritDoc
		 */
		override protected function process(from:Object, fromField:Object,
											to:Object, toField:Object):void
		{
			super.process(from, fromField, to, toField);
			to[toField] = fromField;
		}
	}
}