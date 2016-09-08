/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.RaceEvent;

	import sheep.sheep.race.managers.GameManager;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.views.GameView;

	import starling.display.MovieClip;
	import starling.events.Event;

	public class GameViewMediator extends StarlingMediator
	{
		[Inject]
		public var gameManager:GameManager;

		[Inject]
		public var gameModel:GameModel;

		public var gameView:GameView;

		override public function initialize():void
		{
			gameManager.start();

			gameView = GameView( viewComponent );

			eventMap.mapListener( gameView.startRace, Event.TRIGGERED, onStartRaceHandler );
			addContextListener( RaceEvent.END, onEndRaceHandler );
		}

		private function onStartRaceHandler( e:Event ):void
		{
			addViewListener( Event.ENTER_FRAME, onEnterFrameHandler );
		}

		private function onEnterFrameHandler( e:Event ):void
		{
			gameManager.updateRace();

			var sheep:MovieClip;
			var total:uint = gameModel.sheepModels.length;
			for( var i:int = 0; i < total; ++i )
			{
				sheep = gameView.getSheepById( gameModel.sheepModels[i].id );
				sheep.x = gameModel.sheepModels[i].distance;
			}
		}

		private function onEndRaceHandler( e:Event ):void
		{
			removeViewListener( Event.ENTER_FRAME, onEnterFrameHandler );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
