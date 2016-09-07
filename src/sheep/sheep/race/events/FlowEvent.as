/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.events
{
	import starling.events.Event;

	public class FlowEvent extends Event
	{
		public static const SHOW_INTRO_VIEW:String = "showIntroView";

		public function FlowEvent( type:String, bubbles:Boolean = false, data:Object = null )
		{
			super( type, bubbles, data );
		}
	}
}
