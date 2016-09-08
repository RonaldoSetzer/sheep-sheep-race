/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.info.AssetsInfo;
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;

	public class HomeView extends Sprite
	{
		public function HomeView()
		{
			addChild( StarlingFactory.getBackground() );

			addChild( StarlingFactory.getImage( "background_game" ) );

			var logo:Image = StarlingFactory.getImage( AssetsInfo.SHEEP_LOGO );
			logo.alignPivot();
			logo.x = ViewPort.HALF_WIDTH;
			logo.y = ViewPort.MAX_HEIGHT * .3;
			addChild( logo );

			_startButton = StarlingFactory.getButton( "START" );
			_startButton.alignPivot();
			_startButton.x = ViewPort.HALF_WIDTH;
			_startButton.y = ViewPort.MAX_HEIGHT * .9;
			addChild( _startButton );
		}

		private var _startButton:Button;

		public function get startButton():Button
		{
			return _startButton;
		}
	}
}
