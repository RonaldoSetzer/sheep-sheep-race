/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.events
{
	import sheep.sheep.race.models.SheepModel;

	import starling.events.Event;

	public class RaceEvent extends Event
	{
		public static const START:String = "start";

		public static const END:String = "end";

		public function RaceEvent( type:String )
		{
			super( type, false, null );
		}
	}
}
