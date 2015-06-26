package giraffe.display 
{
	import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
	
	/**
     * ...
     * @author Ding Ding
     */
    public class Scene extends Sprite 
    {
        private var _assets:*;
        
        private var _states:Object;
        private var _currentState:Object;
        
        public function Scene() 
        {
            _states = { };
        }
        
        /**
         * 场景进入
         */
        public function enter():void
        {
            
        }
        
        /**
         * 场景离开
         */
        public function leave():void
        {
            
        }
        
        /**
         * 场景暂停
         */
        public function pause():void
        {
            
        }
        
        /**
         * 场景恢复
         */
        public function resume():void
        {
            
        }
        
        public function onSceneKey(e:KeyboardEvent):void
        {
            if (e.keyCode == Keyboard.BACK ||
                e.keyCode == Keyboard.ESCAPE)
                e.preventDefault();
                
            if (_currentState != null && _currentState.onKey != null)
                _currentState.onKey(e);
        }
        
        /**
         * 添加状态
         * @param state 状态，格式为 { name:String, enter:Function, leave:Function, onKey:Function }
         */
        public function addState(state:Object):void
        {
            _states[state.name] = state;
        }
        
        /**
         * 场景状态转换
         * @param name 场景状态
         */
        public function gotoState(name:String):void
        {
            var state:Object;
            
            state = _states[name];
            
            if (state == null) return;
            
            if (_currentState)
                _currentState.leave();
            
            state.enter();
            _currentState = state;
        }
        
        /**
         * 获取当前状态
         */
        public function get currentState():Object 
        {
            return _currentState;
        }
        
    }

}