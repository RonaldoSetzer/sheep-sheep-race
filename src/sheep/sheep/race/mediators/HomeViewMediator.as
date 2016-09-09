/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.info.AssetsInfo;
	import sheep.sheep.race.services.FlowService;
	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.managers.SoundManager;
	import sheep.sheep.race.views.HomeView;

	import starling.events.Event;

	public class HomeViewMediator extends StarlingMediator
	{
		[Inject]
		public var soundManager:SoundManager;

		[Inject]
		public var flowService:FlowService;

		private var _view:HomeView;

		override public function initialize():void
		{
			_view = HomeView( viewComponent );
			_view.playAnimationsIn();
			soundManager.playMusic( AssetsInfo.MUSIC_OVERWORLD );

			eventMap.mapListener( _view.startButton, Event.TRIGGERED, onStartHandler )
			eventMap.mapListener( _view, FlowEvent.ANIMATION_OUT_COMPLETE, onAnimationOutHandler )
		}

		private function onAnimationOutHandler( e:Event ):void
		{
			flowService.setGameView();
		}

		private function onStartHandler( e:Event ):void
		{
			_view.playAnimationsOut();
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
