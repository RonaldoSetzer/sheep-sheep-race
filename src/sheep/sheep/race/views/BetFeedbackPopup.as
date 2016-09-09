/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.info.ColorInfo;
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.TextInfo;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class BetFeedbackPopup extends Sprite
	{
		private var _retryButton:Button;
		private var _homeButton:Button;

		public function BetFeedbackPopup()
		{
			addChild( StarlingFactory.getShadowBackground() );

			var background:Quad = StarlingFactory.getBackground( ColorInfo.BACKGROUND_POPUP_1, ColorInfo.BACKGROUND_POPUP_2 );
			background.width = ViewPort.MAX_WIDTH * .55;
			background.height = ViewPort.MAX_HEIGHT * .7;
			background.alignPivot();
			ViewPort.alignCenter( background );
			addChild( background );

			var titleBackground:Quad = StarlingFactory.getQuad(300,30,ColorInfo.BACKGROUND_POPUP_2);
			titleBackground.alignPivot();
			titleBackground.width = ViewPort.MAX_WIDTH * .50;
			titleBackground.x = ViewPort.HALF_WIDTH;
			titleBackground.y = 100;
			addChild(titleBackground);

			var title:TextField = StarlingFactory.getTitle( TextInfo.TITLE_FEEDBACK );
			title.y = 102;
			addChild( title );

			_retryButton = StarlingFactory.getButton( "RETRY" );
			_retryButton.alignPivot();
			_retryButton.x = ViewPort.HALF_WIDTH - 50;
			_retryButton.y = ViewPort.MAX_HEIGHT * .76;
			addChild( _retryButton );

			_homeButton = StarlingFactory.getButton( "HOME" );
			_homeButton.alignPivot();
			_homeButton.x = ViewPort.HALF_WIDTH + 50;
			_homeButton.y = ViewPort.MAX_HEIGHT * .76;
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

		public function createPodiumByModel( gameModel:GameModel ):void
		{

			var info:TextField = StarlingFactory.getTextField( 200, TextInfo.YOUR_BETS );
			info.alignPivot();
			info.x = ViewPort.HALF_WIDTH;
			info.y = 245;
			addChild( info );

			var firstPosition:TextField = StarlingFactory.getTextField( 250, "1 ST : " +  gameModel.yourBetResult[0] );
			firstPosition.alignPivot();
			firstPosition.x = ViewPort.HALF_WIDTH;
			firstPosition.y = 275;
			addChild( firstPosition );


			var lastPosition:TextField = StarlingFactory.getTextField( 250, "4 TH : " +  gameModel.yourBetResult[1] );
			lastPosition.alignPivot();
			lastPosition.x = ViewPort.HALF_WIDTH;
			lastPosition.y = 300;
			addChild( lastPosition );

			var sheep:SheepPodium;
			var total:uint = gameModel.racePositions.length;
			var fistIndex:uint = 0;
			var lastIndex:uint = gameModel.racePositions.length - 1;

			for ( var i:int = 0; i < total; ++i )
			{
				sheep = new SheepPodium( gameModel.racePositions[i].id, i );
				sheep.x = 215 + (i * 70);
				sheep.y = 160;
				addChild( sheep );

				if ( i == fistIndex )
				{
					( gameModel.yourBetResult[0]==TextInfo.YOU_WIN)?sheep.winner():sheep.looser();
				}
				if ( i == lastIndex )
				{
					( gameModel.yourBetResult[1]==TextInfo.YOU_WIN)?sheep.winner():sheep.looser();
				}
			}
		}
	}
}

import sheep.sheep.info.ColorInfo;
import sheep.sheep.race.StarlingFactory;
import sheep.sheep.race.TextInfo;

import starling.display.MovieClip;
import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;

class SheepPodium extends Sprite
{
	private var sheep:MovieClip;
	private var background:Quad;

	public function SheepPodium( id:String, index:int = 0 ):void
	{
		var backgroundBoder:Quad = StarlingFactory.getQuad( 68, 68, 0x000000 );
		backgroundBoder.alignPivot();
		addChild( backgroundBoder );

		background = StarlingFactory.getQuad( 64, 64, ColorInfo.YELLOW );
		background.alignPivot();
		addChild( background );

		sheep = StarlingFactory.getMovieClip( id );
		sheep.scaleX = -1;
		sheep.stop();
		sheep.alignPivot();
		addChild( sheep );
		alignPivot();

		var currentPositionText:TextField = StarlingFactory.getTextField( 100, TextInfo.POSITIONS[index] );
		currentPositionText.alignPivot();
		currentPositionText.y = 50;
		addChild( currentPositionText );
	}

	public function winner():void
	{
		sheep.play();
		background.color = ColorInfo.GREEN;
	}

	public function looser():void
	{
		background.color = ColorInfo.RED;
	}
}
