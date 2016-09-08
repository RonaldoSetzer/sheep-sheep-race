/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.views.components
{
	import sheep.sheep.race.StarlingFactory;
	import sheep.sheep.race.assets.Assets;
	import sheep.sheep.race.models.SheepIds;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;

	public class SheepSelector extends Sprite
	{
		public function SheepSelector()
		{
			_ids = [ SheepIds.SHEEP_01 , SheepIds.SHEEP_02 , SheepIds.SHEEP_03 , SheepIds.SHEEP_04 ];
			_selectedSheepId = _ids[0];

			var background:Quad = StarlingFactory.getQuad( 86, 72, 0x000000 );
			background.alignPivot();
			addChild( background);

			var background2:Quad = StarlingFactory.getQuad( 82, 68, 0xFFFFFF );
			background2.alignPivot();
			addChild( background2);

			_image = StarlingFactory.getImage( convertIdToAssetsPrefix( _selectedSheepId ) );
			_image.alignPivot();
			addChild( _image );

			var backButton:Button = StarlingFactory.getButtonArrow( -1 );
			backButton.x = -22;
			backButton.y = 60;
			addChild( backButton );

			var nextButton:Button = StarlingFactory.getButtonArrow();
			nextButton.x = 22;
			nextButton.y = 60;
			addChild( nextButton );

			alignPivot();
			nextButton.addEventListener( Event.TRIGGERED, onNextHandler );
			backButton.addEventListener( Event.TRIGGERED, onBackHandler );
		}

		private var _ids:Array;
		private var _image:Image;

		private var _selectedSheepId:String;

		public function get selectedSheepId():String
		{
			return _selectedSheepId;
		}

		private function updateImage( assetPrefix:String ):void
		{
			_image.texture = Assets.getTexture( assetPrefix );
			_image.readjustSize();
		}

		private function convertIdToAssetsPrefix( id:String ):String
		{
			return id + "01";
		}

		public function next():void
		{
			_ids.push( _ids.shift() );
			_selectedSheepId = _ids[0];
			updateImage( convertIdToAssetsPrefix( _selectedSheepId ) )
		}

		public function back():void
		{
			_ids.unshift( _ids.pop() );
			_selectedSheepId = _ids[0];
			updateImage( convertIdToAssetsPrefix( _selectedSheepId ) )
		}

		private function onNextHandler( e:Event ):void
		{
			next();
		}

		private function onBackHandler( e:Event ):void
		{
			back();
		}

	}
}