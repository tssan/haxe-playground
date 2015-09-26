package;


import openfl.display.Sprite;
import openfl.events.MouseEvent;


class Main extends Sprite {
	private var slot:Figure;
	private var figure:Figure;
	private var drag_offset_x:Float;
	private var drag_offset_y:Float;

	public function new () {
		super ();
		init();
	}	

	private function init():Void {
		slot = new Figure(0xff6666);
		slot.x = 10;
		slot.y = 10;
		addChild(slot);

		figure = new Figure(0x55aa55);
		figure.x = stage.stageWidth - figure.width - 10;
		figure.y = stage.stageHeight - figure.height - 10;
		addChild(figure);

		stage.addEventListener(MouseEvent.MOUSE_DOWN, on_mouse_down);
	}

	private function on_mouse_down(event:MouseEvent):Void {
		stage.addEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		stage.addEventListener(MouseEvent.MOUSE_UP, on_mouse_up);

		drag_offset_x = figure.x - event.stageX;
		drag_offset_y = figure.y - event.stageY;
	}

	private function on_mouse_up(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_MOVE, on_mouse_move);
		stage.removeEventListener(MouseEvent.MOUSE_UP, on_mouse_up);

		if(figure.get_distnace(slot.get_center()) <= 100){
			snap_figure_to_slot(slot);
		}
	}

	private function on_mouse_move(event:MouseEvent):Void {
		figure.x = event.stageX + drag_offset_x;
		figure.y = event.stageY + drag_offset_y;
	}

	private function snap_figure_to_slot(slot:Figure):Void {
		figure.x = slot.x;
		figure.y = slot.y;
	}
}