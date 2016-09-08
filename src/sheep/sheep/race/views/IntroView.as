/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.TextInfo;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class IntroView extends Sprite
	{
		public function IntroView()
		{
			addChild( StarlingFactory.getBackground());

			var txt:TextField = StarlingFactory.getTextField( 400, TextInfo.DEVELOPER);
			txt.alignPivot();
			ViewPort.alignCenter(txt);
			addChild( txt);
		}
	}
}
