package giraffe.core 
{
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    import giraffe.display.Scene;
	/**
     * ...
     * @author Ding Ding
     */
    public class Director 
    {
        private static var _instance:Director;
        
        private var _base:Sprite;
        private var _scenes:Object;
        private var _currentScene:Scene;
        
        public function Director() 
        {
            _scenes = { };
        }
        
        /**
         * 注册场景
         * @param name 场景名
         * @param cls 场景类
         */
        public function registerScene(name:String, cls:Class):void
        {
            _scenes[name] = cls;
        }
        
        /**
         * 替换场景
         * @param name 场景名
         */
        public function replaceScene(name:String):void
        {
            var cls:Class;
            
            cls = _scenes[name];
            
            if (cls == null) return;
            
            if (_currentScene)
            {
                _currentScene.leave();
                addOrRemoveListeners(false);
                _base.removeChild(_currentScene);
                _currentScene = null;
            }
            
            _currentScene = new cls() as Scene;
            _base.addChild(_currentScene);
            _currentScene.enter();
            addOrRemoveListeners(true);
        }
        
        private function addOrRemoveListeners(enable:Boolean):void
        {
            var func:String;
            
            if (enable) func = "addEventListener";
            else func = "removeEventListener";
            
            _base.stage[func](KeyboardEvent.KEY_DOWN, _currentScene.onSceneKey);
            _base.stage[func](KeyboardEvent.KEY_UP, _currentScene.onSceneKey);
        }
        
        /**
         * 获得Director单例
         * @return Director单例
         */
        public static function getInstance():Director
        {
            if (_instance == null)
                _instance = new Director();
            return _instance;
        }
        
        /**
         * 设置基础容器
         * @param base 容器
         */
        public function setContainer(base:Sprite):void 
        {
            _base = base;
        }
        
        /**
         * 获取当前场景
         */
        public function get currentScene():Scene 
        {
            return _currentScene;
        }
        
    }

}