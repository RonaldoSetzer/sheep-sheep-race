/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.events.FlowEvent;

	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.views.BetPopup;

	import starling.events.Event;

	public class BetPopupMediator extends StarlingMediator
	{
		[Inject]
		public var gameModel:GameModel;

		public var betPopup:BetPopup;

		override public function initialize():void
		{
			betPopup = BetPopup( viewComponent );
			eventMap.mapListener( betPopup.startButton, Event.TRIGGERED, onStartHandler );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}

		private function onStartHandler( e:Event ):void
		{
			gameModel.betFirstPosition = betPopup.sheepSelectorWinner.selectedSheepId;
			gameModel.betLastPosition = betPopup.sheepSelectorLoser.selectedSheepId;

			trace( "YOUR BET IS -> Winner: ", gameModel.betFirstPosition, " Loser: ", gameModel.betLastPosition );

			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_STARTING_POPUP ) );

			betPopup.destroy();
		}
	}
}
