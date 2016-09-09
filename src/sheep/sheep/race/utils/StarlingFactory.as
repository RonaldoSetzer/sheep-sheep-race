/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.utils
{
	import sheep.sheep.race.info.TextInfo;
	import sheep.sheep.race.*;
	import sheep.sheep.race.info.AssetsInfo;
	import sheep.sheep.race.info.ColorInfo;
	import sheep.sheep.race.assets.Assets;
	import sheep.sheep.race.utils.ViewPort;

	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.textures.TextureSmoothing;

	public class StarlingFactory
	{
		public static function getTextField( width:int, text:String = "", size:int = TextInfo.SIZE_DEFAULT, rows:int = 1 ):TextField
		{
			return new TextField( width, (size + 2) * rows, text, AssetsInfo.FONT_FAMILY, size, 0xFFFFFF );
		}

		public static function getButton( text:String ):Button
		{
			var button:Button = new Button( Assets.getTexture( AssetsInfo.BUTTON_UP ), text );
			button.fontName = AssetsInfo.FONT_FAMILY;
			button.fontSize = TextInfo.SIZE_DEFAULT;
			button.fontColor = 0xFFFFFF;
			return  button;
		}

		public static function getButtonArrow( scaleX:int = 1 ):Button
		{
			var button:Button = new Button( Assets.getTexture( AssetsInfo.BUTTON_ARROW_UP ) );
			button.alignPivot();
			button.scaleX = scaleX;
			return  button;
		}

		public static function getImage( assetKey:String ):Image
		{
			var img:Image = new Image( Assets.getTexture( assetKey ) );
			img.smoothing = TextureSmoothing.NONE;
			return img;
		}

		public static function getShadowBackground():Quad
		{
			var shadow:Quad = new Quad( ViewPort.MAX_WIDTH, ViewPort.MAX_HEIGHT, 0x000000 );
			shadow.alpha = .7;
			return shadow;
		}

		public static function getFullQuad( color:int ):Quad
		{
			return new Quad( ViewPort.MAX_WIDTH, ViewPort.MAX_HEIGHT, color );
		}

		public static function getQuad( width:Number, height:Number, color:int ):Quad
		{
			return new Quad( width, height, color );
		}

		public static function getBackground( top:int = ColorInfo.BACKGROUND_SKY_1, down:int = ColorInfo.BACKGROUND_SKY_2 ):Quad
		{
			var background:Quad = StarlingFactory.getFullQuad( top );
			background.setVertexColor( 2, down );
			background.setVertexColor( 3, down );
			return  background
		}

		public static function getTitle( label:String ):TextField
		{
			var title:TextField = getTextField( 300, label );
			title.alignPivot();
			title.x = ViewPort.HALF_WIDTH;
			title.y = 30;
			title.hAlign = "center";
			return title;
		}

		public static function getMovieClip( assetKey:String ):MovieClip
		{
			var img:MovieClip = new MovieClip( Assets.getTextures( assetKey ) );
			img.smoothing = TextureSmoothing.NONE;
			Starling.juggler.add( img );

			img.play();
			return img;
		}

		public static function getSprite():Sprite
		{
			return new Sprite();
		}
	}
}
