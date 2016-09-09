/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.RaceEvent;
	import sheep.sheep.race.views.StartingPopup;

	public class StartingPopupMediator extends StarlingMediator
	{
		[Inject]
		public var dispatcher:IEventDispatcher;
		private var _timer:Timer;
		private var _count:int;

		override public function initialize():void
		{
			_count = 3;
			_timer = new Timer( 600, 4 );
			_timer.addEventListener( TimerEvent.TIMER, onTimerEventHandler );
			_timer.addEventListener( TimerEvent.TIMER_COMPLETE, onTimerCompleteHandler );
			_timer.start();
		}

		private function onTimerEventHandler( e:TimerEvent ):void
		{
			var valor:String = (_count > 0) ? String( _count ) : "";
			StartingPopup( viewComponent ).updateCount( valor );
			_count = _count - 1;
		}

		private function onTimerCompleteHandler( e:TimerEvent ):void
		{
			dispatcher.dispatchEvent( new RaceEvent( RaceEvent.START ) );
			StartingPopup( viewComponent ).destroy();
		}

		override public function destroy():void
		{
			_timer.removeEventListener( TimerEvent.TIMER, onTimerEventHandler );
			_timer.removeEventListener( TimerEvent.TIMER_COMPLETE, onTimerCompleteHandler );
		}
	}
}
