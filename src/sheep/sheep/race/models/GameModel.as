/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.models
{
	import flash.utils.Dictionary;

	public class GameModel
	{
		private var _sheepModels:Vector.<SheepModel>;

		public var bestEnd:String;
		public var worstEnd:String;

		public function GameModel()
		{
			clear();
		}

		public function clear():void
		{
			_sheepModels = new Vector.<SheepModel>();
			var total:uint = SheepIds.SHEEPS_IDS_ORDER.length;
			for( var i:int = 0; i < total; ++i)
			{
				_sheepModels.push( new SheepModel( SheepIds.SHEEPS_IDS_ORDER[i] ) )
			}
			bestEnd = "";
			worstEnd = "";
		}

		public function get sheepModels():Vector.<SheepModel>
		{
			return _sheepModels;
		}
	}
}
