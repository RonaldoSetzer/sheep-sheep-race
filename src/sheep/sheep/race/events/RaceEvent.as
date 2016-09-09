/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.events
{
	import flash.events.Event;

	public class RaceEvent extends Event
	{
		public static const START:String = "start";
		public static const FINISH:String = "finish";
		public static const RETRY:String = "retry";
		public static const UPDATE:String = "update";

		public function RaceEvent( type:String )
		{
			super( type, false, false );
		}
	}
}
