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
	import sheep.sheep.race.commands.FinishGameCommand;
	import sheep.sheep.race.commands.RetryGameCommand;
	import sheep.sheep.race.events.FlowEvent;
	import sheep.sheep.race.events.GameEvent;
	import sheep.sheep.race.managers.GameManager;
	import sheep.sheep.race.managers.SoundManager;
	import sheep.sheep.race.mediators.BetFeedbackPopupMediator;
	import sheep.sheep.race.mediators.BetPopupMediator;
	import sheep.sheep.race.mediators.GameViewMediator;
	import sheep.sheep.race.mediators.HomeViewMediator;
	import sheep.sheep.race.mediators.IntroViewMediator;
	import sheep.sheep.race.mediators.MessagePopupMediator;
	import sheep.sheep.race.mediators.StartingPopupMediator;
	import sheep.sheep.race.models.GameModel;
	import sheep.sheep.race.services.FlowService;
	import sheep.sheep.race.services.GameService;
	import sheep.sheep.race.views.BetFeedbackPopup;
	import sheep.sheep.race.views.BetPopup;
	import sheep.sheep.race.views.GameView;
	import sheep.sheep.race.views.HomeView;
	import sheep.sheep.race.views.IntroView;
	import sheep.sheep.race.views.MessagePopup;
	import sheep.sheep.race.views.StartingPopup;

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
			mapServices();
			mapMediators();
			mapFlowManager();
			mapCommands();

			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_INTRO_VIEW ) );
		}

		private function mapCommands():void
		{
			commandMap.map( GameEvent.FINISH, GameEvent ).toCommand( FinishGameCommand );
			commandMap.map( GameEvent.RETRY, GameEvent ).toCommand( RetryGameCommand );
		}

		private function mapModels():void
		{
			context.injector.map( GameModel ).asSingleton();
		}

		private function mapManagers():void
		{
			context.injector.map( GameManager ).asSingleton();
			context.injector.map( SoundManager ).asSingleton();
		}

		private function mapServices():void
		{
			context.injector.map( FlowService ).asSingleton();
			context.injector.map( GameService ).asSingleton();
		}

		private function mapMediators():void
		{
			mediatorMap.map( IntroView ).toMediator( IntroViewMediator );
			mediatorMap.map( HomeView ).toMediator( HomeViewMediator );
			mediatorMap.map( GameView ).toMediator( GameViewMediator );
			mediatorMap.map( BetPopup ).toMediator( BetPopupMediator );
			mediatorMap.map( BetFeedbackPopup ).toMediator( BetFeedbackPopupMediator );
			mediatorMap.map( StartingPopup ).toMediator( StartingPopupMediator );
			mediatorMap.map( MessagePopup ).toMediator( MessagePopupMediator );
		}

		private function mapFlowManager():void
		{
			flowManager.mapSetView( FlowEvent.SHOW_INTRO_VIEW, IntroView );
			flowManager.mapSetView( FlowEvent.SHOW_HOME_VIEW, HomeView );
			flowManager.mapSetView( FlowEvent.SHOW_GAME_VIEW, GameView );
			flowManager.mapAddView( FlowEvent.SHOW_BET_POPUP, BetPopup );
			flowManager.mapAddView( FlowEvent.SHOW_BET_FEEDBACK_POPUP, BetFeedbackPopup );
			flowManager.mapAddView( FlowEvent.SHOW_STARTING_POPUP, StartingPopup );
			flowManager.mapAddView( FlowEvent.SHOW_BET_MESSAGE_POPUP, MessagePopup );
		}
	}
}
