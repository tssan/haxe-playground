package;


import openfl.display.Sprite;


class Ball extends Sprite {
    private var _radius:Float;
    private var _color:UInt;

    public function new(radius:Float=20, color:UInt=0xaa4444) {
        super();
        _radius = radius;
        _color = color;
        init();
    }

    private function init():Void {
        var sprite:Sprite = new Sprite();

        graphics.beginFill(_color);
        graphics.drawCircle(0, 0, _radius);
        graphics.endFill();
    }
}