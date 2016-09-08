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
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;

	public class GameView extends Sprite
	{
		private var _sheeps:Dictionary;
		public var sheeps:Vector.<MovieClip>;
		private var _startRace:Button;

		public function GameView()
		{
			addChild( StarlingFactory.getBackground() );
			addChild( StarlingFactory.getTitle( "GAME" ) );

			_sheeps = new Dictionary();
			sheeps = new Vector.<MovieClip>();

			var sheep:MovieClip;
			var ids:Array = [
				SheepIds.SHEEP_01, SheepIds.SHEEP_02, SheepIds.SHEEP_03, SheepIds.SHEEP_04
			];

			for ( var i:int = 0; i < 4; i++ )
			{
				sheep = StarlingFactory.getMovieClip( ids[i] );
				sheep.x = 20;
				sheep.y = 200 + (i * 45);
				addChild( sheep );

				_sheeps[ids[i]] = sheep;
				sheeps.push(sheep);
			}

			_startRace = StarlingFactory.getButton( "NEXT" );
			_startRace.alignPivot();
			_startRace.x = ViewPort.HALF_WIDTH;
			_startRace.y = ViewPort.MAX_HEIGHT * .9;
			addChild( _startRace )
		}

		public function getSheepById( id:String ):MovieClip
		{
			return _sheeps[id];
		}

		public function get startRace():Button
		{
			return _startRace;
		}

		public function move( sheepId:String, sheepSteps:int ):void
		{
			_sheeps[sheepId].x = _sheeps[sheepId].x + (sheepSteps*30);
		}
	}
}
