package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;


class Main extends Sprite {
	private var card:Card;
	private var drag_offset_x:Float;
	private var drag_offset_y:Float;
	private var reset_card_w:Float;
	private var reset_card_h:Float;

	public function new () {
		super ();
		init();
	}

	private function init():Void {
		card = new Card('jug.jpg');
		reset_card_w = card.width;
		reset_card_h = card.height;
		card.x = stage.stageWidth / 2 - card.width / 2;
		card.y = stage.stageHeight / 2 - card.height / 2;
		addChild(card);

		card.addEventListener(MouseEvent.MOUSE_DOWN, on_mouse_down);
	}

	private function on_mouse_down(event:MouseEvent):Void {
		stage.addEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		stage.addEventListener(MouseEvent.MOUSE_UP, on_mouse_up);

		drag_offset_x = card.x - event.stageX;
		drag_offset_y = card.y - event.stageY;
	}

	private function on_mouse_up(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		stage.removeEventListener(MouseEvent.MOUSE_UP, on_mouse_up);
	}

	private function on_mouse_move(event:MouseEvent):Void {
		card.x = event.stageX + drag_offset_x;
		card.y = event.stageY + drag_offset_y;
	}
}