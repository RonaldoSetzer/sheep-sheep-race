/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.assets
{
	import flash.display.Bitmap;

	import starling.text.TextField;

	import starling.textures.Texture;
	import starling.text.BitmapFont;
	import starling.textures.TextureSmoothing;

	public class Assets
	{
		public static function init():void
		{
			var simpleSmallPixelBMP:Bitmap = new Embeds.SetzerPixelFontTexture();
			var texture:Texture = Texture.fromBitmap( simpleSmallPixelBMP );

			var setzerPixelFont:BitmapFont = new BitmapFont( texture, XML( new Embeds.SetzerPixelFontXml() ) );
			setzerPixelFont.smoothing = TextureSmoothing.NONE;

			TextField.registerBitmapFont( setzerPixelFont );
		}

		public static function getTexture( assetKey:String ):Texture
		{
			return new Texture();
		}
	}
}
