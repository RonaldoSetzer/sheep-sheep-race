/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.FlowEvent;

	import sheep.sheep.race.views.HomeView;

	import starling.events.Event;

	public class HomeViewMediator extends StarlingMediator
	{
		override public function initialize():void
		{
			eventMap.mapListener( HomeView(viewComponent ).startButton, Event.TRIGGERED, onStartHandler )
		}

		private function onStartHandler( e:Event ):void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_GAME_VIEW ) );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
