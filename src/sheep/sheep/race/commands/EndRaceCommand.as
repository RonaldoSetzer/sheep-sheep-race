/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.commands
{
	import robotlegs.bender.bundles.mvcs.Command;

	import sheep.sheep.race.models.GameModel;

	public class EndRaceCommand extends Command
	{
		[Inject]
		public var gameModel:GameModel;

		override public function execute():void
		{

		}
	}
}
