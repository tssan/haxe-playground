package;


import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.geom.Point;


class Main extends Sprite {
	private var card:Card;
	
	public function new () {		
		super();
		init();
	}

	private function init():Void {
		card = new Card('jug.jpg');
		card.x = stage.stageWidth / 2 - card.width / 2;
		card.y = stage.stageHeight / 2 - card.height / 2;
		addChild(card);

		card.addEventListener(MouseEvent.MOUSE_DOWN, on_mouse_down);
		card.addEventListener(MouseEvent.MOUSE_UP, on_mouse_up);
	}

	private function on_mouse_down(event:MouseEvent):Void {
		stage.addEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		card.startDrag();
	}

	private function on_mouse_up(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		card.stopDrag();
	}

	private function on_mouse_move(event:MouseEvent):Void {
		trace(card.x, card.y);
		trace(event.stageX, event.stageY);
		card.tilt();
	}
}
