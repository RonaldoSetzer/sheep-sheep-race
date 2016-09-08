/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.commands
{
	import robotlegs.bender.bundles.mvcs.Command;

	import sheep.sheep.race.managers.GameManager;

	public class EndRaceCommand extends Command
	{
		[Inject]
		public var gameManager:GameManager;

		override public function execute():void
		{
		}
	}
}
