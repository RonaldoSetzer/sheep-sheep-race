/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.models
{
	public class SheepModel
	{
		private var _id:String;

		private var _distance:int;

		public function SheepModel( id:String )
		{
			_id = id;
			resetDistance();
		}

		public function get id():String
		{
			return _id;
		}

		public function resetDistance():void
		{
			_distance = 0;
		}

		public function increaseDistance( value:Number ):int
		{
			_distance+=value;
			return _distance
		}

		public function get distance():int
		{
			return _distance;
		}
	}
}
