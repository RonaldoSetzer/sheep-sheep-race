/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.commands
{
	import robotlegs.bender.bundles.mvcs.Command;

	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.models.GameModel;

	import starling.events.EventDispatcher;

	public class FinishRaceCommand extends Command
	{
		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var eventDispatcher:EventDispatcher;

		override public function execute():void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_BET_FEEDBACK_POPUP ) )
		}
	}
}
