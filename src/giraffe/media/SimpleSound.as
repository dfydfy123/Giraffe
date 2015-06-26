package giraffe.media
{
    import flash.events.Event;
	import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;
	
	/**
     * ...
     * @author Ding Ding
     */
    public class SimpleSound
    {
        private var _snd:Sound;
        private var _channel:SoundChannel;
        private var _isLoop:Boolean;
        private var _position:Number;
        
        public function SimpleSound() 
        {
            _snd = new Sound();
        }
        
        public function load(url:String):void
        {
            _snd.load(new URLRequest(url));
        }
        
        public function play(startTime:Number = 0, isLoop:Boolean = false):void
        {
            _channel = _snd.play(startTime);
            _channel.addEventListener(
                Event.SOUND_COMPLETE, onSoundComplete);
            _isLoop = isLoop;
        }
        
        private function onSoundComplete(e:Event):void 
        {
            _channel.removeEventListener(
                Event.SOUND_COMPLETE, onSoundComplete);
            if (_isLoop)
            {
                play(0, _isLoop);
            }
        }
        
        public function pause():void
        {
            if (!_channel) return;
            _position = _channel.position;
            _channel.stop();
        }
        
        public function resume():void
        {
            play(_position, _isLoop);
        }
        
        public function stop():void
        {
            if (!_channel) return;
            
            _position = 0;
            _channel.stop();
            _channel.removeEventListener(
                Event.SOUND_COMPLETE, onSoundComplete);
        }
        
    }

}