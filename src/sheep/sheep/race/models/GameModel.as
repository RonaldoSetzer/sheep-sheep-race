/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.models
{
	public class GameModel
	{
		private var _sheepModels:Vector.<SheepModel>;
		private var _racePositions:Vector.<SheepModel>;

		public var yourBetToFirstPosition:String;
		public var yourBetToLastPosition:String;

		public var yourBetResult:Array;

		public function GameModel()
		{
			clear();
		}

		public function clear():void
		{
			_sheepModels = new Vector.<SheepModel>();
			_racePositions = new Vector.<SheepModel>();

			var total:uint = SheepIds.SHEEPS_IDS_ORDER.length;
			for( var i:int = 0; i < total; ++i)
			{
				_sheepModels.push( new SheepModel( SheepIds.SHEEPS_IDS_ORDER[i] ) )
			}

			yourBetToFirstPosition = "";
			yourBetToLastPosition = "";
			yourBetResult = [];
		}

		public function get sheepModels():Vector.<SheepModel>
		{
			return _sheepModels;
		}

		public function addRacePosition( sheep:SheepModel ):void
		{
			if (_racePositions.indexOf(sheep)==-1)
			{
				_racePositions.push(sheep);
			}
		}

		public function isTheRaceFinished():Boolean
		{
			return _racePositions.length == _sheepModels.length;
		}

		public function get racePositions():Vector.<SheepModel>
		{
			return _racePositions;
		}
	}
}
