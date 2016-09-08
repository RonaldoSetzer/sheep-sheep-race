/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.StarlingFactory;

	import starling.display.Sprite;

	public class StartingPopup extends Sprite
	{
		public function StartingPopup()
		{
			addChild( StarlingFactory.getShadowBackground());
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}
