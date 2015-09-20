package;


import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;


class Main extends Sprite {
	private var g:Float = 0.1;
	private var vx:Float = 2;
	private var vy:Float = 0;
	private var balls:Array<Ball>;
	
	public function new () {
		super ();
		init();
	}

	private function init():Void {
		balls = new Array();
		draw_floor();

		stage.addEventListener(MouseEvent.CLICK, on_mouse_click);
		stage.addEventListener(Event.ENTER_FRAME, on_each_timestep);
	}

	private function draw_floor() {
		graphics.beginFill(0x332222);
		graphics.drawRect(0, 370, 800, 230);
		graphics.endFill();
	}

	private function on_each_timestep(event:Event):Void {
		for(ball in balls) {
			ball.vy += g;
			ball.x += ball.vx;
			ball.y += ball.vy;
			if (ball.y > 350) {
				ball.vy *= -0.8;
			}
		}
	}

	private function on_mouse_click(event:MouseEvent):Void {
		var ball = new Ball();
		ball.vx = vx;
		ball.vy = 0;
		ball.x = event.stageX;
		ball.y = event.stageY;
		balls.push(ball);
		addChild(ball);
	}
}