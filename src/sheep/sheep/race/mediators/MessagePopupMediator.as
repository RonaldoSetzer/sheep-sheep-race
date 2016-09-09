/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import sheep.sheep.race.views.MessagePopup;

	import starling.events.Event;

	public class MessagePopupMediator extends StarlingMediator
	{
		override public function initialize():void
		{
			eventMap.mapListener( MessagePopup( viewComponent ).okButton, Event.TRIGGERED, onOkHandler );
		}

		private function onOkHandler():void
		{
			MessagePopup( viewComponent ).destroy();
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
