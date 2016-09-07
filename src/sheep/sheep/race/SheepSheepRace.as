package sheep.sheep.race
{

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;

	import robotlegs.bender.bundles.palidor.PalidorBundle;
	import robotlegs.bender.extensions.contextView.ContextView;

	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	import sheep.sheep.race.setup.GameConfig;
	import sheep.sheep.race.setup.StarlingView;

	import starling.core.Starling;

	[SWF(width="640", height="480", frameRate="60", backgroundColor="#002143")]
	public class SheepSheepRace extends Sprite
	{
		public function SheepSheepRace()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			stage.color = 0xFFFFFF;

			addEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			var starling:Starling = new Starling( StarlingView, stage, new Rectangle( 0, 0, stage.stageWidth, stage.stageHeight) );
			starling.nativeStage.frameRate = 60;
			starling.start();

			const robotlegsContext:IContext = new Context()
					.install( PalidorBundle )
					.configure( GameConfig, new ContextView( this ), starling );

		}
	}
}
