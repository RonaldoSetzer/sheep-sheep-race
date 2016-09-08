/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.assets
{
	import flash.display.Bitmap;

	import starling.text.TextField;

	import starling.textures.Texture;
	import starling.text.BitmapFont;
	import starling.textures.TextureAtlas;
	import starling.textures.TextureSmoothing;

	public class Assets
	{
		private static var sheepSheepTextureAtlas:TextureAtlas;

		public static function init():void
		{

			var sheepSheepTexture:Texture = Texture.fromBitmap( new Embeds.SheepSheepImageAtlas() );
			var sheepSheepTextureXML:XML = XML( new Embeds.SheepSheepXMLAtlas() );
			sheepSheepTextureAtlas = new TextureAtlas( sheepSheepTexture, sheepSheepTextureXML );


			var simpleSmallPixelBMP:Bitmap = new Embeds.SetzerPixelFontTexture();
			var texture:Texture = Texture.fromBitmap( simpleSmallPixelBMP );

			var setzerPixelFont:BitmapFont = new BitmapFont( texture, XML( new Embeds.SetzerPixelFontXml() ) );
			setzerPixelFont.smoothing = TextureSmoothing.NONE;

			TextField.registerBitmapFont( setzerPixelFont );
		}

		public static function getTexture( preFix:String ):Texture
		{
			return sheepSheepTextureAtlas.getTexture( preFix );
		}

		public static function getTextures( preFix:String ):Vector.<Texture>
		{
			return sheepSheepTextureAtlas.getTextures( preFix );
		}
	}
}
