package;


import openfl.display.Sprite;
import openfl.geom.Matrix;
import openfl.geom.Point;


class Figure extends Sprite {
    public function new(color:Int) {
        super();

        graphics.beginFill(color);
        graphics.drawRect(0, 0, 200, 200);
        graphics.endFill();
        this.transform.matrix = new Matrix(1, 0, 0, 1, -100, -100);
    }

    public function get_center():Point {
        return new Point(this.x + 50, this.y + 50);
    }

    public function get_distnace(p:Point) {
        return Point.distance(get_center(), p);
    }
}