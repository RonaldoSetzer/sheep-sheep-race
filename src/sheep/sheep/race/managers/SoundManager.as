/**
 * Created by Ronaldo on 08/09/16.
 */
package sheep.sheep.race.managers
{
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;

	import sheep.sheep.race.info.AssetsInfo;
	import sheep.sheep.race.assets.Embeds;

	public class SoundManager
	{
		private var _listSfx:Dictionary;
		private var _listMusic:Dictionary;

		private var _currentMusicChanel:SoundChannel;
		private var _currentMusicSound:Sound;
		private var _currentMusicName:String;

		public function SoundManager()
		{
			var overWorldMusic:Sound = new Embeds.MusicOverWorld();
			var sfxYouLose:Sound = new Embeds.SfxYouLose();
			var sfxYouWin:Sound = new Embeds.SfxYouWin();

			sfxYouLose.play( 0, 0, new SoundTransform( 0 ) );
			sfxYouWin.play( 0, 0, new SoundTransform( 0 ) );
			overWorldMusic.play( 0, 0, new SoundTransform( 0 ) );

			_listSfx = new Dictionary();
			_listSfx[AssetsInfo.SFX_YOU_LOSE] = sfxYouLose;
			_listSfx[AssetsInfo.SFX_YOU_WIN] = sfxYouWin;

			_listMusic = new Dictionary();
			_listMusic[AssetsInfo.MUSIC_OVERWORLD] = overWorldMusic;
		}

		public function playSfx( sfxName:String ):void
		{

			var currentSfxSound:Sound = _listSfx[sfxName];
			var time:Number = 0;
			var volumeAdjust:SoundTransform = new SoundTransform();
			volumeAdjust.volume = .2;
			var currentSfxChannel:SoundChannel = currentSfxSound.play( time, 0, volumeAdjust );

		}

		public function playMusic( musicName:String ):void
		{
			if ( _currentMusicChanel ) stopMusic( _currentMusicChanel );

			var volumeAdjust:SoundTransform = new SoundTransform();
			volumeAdjust.volume = .1;
			_currentMusicName = musicName;
			_currentMusicSound = _listMusic[_currentMusicName];
			_currentMusicChanel = _currentMusicSound.play( 0, 0, volumeAdjust );
			_currentMusicChanel.addEventListener( Event.SOUND_COMPLETE, onSoundCompleteHandler );
		}

		public function stopMusic( soundChanel:SoundChannel ):void
		{
			soundChanel.removeEventListener( Event.SOUND_COMPLETE, onSoundCompleteHandler );
			soundChanel.stop();
			soundChanel = null;
			_currentMusicChanel = null;
		}

		private function onSoundCompleteHandler( e:Event ):void
		{
			stopMusic( _currentMusicChanel );
			playMusic( _currentMusicName );
		}

	}
}
