/**
 * Created by Ronaldo on 07/09/16.
 */
package sheep.sheep.race.setup
{
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.api.IFlowManager;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;

	import sheep.sheep.race.assets.Assets;
	import sheep.sheep.race.commands.EndRaceCommand;

	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.events.RaceEvent;
	import sheep.sheep.race.managers.GameManager;
	import sheep.sheep.race.mediators.GameViewMediator;
	import sheep.sheep.race.mediators.HomeViewMediator;
	import sheep.sheep.race.mediators.IntroViewMediator;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.views.GameView;
	import sheep.sheep.race.views.HomeView;
	import sheep.sheep.race.views.IntroView;

	import starling.events.EventDispatcher;

	public class GameConfig implements IConfig
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var context:IContext;

		[Inject]
		public var flowManager:IFlowManager;

		[Inject]
		public var commandMap:IEventCommandMap;

		public function configure():void
		{
			context.afterInitializing( init );
		}

		private function init():void
		{
			Assets.init();

			mapModels();
			mapManagers();
			mapMediators();
			mapFlowManager();
			mapCommands();

			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_INTRO_VIEW ) );
		}

		private function mapCommands():void
		{
			commandMap.map( RaceEvent.END, RaceEvent ).toCommand( EndRaceCommand );
		}

		private function mapModels():void
		{
			context.injector.map( GameModel ).asSingleton();
		}

		private function mapManagers():void
		{
			context.injector.map( GameManager ).asSingleton();
		}

		private function mapMediators():void
		{
			mediatorMap.map( IntroView ).toMediator( IntroViewMediator );
			mediatorMap.map( HomeView ).toMediator( HomeViewMediator );
			mediatorMap.map( GameView ).toMediator( GameViewMediator );
		}

		private function mapFlowManager():void
		{
			flowManager.mapSetView( FlowEvent.SHOW_INTRO_VIEW, IntroView );
			flowManager.mapSetView( FlowEvent.SHOW_HOME_VIEW, HomeView );
			flowManager.mapSetView( FlowEvent.SHOW_GAME_VIEW, GameView );
		}
	}
}
