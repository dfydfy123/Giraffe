package giraffe.core 
{
    import flash.display.Sprite;
    import flash.display.Stage;
    import giraffe.utils.Stats;
	/**
     * ...
     * @author Ding Ding
     */
    public class Giraffe 
    {
        public static const VERSION:String = "0.0.1";
        
        private var _stats:Stats;
        private var _base:Sprite;
        private var _over:Sprite;
        
        public function Giraffe(cls:Class, stage:Stage) 
        {
            _base = new Sprite();
            _over = new Sprite();
            stage.addChild(_base);
            stage.addChild(_over);
            
            Director.getInstance().setContainer(_base);
            
            new cls();
        }
        
        public function set showStats(value:Boolean):void
        {
            if (value)
            {
                if (_stats == null)
                {
                    _stats = new Stats();
                    _over.addChild(_stats);
                }
            }
            else
            {
                if (_stats != null)
                {
                    _over.removeChild(_stats);
                    _stats = null;
                }
            }
        }
        
    }

}