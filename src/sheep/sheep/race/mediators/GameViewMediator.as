/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.events.IEventDispatcher;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.FlowEvent;
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
		public var dispatcher:IEventDispatcher;

		[Inject]
		public var gameModel:GameModel;

		public var gameView:GameView;

		override public function initialize():void
		{
			gameManager.start();

			gameView = GameView( viewComponent );
			gameView.betButton.visible = true;

			eventMap.mapListener( gameView.betButton, Event.TRIGGERED, onBetHandler );
			dispatcher.addEventListener( RaceEvent.FINISH, onEndRaceHandler );
			dispatcher.addEventListener( RaceEvent.START, onStartRaceHandler );
			dispatcher.addEventListener( RaceEvent.UPDATE, onUpdateHandler );
		}

		private function onStartRaceHandler( e:RaceEvent ):void
		{
			addViewListener( Event.ENTER_FRAME, onEnterFrameHandler );
		}

		private function onBetHandler( e:Event ):void
		{
			gameView.betButton.visible = false;
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_BET_POPUP ) );
		}

		private function onEnterFrameHandler( e:Event ):void
		{
			update();
		}

		private function onUpdateHandler( e:RaceEvent ):void
		{
			update();
		}

		private function update():void
		{
			gameManager.updateRace();

			var sheep:MovieClip;
			var total:uint = gameModel.sheepModels.length;

			for ( var i:int = 0; i < total; ++i )
			{
				sheep = gameView.getSheepById( gameModel.sheepModels[i].id );
				sheep.x = gameModel.sheepModels[i].distance;
			}
		}

		private function onEndRaceHandler( e:RaceEvent ):void
		{
			removeViewListener( Event.ENTER_FRAME, onEnterFrameHandler );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
			dispatcher.removeEventListener( RaceEvent.FINISH, onEndRaceHandler );
			dispatcher.removeEventListener( RaceEvent.START, onStartRaceHandler );
			dispatcher.removeEventListener( RaceEvent.UPDATE, onUpdateHandler );
		}
	}
}
