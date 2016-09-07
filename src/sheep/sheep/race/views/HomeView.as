/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;

	import starling.display.Sprite;

	public class HomeView extends Sprite
	{
		private var _startButton:Button;

		public function HomeView()
		{
			addChild( StarlingFactory.getBackground() );
			addChild( StarlingFactory.getTitle( "SHEEP SHEEP RACE") );

			_startButton = StarlingFactory.getButton( "START" );
			_startButton.alignPivot();
			_startButton.x = ViewPort.HALF_WIDTH;
			_startButton.y = ViewPort.MAX_HEIGHT*.7;
			addChild( _startButton );
		}

		public function get startButton():Button
		{
			return _startButton;
		}
	}
}
