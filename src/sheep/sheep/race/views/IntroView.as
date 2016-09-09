/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;

	import sheep.sheep.race.utils.StarlingFactory;
	import sheep.sheep.race.info.TextInfo;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class IntroView extends Sprite
	{
		private var _txt:TextField;

		public function IntroView()
		{
			addChild( StarlingFactory.getBackground() );

			_txt = StarlingFactory.getTextField( 400, TextInfo.DEVELOPER );
			_txt.alignPivot();
			_txt.alpha = 0;
			ViewPort.alignCenter( _txt );
			addChild( _txt );
		}

		public function playAnimation():void
		{
			var timeline:TimelineLite = new TimelineLite();
			timeline.append( new TweenLite( _txt, .8, { scaleX:1.2, scaleY:1.2, alpha:1} ) );
			timeline.append( new TweenLite( _txt, 1.2, { scaleX:1.2, scaleY:1.2, alpha:1} ) );
			timeline.append( new TweenLite( _txt, .3, { scaleX:1, scaleY:1, alpha:0} ) );
		}
	}
}
