/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import com.greensock.TweenNano;

	import flash.events.IEventDispatcher;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.services.FlowService;
	import sheep.sheep.race.events.GameEvent;
	import sheep.sheep.race.managers.GameManager;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.utils.ViewPort;
	import sheep.sheep.race.views.GameView;

	import starling.display.MovieClip;
	import starling.events.Event;

	public class GameViewMediator extends StarlingMediator
	{
		[Inject]
		public var gameManager:GameManager;

		[Inject]
		public var flowService:FlowService;

		[Inject]
		public var dispatcher:IEventDispatcher;

		[Inject]
		public var gameModel:GameModel;

		private var _view:GameView;

		override public function initialize():void
		{
			gameManager.start();

			_view = GameView( viewComponent );

			eventMap.mapListener( _view.betButton, Event.TRIGGERED, onBetHandler );
			dispatcher.addEventListener( GameEvent.FINISH, onEndRaceHandler );
			dispatcher.addEventListener( GameEvent.START, onStartRaceHandler );
			dispatcher.addEventListener( GameEvent.UPDATE, onUpdateHandler );
		}

		private function onStartRaceHandler( e:GameEvent ):void
		{
			addViewListener( Event.ENTER_FRAME, onEnterFrameHandler );
		}

		private function onBetHandler( e:Event ):void
		{
			TweenNano.to( _view.betButton, .4, { y:ViewPort.MAX_HEIGHT * .9 + ViewPort.HALF_HEIGHT } );
			flowService.addBetPopup();
		}

		private function onEnterFrameHandler( e:Event ):void
		{
			update();
		}

		private function onUpdateHandler( e:GameEvent ):void
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
				sheep = _view.getSheepById( gameModel.sheepModels[i].id );
				sheep.x = gameModel.sheepModels[i].distance;
			}
		}

		private function onEndRaceHandler( e:GameEvent ):void
		{
			removeViewListener( Event.ENTER_FRAME, onEnterFrameHandler );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
			dispatcher.removeEventListener( GameEvent.FINISH, onEndRaceHandler );
			dispatcher.removeEventListener( GameEvent.START, onStartRaceHandler );
			dispatcher.removeEventListener( GameEvent.UPDATE, onUpdateHandler );
		}
	}
}
