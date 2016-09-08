/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.managers
{
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.models.SheepModel;

	import starling.events.EventDispatcher;

	public class GameManager
	{
		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var eventDispatcher:EventDispatcher;

		public function start():void
		{
			gameModel.clear();
		}

		public function updateRace():void
		{
			var speeds:Array = [1,2,3,4];
			var speed:int;
			var total:uint = gameModel.sheepModels.length;

			for( var i:int = 0; i < total; ++i)
			{
				speed = speeds[Math.floor(Math.random()*speeds.length)];
				gameModel.sheepModels[i].increaseDistance(speed);
			}
		}
	}
}
