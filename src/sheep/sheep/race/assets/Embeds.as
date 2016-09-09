/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.assets
{
	public class Embeds
	{
		/* ATLAS */
		[Embed(source="/../assets/atlas/sheep_spritesheet-0.png")]
		public static const SheepSheepImageAtlas:Class;

		[Embed(source="/../assets/atlas/sheep_spritesheet.xml", mimeType="application/octet-stream")]
		public static const SheepSheepXMLAtlas:Class;

		/* FONT */
		[Embed(source="/../assets/fonts/setzer_pixel_font.fnt", mimeType="application/octet-stream")]
		public static const SetzerPixelFontXml:Class;

		[Embed(source = "/../assets/fonts/setzer_pixel_font_black.png")]
		public static const SetzerPixelFontTexture:Class;

		/* SOUNDS */
		[Embed(source="/../assets/sounds/sfx_you_win.mp3")]
		public static var SfxYouWin:Class;

		[Embed(source="/../assets/sounds/sfx_you_lose.mp3")]
		public static var SfxYouLose:Class;

		[Embed(source="/../assets/sounds/music_overworld.mp3")]
		public static var MusicOverWorld:Class;

	}
}
