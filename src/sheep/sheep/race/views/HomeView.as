/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.info.AssetsInfo;
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.TextInfo;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.Image;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class HomeView extends Sprite
	{
		private var _startButton:Button;

		public function HomeView()
		{
			addChild( StarlingFactory.getBackground() );

			var logo:Image = StarlingFactory.getImage( AssetsInfo.SHEEP_LOGO );
			logo.alignPivot();
			logo.x = ViewPort.HALF_WIDTH;
			logo.y = ViewPort.MAX_HEIGHT*.2;
			addChild( logo );

			var title:TextField = StarlingFactory.getTextField( 300, TextInfo.GAME_TITLE );
			title.alignPivot();
			title.hAlign = "center";
			title.x = ViewPort.HALF_WIDTH;
			title.y = ViewPort.MAX_HEIGHT*.45;
			addChild( title );

			_startButton = StarlingFactory.getButton( "START" );
			_startButton.alignPivot();
			_startButton.x = ViewPort.HALF_WIDTH;
			_startButton.y = ViewPort.MAX_HEIGHT*.9;
			addChild( _startButton );
		}

		public function get startButton():Button
		{
			return _startButton;
		}
	}
}
