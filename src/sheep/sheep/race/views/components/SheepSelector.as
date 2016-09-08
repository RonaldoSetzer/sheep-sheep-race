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
	import starling.display.Sprite;
	import starling.events.Event;

	public class SheepSelector extends Sprite
	{
		public function SheepSelector()
		{
			_ids = [ SheepIds.SHEEP_01 , SheepIds.SHEEP_02 , SheepIds.SHEEP_03 , SheepIds.SHEEP_04 ];
			_selectedSheepId = _ids[0];

			_image = StarlingFactory.getImage( convertIdToAssetsPrefix( _selectedSheepId ) );
			_image.x = 45;
			addChild( _image );

			var backButton:Button = StarlingFactory.getButton( "BACK" );
			backButton.x = 10;
			backButton.y = 80;
			addChild( backButton );

			var nextButton:Button = StarlingFactory.getButton( "NEXT" );
			nextButton.x = 60;
			nextButton.y = 80;
			addChild( nextButton );

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

		private function onNextHandler( e:Event ):void
		{
			_ids.push( _ids.shift() );
			_selectedSheepId = _ids[0];
			updateImage( convertIdToAssetsPrefix( _selectedSheepId ) )
		}

		private function onBackHandler( e:Event ):void
		{
			_ids.unshift( _ids.pop() );
			_selectedSheepId = _ids[0];
			updateImage( convertIdToAssetsPrefix( _selectedSheepId ) )
		}
	}
}