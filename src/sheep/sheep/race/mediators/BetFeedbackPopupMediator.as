/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.info.AssetsInfo;
	import sheep.sheep.race.TextInfo;
	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.events.RaceEvent;
	import sheep.sheep.race.managers.SoundManager;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.views.BetFeedbackPopup;

	import starling.events.Event;

	public class BetFeedbackPopupMediator extends StarlingMediator
	{
		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var dispatcher:IEventDispatcher;

		[Inject]
		public var soundManager:SoundManager;

		private var _view:BetFeedbackPopup;
		private var _timer:Timer;

		private var _dictionary:Dictionary;

		override public function initialize():void
		{
			_view = BetFeedbackPopup( viewComponent );

			_dictionary = new Dictionary();
			_dictionary[TextInfo.YOU_WIN] = AssetsInfo.SFX_YOU_WIN;
			_dictionary[TextInfo.YOU_LOSE] = AssetsInfo.SFX_YOU_LOSE;

			_view.createPodiumByModel( gameModel );
			eventMap.mapListener( _view.retryButton, Event.TRIGGERED, onRetryHandler );
			eventMap.mapListener( _view.homeButton, Event.TRIGGERED, onHomeHandler );

			_timer = new Timer( 100, 2 );
			_timer.addEventListener( TimerEvent.TIMER, onTimerHandler );
			_timer.start();
		}

		private function onTimerHandler( e:TimerEvent ):void
		{
			var soundAsset:String = _dictionary[gameModel.yourBetResult[_timer.currentCount - 1]];
			soundManager.playSfx( soundAsset );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}

		private function onHomeHandler( e:Event ):void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_HOME_VIEW ) );
		}

		private function onRetryHandler( e:Event ):void
		{
			_view.destroy();
			dispatcher.dispatchEvent( new RaceEvent( RaceEvent.RETRY ) );
		}
	}
}
