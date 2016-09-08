/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.events.IEventDispatcher;
	import flash.utils.setTimeout;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.RaceEvent;
	import sheep.sheep.race.views.StartingPopup;

	public class StartingPopupMediator extends StarlingMediator
	{
		[Inject]
		public var dispatcher:IEventDispatcher;

		override public function initialize():void
		{
			setTimeout( handlerTimerOut, 1000 );
		}

		private function handlerTimerOut():void
		{
			dispatcher.dispatchEvent( new RaceEvent( RaceEvent.START ) );
			StartingPopup( viewComponent ).destroy();
		}
	}
}
