/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.utils.setTimeout;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.FlowEvent;

	public class IntroViewMediator extends StarlingMediator
	{
		override public function initialize():void
		{
			setTimeout( handlerTimerOut, 3000 );
		}

		private function handlerTimerOut():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_HOME_VIEW ) );
		}
	}
}
