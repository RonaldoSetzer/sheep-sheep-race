/**
 * Created by Ronaldo on 09/09/16.
 */
package sheep.sheep.race.services
{
	import sheep.sheep.race.events.FlowEvent;

	import starling.events.EventDispatcher;

	public class FlowService
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;

		public function setHomeView():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_HOME_VIEW ) );
		}

		public function setGameView():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_GAME_VIEW ) );
		}

		public function addBetPopup():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_BET_POPUP ) );
		}

		public function addStartingPopup():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_STARTING_POPUP ) );
		}

		public function addBetMessagePopup():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_BET_MESSAGE_POPUP ) );
		}
	}
}
