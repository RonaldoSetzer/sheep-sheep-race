/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import com.greensock.TweenNano;

	import flash.utils.Dictionary;

	import sheep.sheep.race.info.AssetsInfo;
	import sheep.sheep.race.utils.StarlingFactory;
	import sheep.sheep.race.info.SheepIds;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;

	public class GameView extends Sprite
	{
		private var _sheeps:Dictionary;
		private var _betButton:Button;

		public function GameView()
		{
			addChild( StarlingFactory.getBackground() );
			addChild( StarlingFactory.getImage( "background_game" ) );

			_sheeps = new Dictionary();

			var raceContent:Sprite = StarlingFactory.getSprite();
			raceContent.x = 30;
			raceContent.y = 200;
			addChild( raceContent );

			var startMark:Quad = StarlingFactory.getImage( AssetsInfo.START_MARK );
			startMark.x = 55;
			startMark.y = 20;
			raceContent.addChild( startMark );

			var finishMark:Quad = StarlingFactory.getImage( AssetsInfo.FINISH_MARK );
			finishMark.x = 520;
			finishMark.y = 20
			raceContent.addChild( finishMark );

			var ids:Array = SheepIds.SHEEPS_IDS_ORDER;
			var sheep:MovieClip;

			for ( var i:int = 0; i < 4; i++ )
			{
				sheep = StarlingFactory.getMovieClip( ids[i] );
				sheep.y = (i * 45);
				sheep.alpha = 0;
				raceContent.addChild( sheep );

				_sheeps[ids[i]] = sheep;

				TweenNano.to( sheep, .3, { alpha:1, delay:i * .1 } );
			}

			_betButton = StarlingFactory.getButton( "BET" );
			_betButton.alignPivot();
			_betButton.x = ViewPort.HALF_WIDTH;
			_betButton.y = ViewPort.MAX_HEIGHT * .9 + ViewPort.HALF_HEIGHT;
			addChild( _betButton );
			TweenNano.to( _betButton, .2, { y:ViewPort.MAX_HEIGHT * .9, delay:i * .1 } );
		}

		public function getSheepById( id:String ):MovieClip
		{
			return _sheeps[id];
		}

		public function get betButton():Button
		{
			return _betButton;
		}
	}
}
