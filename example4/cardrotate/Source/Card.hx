package;


import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.geom.Matrix;


class Card extends Sprite {
    private var _card_name:String;
    public var card:Bitmap;
    
    public function new(card_name:String){
        super();
        _card_name = card_name;
        init();
    }

    private function init():Void {
        var m:Matrix;
        card = new Bitmap(Assets.getBitmapData(
            "assets/" + _card_name));
        m = new Matrix(1, 0, 0, 1,
                -(card.width / 2),
                -(card.height / 2));
        card.transform.matrix = m;
        addChild(card);
    }
}
