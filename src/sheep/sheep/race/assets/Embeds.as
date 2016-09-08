/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.assets
{
	public class Embeds
	{
		/* IMAGES */
		[Embed(source="/../assets/displays/button_up.png")]
		public static const ButtonUp:Class;

		/* ATLAS */
		[Embed(source="/../assets/atlas/sheep_spritesheet.png")]
		public static const SheepSheepImageAtlas:Class;

		[Embed(source="/../assets/atlas/sheep_spritesheet.xml", mimeType="application/octet-stream")]
		public static const SheepSheepXMLAtlas:Class;

		/* FONT */
		[Embed(source="/../assets/fonts/setzer_pixel_font.fnt", mimeType="application/octet-stream")]
		public static const SetzerPixelFontXml:Class;

		[Embed(source = "/../assets/fonts/setzer_pixel_font_black.png")]
		public static const SetzerPixelFontTexture:Class;

	}
}
