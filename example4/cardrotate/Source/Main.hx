package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;


class Main extends Sprite {
	private var card:Card;

	public function new () {
		super();
		init();
	}

	private function init():Void {
		card = new Card('jug.jpg');
		card.x = stage.stageWidth / 2;
		card.y = stage.stageHeight / 2;
		addChild(card);

		stage.addEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
	}

	private function on_mouse_move(event:MouseEvent):Void {
		var dx:Float = event.stageX - card.x;
		var dy:Float = event.stageY - card.y;
		var radians:Float = Math.atan2(dy, dx);
		var angle:Float = radians * 180 / Math.PI;
		card.rotation = angle;
	}
}
