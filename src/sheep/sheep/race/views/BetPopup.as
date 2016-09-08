/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.utils.ViewPort;
	import sheep.sheep.race.views.components.SheepSelector;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class BetPopup extends Sprite
	{
		public function BetPopup()
		{
			addChild( StarlingFactory.getShadowBackground() );

			var background:Quad = StarlingFactory.getBackground();
			background.width = ViewPort.HALF_WIDTH;
			background.height = ViewPort.HALF_HEIGHT;
			background.alignPivot();
			ViewPort.alignCenter( background );
			addChild( background );

			var textWinner:TextField = StarlingFactory.getTextField( 100, "WINNER" );
			textWinner.x = 200;
			textWinner.y = 180;
			addChild( textWinner );

			var textLoser:TextField = StarlingFactory.getTextField( 100, "LOSER" );
			textLoser.x = 350;
			textLoser.y = 180;
			addChild( textLoser );

			_sheepSelectorWinner = new SheepSelector();
			_sheepSelectorWinner.x = 170;
			_sheepSelectorWinner.y = 220;
			addChild( _sheepSelectorWinner );

			_sheepSelectorLoser = new SheepSelector();
			_sheepSelectorLoser.x = 320;
			_sheepSelectorLoser.y = 220;
			addChild( _sheepSelectorLoser );


			_startButton = StarlingFactory.getButton( "STARTs" );
			_startButton.alignPivot();
			_startButton.x = ViewPort.HALF_WIDTH;
			_startButton.y = ViewPort.MAX_HEIGHT * .76;
			addChild( _startButton )
		}

		private var _startButton:Button;

		public function get startButton():Button
		{
			return _startButton;
		}

		private var _sheepSelectorLoser:SheepSelector;

		public function get sheepSelectorLoser():SheepSelector
		{
			return _sheepSelectorLoser;
		}

		private var _sheepSelectorWinner:SheepSelector;

		public function get sheepSelectorWinner():SheepSelector
		{
			return _sheepSelectorWinner;
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}