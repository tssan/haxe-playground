package;


import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;


class Card extends Sprite {
    private var _card_name:String;
    public var card:Bitmap;
    
    public function new(card_name:String){
        super();
        _card_name = card_name;
        init();
    }

    private function init():Void {
        card = new Bitmap(Assets.getBitmapData(
            "assets/" + _card_name));
        addChild(card);
    }
}
