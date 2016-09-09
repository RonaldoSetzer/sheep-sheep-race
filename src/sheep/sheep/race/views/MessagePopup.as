/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views
{
	import sheep.sheep.race.info.ColorInfo;
	import sheep.sheep.race.utils.StarlingFactory;
	import sheep.sheep.race.info.TextInfo;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class MessagePopup extends Sprite
	{
		private var _okButton:Button;

		public function MessagePopup()
		{
			addChild( StarlingFactory.getShadowBackground() );

			var background:Quad = StarlingFactory.getBackground( ColorInfo.BACKGROUND_POPUP_1, ColorInfo.BACKGROUND_POPUP_2 );
			background.width = ViewPort.HALF_WIDTH;
			background.height = ViewPort.MAX_HEIGHT * .7;
			background.alignPivot();
			ViewPort.alignCenter( background );
			addChild( background );

			var titleBackground:Quad = StarlingFactory.getQuad( 300, 30, ColorInfo.BACKGROUND_POPUP_2 );
			titleBackground.alignPivot();
			titleBackground.width = ViewPort.MAX_WIDTH * .45;
			titleBackground.x = ViewPort.HALF_WIDTH;
			titleBackground.y = 100;
			addChild( titleBackground );

			var title:TextField = StarlingFactory.getTitle( TextInfo.TITLE_ALERT );
			title.y = 102;
			addChild( title );

			var msg:TextField = StarlingFactory.getTextField( 250, TextInfo.BET_MISTAKE, TextInfo.SIZE_DEFAULT, 4 );
			msg.alignPivot();
			msg.x = ViewPort.HALF_WIDTH;
			msg.y = ViewPort.MAX_HEIGHT * .4;
			addChild( msg );

			_okButton = StarlingFactory.getButton( "OK" );
			_okButton.alignPivot();
			_okButton.x = ViewPort.HALF_WIDTH;
			_okButton.y = ViewPort.MAX_HEIGHT * .76;
			addChild( _okButton )
		}

		public function get okButton():Button
		{
			return _okButton;
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}
