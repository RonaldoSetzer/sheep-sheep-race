/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.info.ColorInfo;
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.TextInfo;
	import sheep.sheep.race.utils.ViewPort;
	import sheep.sheep.race.views.components.SheepSelector;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class BetPopup extends Sprite
	{
		private var _startButton:Button;
		private var _sheepSelectorLastPosition:SheepSelector;
		private var _sheepSelectorFirstPosition:SheepSelector;

		public function BetPopup()
		{
			addChild( StarlingFactory.getShadowBackground() );

			var background:Quad = StarlingFactory.getBackground( ColorInfo.BACKGROUND_POPUP_1, ColorInfo.BACKGROUND_POPUP_2 );
			background.width = ViewPort.HALF_WIDTH;
			background.height = ViewPort.MAX_HEIGHT * .7;
			background.alignPivot();
			ViewPort.alignCenter( background );
			addChild( background );

			var title:TextField = StarlingFactory.getTitle( TextInfo.TITLE_BET );
			title.y = 100;
			addChild( title );

			var firstPositionText:TextField = StarlingFactory.getTextField( 140, TextInfo.FIRST_POSITION, TextInfo.SIZE_DEFAULT, 2 );
			firstPositionText.alignPivot();
			firstPositionText.x = ViewPort.HALF_WIDTH - 80;
			firstPositionText.y = 170;
			addChild( firstPositionText );

			var lastPositionText:TextField = StarlingFactory.getTextField( 140, TextInfo.LAST_POSITION, TextInfo.SIZE_DEFAULT, 2 );
			lastPositionText.alignPivot();
			lastPositionText.x = ViewPort.HALF_WIDTH + 80;
			lastPositionText.y = 170;
			addChild( lastPositionText );

			_sheepSelectorFirstPosition = new SheepSelector();
			_sheepSelectorFirstPosition.x = ViewPort.HALF_WIDTH - 80;
			_sheepSelectorFirstPosition.y = 250;
			addChild( _sheepSelectorFirstPosition );

			_sheepSelectorLastPosition = new SheepSelector();
			_sheepSelectorLastPosition.x = ViewPort.HALF_WIDTH + 80;
			_sheepSelectorLastPosition.y = 250;
			_sheepSelectorLastPosition.back();
			addChild( _sheepSelectorLastPosition );

			_startButton = StarlingFactory.getButton( "START" );
			_startButton.alignPivot();
			_startButton.x = ViewPort.HALF_WIDTH;
			_startButton.y = ViewPort.MAX_HEIGHT * .76;
			addChild( _startButton )
		}


		public function get startButton():Button
		{
			return _startButton;
		}

		public function get sheepSelectorLastPosition():SheepSelector
		{
			return _sheepSelectorLastPosition;
		}

		public function get sheepSelectorFirstPosition():SheepSelector
		{
			return _sheepSelectorFirstPosition;
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}