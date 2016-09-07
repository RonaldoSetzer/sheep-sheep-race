/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.StarlingFactory;

	import starling.display.Sprite;

	public class GameView extends Sprite
	{
		public function GameView()
		{
			addChild( StarlingFactory.getBackground() );
			addChild( StarlingFactory.getTitle( "GAME") );
		}
	}
}
