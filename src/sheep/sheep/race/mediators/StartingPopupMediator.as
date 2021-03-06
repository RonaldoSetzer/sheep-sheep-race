/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.services.GameService;
	import sheep.sheep.race.views.StartingPopup;

	public class StartingPopupMediator extends StarlingMediator
	{
		[Inject]
		public var gameService:GameService;

		private var _timer:Timer;

		override public function initialize():void
		{
			_timer = new Timer( 600, 4 );
			_timer.addEventListener( TimerEvent.TIMER, onTimerEventHandler );
			_timer.addEventListener( TimerEvent.TIMER_COMPLETE, onTimerCompleteHandler );
			_timer.start();
		}

		private function onTimerEventHandler( e:TimerEvent ):void
		{
			var valor:String = String(4 - _timer.currentCount) || "";
			StartingPopup( viewComponent ).updateCount( valor );
		}

		private function onTimerCompleteHandler( e:TimerEvent ):void
		{
			gameService.start();
			StartingPopup( viewComponent ).destroy();
		}

		override public function destroy():void
		{
			_timer.removeEventListener( TimerEvent.TIMER, onTimerEventHandler );
			_timer.removeEventListener( TimerEvent.TIMER_COMPLETE, onTimerCompleteHandler );
		}
	}
}
