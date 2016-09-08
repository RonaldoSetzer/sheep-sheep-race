/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import flash.utils.Dictionary;

	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.models.SheepIds;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;

	public class GameView extends Sprite
	{
		private var _sheeps:Dictionary;
		public var sheeps:Vector.<MovieClip>;
		private var _betButton:Button;

		public function GameView()
		{
			addChild( StarlingFactory.getBackground() );
			addChild( StarlingFactory.getImage( "background_game" ) );

			_sheeps = new Dictionary();
			sheeps = new Vector.<MovieClip>();

			var sheep:MovieClip;
			var ids:Array = [
				SheepIds.SHEEP_01, SheepIds.SHEEP_02, SheepIds.SHEEP_03, SheepIds.SHEEP_04
			];

			var raceContent:Sprite = StarlingFactory.getSprite();
			raceContent.x = 30;
			raceContent.y = 200;
			addChild( raceContent );

			var raceStart:Quad = StarlingFactory.getQuad( 5, 180, 0xFFFFFF );
			raceStart.x = 55;
			raceStart.y = 20;
			raceStart.alpha = .4;
			raceContent.addChild( raceStart );

			var raceEnd:Quad = StarlingFactory.getQuad( 20, 180, 0xFFFFFF );
			raceEnd.x = 520;
			raceEnd.y = 20
			raceEnd.alpha = .4;
			raceContent.addChild( raceEnd );

			for ( var i:int = 0; i < 4; i++ )
			{
				sheep = StarlingFactory.getMovieClip( ids[i] );
				sheep.y = (i * 45);
				raceContent.addChild( sheep );

				_sheeps[ids[i]] = sheep;
				sheeps.push( sheep );
			}

			_betButton = StarlingFactory.getButton( "BET" );
			_betButton.alignPivot();
			_betButton.x = ViewPort.HALF_WIDTH;
			_betButton.y = ViewPort.MAX_HEIGHT * .9;
			addChild( _betButton )
		}

		public function getSheepById( id:String ):MovieClip
		{
			return _sheeps[id];
		}

		public function get betButton():Button
		{
			return _betButton;
		}

		public function move( sheepId:String, sheepSteps:int ):void
		{
			_sheeps[sheepId].x = _sheeps[sheepId].x + (sheepSteps * 30);
		}
	}
}
