package;


import openfl.Assets;
import openfl.Vector;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.geom.Matrix;
import openfl.geom.Point;


class Card extends Sprite {
    private var _card_file_name:String;
    private var bitmap_data:BitmapData;
    public var card:Bitmap;
    
    public function new(card_file_name:String){
        super();
        _card_file_name = card_file_name;
        init();
    }

    private function init():Void {
        var m:Matrix;
        bitmap_data = Assets.getBitmapData(
            "assets/" + _card_file_name);
        card = new Bitmap(bitmap_data);
        m = new Matrix(1, 0, 0, 1,
                -(card.width / 2),
                -(card.height / 2));
        card.transform.matrix = m;
        addChild(card);
        graphics.beginFill(0x550000);
        graphics.drawCircle(20, 20, 20);
        graphics.endFill();
    }

    private function get_intersection(p1:Point, p2:Point, p3:Point, p4:Point): Point {
        var a1:Float = p2.y - p1.y;
        var b1:Float = p1.x - p2.x;
        var a2:Float = p4.y - p3.y;
        var b2:Float = p3.x - p4.x;
     
        var denom:Float = a1 * b2 - a2 * b1;
        if (denom == 0) return null;

        var c1:Float = p2.x * p1.y - p1.x * p2.y;
        var c2:Float = p4.x * p3.y - p3.x * p4.y;

        var p:Point = new Point((b1 * c2 - b2 * c1)/denom, (a2 * c1 - a1 * c2)/denom);
     
        if (Point.distance(p, p2) > Point.distance(p1, p2)) return null;
        if (Point.distance(p, p1) > Point.distance(p1, p2)) return null;
        if (Point.distance(p, p4) > Point.distance(p3, p4)) return null;
        if (Point.distance(p, p3) > Point.distance(p3, p4)) return null;
        
        return p;
    }

    public function tilt():Void {
        var plt:Point = new Point(x - card.width / 2, y - card.height / 2);
        var prt:Point = new Point(x + card.width / 2 - 20, y - card.height / 2 - 20);
        var plb:Point = new Point(x - card.width / 2, y + card.height / 2);
        var prb:Point = new Point(x + card.width / 2 - 20, y + card.height / 2 - 20);
        trace(plt, prt, plb, prb);
        var intersection:Point = get_intersection(plt, prb, prt, plb);
        trace(intersection);
        var ll1:Float = Point.distance(plt, intersection);
        var ll2:Float = Point.distance(intersection, prb);
        var lr1:Float = Point.distance(prt, intersection);
        var lr2:Float = Point.distance(intersection, plb);

        var ratio:Float = (ll1 + ll2) / (lr1 + lr2);

        graphics.clear();
        graphics.beginBitmapFill(bitmap_data, null, false, true);

        var v1:Vector<Float> = [plt.x, plt.y, prb.x, prb.y, prt.x, prt.y, plb.x, plb.y];
        var v2:Vector<Int> = [0,1,2, 1,3,2];
        var v3:Vector<Float> = [0, 0, (1 / ll2) * ratio, 1, 0, (1 / lr2), 0, 1, (1 / lr1), 1, 1, (1 / ll1) * ratio];
        graphics.drawTriangles(v1, v2, v3);
        //graphics.endFill();
    }
}
