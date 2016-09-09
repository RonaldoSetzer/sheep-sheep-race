/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import sheep.sheep.race.info.AssetsInfo;
	import sheep.sheep.race.utils.StarlingFactory;
	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.utils.ViewPort;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;

	public class HomeView extends Sprite
	{
		private var _logo:Image;
		private var _startButton:Button;

		public function HomeView()
		{
			addChild( StarlingFactory.getBackground() );

			addChild( StarlingFactory.getImage( "background_game" ) );

			_logo = StarlingFactory.getImage( AssetsInfo.SHEEP_LOGO );
			_logo.alignPivot();
			_logo.x = ViewPort.HALF_WIDTH;
			_logo.y = ViewPort.MAX_HEIGHT * .3;
			_logo.alpha = 0;
			addChild( _logo );

			_startButton = StarlingFactory.getButton( "START" );
			_startButton.alignPivot();
			_startButton.x = ViewPort.HALF_WIDTH;
			_startButton.y = ViewPort.MAX_HEIGHT * .9 + ViewPort.HALF_HEIGHT;
			addChild( _startButton );
		}

		public function playAnimationsIn():void
		{
			TweenNano.to( _logo, .4, { alpha:1 } );
			TweenNano.to( _startButton, .2, { delay:.05, y:ViewPort.MAX_HEIGHT * .9, ease:Quart.easeInOut} );
		}

		public function playAnimationsOut():void
		{
			TweenNano.to( _logo, .4, { alpha:0, onComplete: animationOutComplete } );
			TweenNano.to( _startButton, .2, { delay:.05, y:ViewPort.MAX_HEIGHT * .9+ ViewPort.HALF_HEIGHT, ease:Quart.easeInOut} );
		}

		private function animationOutComplete():void
		{
			var event:FlowEvent = new FlowEvent( FlowEvent.ANIMATION_OUT_COMPLETE );
			dispatchEvent( event )
		}
		public function get startButton():Button
		{
			return _startButton;
		}
	}
}
