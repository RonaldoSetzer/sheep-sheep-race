/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.managers
{
	import flash.events.IEventDispatcher;

	import sheep.sheep.race.info.TextInfo;

	import sheep.sheep.race.events.GameEvent;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.models.SheepModel;
	import sheep.sheep.race.services.GameService;

	public class GameManager
	{
		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var gameService:GameService;

		public function start():void
		{
			gameModel.clear();
		}

		public function updateRace():void
		{
			var speeds:Array = [1, 2, 3, 4];
			var speed:int;
			var total:uint = gameModel.sheepModels.length;
			var sheepModel:SheepModel;

			for ( var i:int = 0; i < total; ++i )
			{
				speed = speeds[Math.floor( Math.random() * speeds.length )];
				sheepModel = gameModel.sheepModels[i];
				sheepModel.increaseDistance( speed );
				if ( sheepModel.distance >= 520 )
				{
					gameModel.addRacePosition( sheepModel );
				}
				if ( gameModel.isTheRaceFinished() )
				{
					validateBetResults();
					gameService.finish();
					return;
				}
			}
		}

		private function validateBetResults():void
		{
			if (gameModel.yourBetToFirstPosition == gameModel.racePositions[0].id)
			{
				gameModel.yourBetResult.push(TextInfo.YOU_WIN);
			}else{
				gameModel.yourBetResult.push(TextInfo.YOU_LOSE);
			}
			if (gameModel.yourBetToLastPosition == gameModel.racePositions[3].id)
			{
				gameModel.yourBetResult.push(TextInfo.YOU_WIN);
			}else{
				gameModel.yourBetResult.push(TextInfo.YOU_LOSE);
			}
		}
	}
}
