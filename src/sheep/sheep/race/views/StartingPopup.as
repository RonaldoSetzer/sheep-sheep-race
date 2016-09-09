/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.utils.StarlingFactory;
	import sheep.sheep.race.info.TextInfo;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Quad;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class StartingPopup extends Sprite
	{
		private var _countingText:TextField;

		public function StartingPopup()
		{
			addChild( StarlingFactory.getShadowBackground() );

			var starting:TextField = StarlingFactory.getTextField( 150, TextInfo.STARTING );
			starting.alignPivot();
			starting.x = ViewPort.HALF_WIDTH;
			starting.y = ViewPort.MAX_HEIGHT*.4;
			addChild( starting );

			_countingText = StarlingFactory.getTextField( 150, "" );
			_countingText.alignPivot();
			_countingText.x = ViewPort.HALF_WIDTH;
			_countingText.y = ViewPort.MAX_HEIGHT*.5;
			addChild( _countingText );
		}

		public function updateCount( count:String ):void
		{
			_countingText.text = count;
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}
