/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.utils
{
	public class ViewPort
	{
		public static const MAX_WIDTH:int = 640;
		public static const MAX_HEIGHT:int = 480;
		public static const HALF_WIDTH:int = 320;
		public static const HALF_HEIGHT:int = 240;

		public static function alignCenter( object:Object ):void
		{
			object.x = HALF_WIDTH;
			object.y = HALF_HEIGHT;
		}
	}
}
