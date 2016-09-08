/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.MovieClip;

	import starling.display.Quad;
	import starling.display.Sprite;

	public class BetFeedbackPopup extends Sprite
	{
		private var _retryButton:Button;
		private var _homeButton:Button;
		private var _winner:MovieClip;
		private var _loser:MovieClip;

		public function BetFeedbackPopup()
		{
			addChild( StarlingFactory.getShadowBackground() );

			var background:Quad = StarlingFactory.getBackground();
			background.width = ViewPort.HALF_WIDTH;
			background.height = ViewPort.HALF_HEIGHT;
			background.alignPivot();
			ViewPort.alignCenter( background );
			addChild( background );

			_retryButton = StarlingFactory.getButton( "RETRY" );
			_retryButton.alignPivot();
			_retryButton.x = ViewPort.HALF_WIDTH-50;
			_retryButton.y = ViewPort.MAX_HEIGHT * .9;
			addChild( _retryButton );

			_homeButton = StarlingFactory.getButton( "HOME" );
			_homeButton.alignPivot();
			_homeButton.x = ViewPort.HALF_WIDTH+50;
			_homeButton.y = ViewPort.MAX_HEIGHT * .9;
			addChild( _homeButton );
		}
		public function get retryButton():Button
		{
			return _retryButton;
		}

		public function destroy():void
		{
			removeFromParent();
		}

		public function get homeButton():Button
		{
			return _homeButton;
		}

		public function setupRaceResults( bestEnd:String, isWinnerFirst:Boolean, worstEnd:String, isWinnerLast:Boolean ):void
		{
			_winner = StarlingFactory.getMovieClip(bestEnd);
			_winner.x = 220;
			_winner.y = 220;
			(isWinnerFirst)?_winner.play():_winner.stop();
			addChild(_winner);

			_loser = StarlingFactory.getMovieClip(worstEnd);
			_loser.x = 320;
			_loser.y = 220;
			(isWinnerLast)?_loser.play():_loser.stop();
			addChild(_loser);
		}
	}
}
