/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.utils.setTimeout;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.services.FlowService;
	import sheep.sheep.race.views.IntroView;

	public class IntroViewMediator extends StarlingMediator
	{
		[Inject]
		public var flowService:FlowService;

		override public function initialize():void
		{
			IntroView( viewComponent ).playAnimation();
			setTimeout( handlerTimerOut, 3000 );
		}

		private function handlerTimerOut():void
		{
			flowService.setHomeView();
		}
	}
}
