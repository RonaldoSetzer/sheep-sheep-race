/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.commands
{
	import robotlegs.bender.bundles.mvcs.Command;

	import sheep.sheep.race.managers.GameManager;
	import sheep.sheep.race.services.FlowService;
	import sheep.sheep.race.services.GameService;

	public class RetryGameCommand extends Command
	{
		[Inject]
		public var gameManager:GameManager;

		[Inject]
		public var gameService:GameService;

		[Inject]
		public var flowService:FlowService;

		override public function execute():void
		{
			gameManager.start();

			gameService.update();
			flowService.addBetPopup()
		}
	}
}
