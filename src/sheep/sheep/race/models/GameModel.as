/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.models
{
	public class GameModel
	{
		private var _sheepModels:Vector.<SheepModel>;
		private var _racePosition:Vector.<SheepModel>;

		public var betFirstPosition:String;
		public var betLastPosition:String;

		public function GameModel()
		{
			clear();
		}

		public function clear():void
		{
			_sheepModels = new Vector.<SheepModel>();
			_racePosition = new Vector.<SheepModel>();

			var total:uint = SheepIds.SHEEPS_IDS_ORDER.length;
			for( var i:int = 0; i < total; ++i)
			{
				_sheepModels.push( new SheepModel( SheepIds.SHEEPS_IDS_ORDER[i] ) )
			}

			betFirstPosition = "";
			betLastPosition = "";
		}

		public function get sheepModels():Vector.<SheepModel>
		{
			return _sheepModels;
		}

		public function addRacePosition( sheep:SheepModel ):void
		{
			if (_racePosition.indexOf(sheep)==-1)
			{
				_racePosition.push(sheep);
			}
		}

		public function isEnd():Boolean
		{
			return _racePosition.length == _sheepModels.length;
		}

		public function isBetFirstPositionRight():Boolean
		{
			return (_racePosition[0].id == betFirstPosition);
		}

		public function isBetLastPositionRight():Boolean
		{
			return (_racePosition[_racePosition.length-1].id == betLastPosition);
		}
	}
}
