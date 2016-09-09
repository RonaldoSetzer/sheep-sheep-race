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

		public var _view:BetPopup;

		override public function initialize():void
		{
			_view = BetPopup( viewComponent );
			eventMap.mapListener( _view.startButton, Event.TRIGGERED, onStartHandler );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}

		private function onStartHandler( e:Event ):void
		{
			gameModel.yourBetToFirstPosition = _view.sheepSelectorFirstPosition.selectedSheepId;
			gameModel.yourBetToLastPosition = _view.sheepSelectorLastPosition.selectedSheepId;

			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_STARTING_POPUP ) );

			_view.destroy();
		}
	}
}
