/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race
{
	import sheep.sheep.info.AssetsInfo;
	import sheep.sheep.race.assets.Assets;
	import sheep.sheep.race.assets.Embeds;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;

	public class StarlingFactory
	{
		public static function getTextField( width:int, text:String = "", size:int = TextInfo.SIZE_DEFAULT, rows:int = 1 ):TextField
		{
			return new TextField( width, (size + 2) * rows, text, AssetsInfo.FONT_FAMILY, size, 0xFFFFFF );
		}

		public static function getButton( text:String ):Button
		{
			var button:Button = new Button( Texture.fromBitmap( new Embeds.ButtonUp() ), text );
			button.fontName = AssetsInfo.FONT_FAMILY;
			button.fontSize = 16;
			button.fontColor = 0xFFFFFF;
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
		public static function getBackground():Quad
		{
			var top:int = 0x37c7dc;//0x004455;/*0x1b6c9f*/
			var down:int = 0x269eb7;
			/*0x21f1e9*/
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
	}
}
