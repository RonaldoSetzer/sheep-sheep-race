/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.commands
{
	import flash.events.IEventDispatcher;

	import robotlegs.bender.bundles.mvcs.Command;

	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.events.RaceEvent;
	import sheep.sheep.race.managers.GameManager;

	import starling.events.EventDispatcher;

	public class RetryRaceCommand extends Command
	{
		[Inject]
		public var gameManager:GameManager;

		[Inject]
		public var dispatcher:IEventDispatcher;

		[Inject]
		public var eventDispatcher:EventDispatcher;

		override public function execute():void
		{
			gameManager.start();

			dispatcher.dispatchEvent( new RaceEvent( RaceEvent.UPDATE ) );
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_BET_POPUP ) );
		}
	}
}
