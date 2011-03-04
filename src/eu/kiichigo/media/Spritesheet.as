package eu.kiichigo.media
{
	import eu.kiichigo.utils.toString;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;

	/**
	 * Spritesheet instances are capable of cutting single sprites out of sheet provided to it via <code>Spritesheet.source</code> property. Each sprite should have same width and height.
	 * 
	 * @author David "nirth" Sergey
	 * 
	 * @langversion 3.0
	 * @playerversion Flash 10
	 * @playerversion AIR 2.5
	 * @productversion Flex 4.5
	 */
	public class Spritesheet
	{
		/**
		 * @private
		 */
		protected const _sprites:Vector.<BitmapData> = new Vector.<BitmapData>;
		
		
		/**
		 * Creates new instance of Spritesheet with given params.  
		 * @param source		Indicates spritesheed source value. Value can be <code>BitmapData</code>, <code>Bitmap</code>, <code>BitmapAsset</code> or <code>Class</code> that can be evaluated to any of those.
		 * @param width			Indicates width of a single sprite in a segment. If set to 0, width of <code>source</code> will be used.
		 * @param height		Indicates height of a single sprite in a segment. If set to 0, height of <code>source</code> will be used.
		 * 
		 */
		public function Spritesheet( source:Object = null, width:uint = uint.MAX_VALUE, height:uint = uint.MAX_VALUE )
		{
			super();
			
			this.source = source;
			this.width = width;
			this.height = height;
		}
		
		
		/**
		 * List of <code>BitmapData</code> instances (<code>Vector.<BitmapData</code>) that were cut out from <code>source</code>. source, width and height parameters should be set before sprites can be cutted out.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		public function get sprites():Vector.<BitmapData>
		{
			if( _sprites.length == 0 )
				add( update(_source,_width,_height) );
				
			return _sprites;
		}
		
		/**
		 * @private
		 */
		protected var _source:BitmapData;
		
		/**
		 * Source of spritesheed. Valid types are <code>BitmapData</code>, <code>Bitmap</code>, <code>BitmapAsset</code> or <code>Class</code> that can be evaluated to any of those.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		public function get source():Object
		{
			return _source;
		}
		/**
		 * @private
		 */
		public function set source( value:Object ):void
		{
			if( value == _source )
				return;
			
			if( value != null && value is Class )
				value = new value;
			
			if( value != null && value.hasOwnProperty( "bitmapData" ) )
				value = value.bitmapData;
			
			_source = value as BitmapData;
			
			while( _sprites.length )
				_sprites.shift();
		}
		
		
		/**
		 * @private
		 */
		protected var _width:uint = uint.MAX_VALUE;
		
		/**
		 * Indicates width of a single sprite in a segment. If set to 0, width of <code>source</code> will be used.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		public function get width():uint
		{
			return _width;
		}
		/**
		 * @private
		 */
		public function set width( value:uint ):void
		{
			if( value == _width )
				return;
			
			_width = value
		}
		
		
		/**
		 * @private
		 */
		protected var _height:uint = uint.MAX_VALUE;
		
		/**
		 * Indicates height of a single sprite in a segment. If set to 0, height of <code>source</code> will be used.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		public function get height():uint
		{
			return _height;
		}
		/**
		 * @private
		 */
		public function set height( value:uint ):void
		{
			if( value == _height )
				return;
			
			_height = value
		}
		
		
		/**
		 * Returns single sprite from sheet with provided instance.
		 * 
		 * @param	index		Index of sprite in list to be returned.
		 * 
		 * @returns				<code>BitmapData</code>. Sprite with provided index.
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		public function sprite( index:uint ):BitmapData
		{
			if( sprites.length - 1 < index )
				return null;
			return sprites[index];
		}
		
		
		/**
		 * 
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		protected function update( source:BitmapData, width:uint, height:uint ):Vector.<BitmapData>
		{
			if( source == null || width == uint.MAX_VALUE || height == uint.MAX_VALUE )
				return null;
			
			if( width == 0 )
				width = source.width;
			
			if( height == 0 )
				height = source.height;
			
			const sprites:Vector.<BitmapData> = new Vector.<BitmapData>;
			
			var ih:uint = Math.floor( source.width / width );		// Ammount of items horizontally.
			var iv:uint = Math.floor( source.height / height );		// Ammount of items vertically.
			
			for( var h:uint = 0; h < ih; h ++ )
				for( var v:uint = 0; v < iv; v ++ )
					sprites.push( cut( source, h * width, v * height, width, height ) );
			
			return sprites;
		}
		
		
		/**
		 * 
		 * 
		 * @langversion 3.0
		 * @playerversion Flash 10
		 * @playerversion AIR 2.5
		 * @productversion Flex 4.5
		 */
		protected function cut( source, x:uint, y:uint, width:uint, height:uint ):BitmapData
		{
			var bmpd:BitmapData = new BitmapData( width, height, true, 0x000000 );
				bmpd.copyPixels( source,
								 new Rectangle( x, y, width, height ), 
								 new Point( 0, 0 ) );
			return bmpd;
		}
		
		
		/**
		 * @private
		 */
		protected function clear():void
		{
			_sprites.fixed = false;
			while( _sprites.length )
				_sprites.shift();
		}
		
		
		/**
		 * @private
		 */
		protected function add( items:Vector.<BitmapData> ):void
		{
			_sprites.fixed = false;
			while( items.length )
				_sprites.push( items.shift() );
			_sprites.fixed = true;
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function toString():String
		{
			return eu.kiichigo.utils.toString( this, "source", "width", "height", "sprites" );
		}
		
	}
}