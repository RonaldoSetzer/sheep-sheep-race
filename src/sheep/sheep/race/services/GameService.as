/**
 * Created by Ronaldo on 09/09/16.
 */
package sheep.sheep.race.services
{
	import flash.events.IEventDispatcher;

	import sheep.sheep.race.events.GameEvent;

	public class GameService
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;

		public function retry():void
		{
			eventDispatcher.dispatchEvent( new GameEvent( GameEvent.RETRY ) );
		}

		public function start():void
		{
			eventDispatcher.dispatchEvent( new GameEvent( GameEvent.START ) );
		}

		public function finish():void
		{
			eventDispatcher.dispatchEvent( new GameEvent( GameEvent.FINISH ) );
		}

		public function update():void
		{
			eventDispatcher.dispatchEvent( new GameEvent( GameEvent.UPDATE ) );
		}
	}
}
