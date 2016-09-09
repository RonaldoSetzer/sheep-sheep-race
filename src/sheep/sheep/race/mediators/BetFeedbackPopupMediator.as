/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import flash.events.IEventDispatcher;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.events.RaceEvent;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.views.BetFeedbackPopup;

	import starling.events.Event;

	public class BetFeedbackPopupMediator extends StarlingMediator
	{
		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var dispatcher:IEventDispatcher;

		private var betFeedbackPopup:BetFeedbackPopup;

		override public function initialize():void
		{
			betFeedbackPopup = BetFeedbackPopup( viewComponent );

			betFeedbackPopup.createPodiumByModel( gameModel );
			eventMap.mapListener( betFeedbackPopup.retryButton, Event.TRIGGERED, onRetryHandler )
			eventMap.mapListener( betFeedbackPopup.homeButton, Event.TRIGGERED, onHomeHandler )
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
			betFeedbackPopup.destroy();
			dispatcher.dispatchEvent( new RaceEvent( RaceEvent.RETRY ) );
		}
	}
}
