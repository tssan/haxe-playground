package;


import openfl.display.Sprite;
import openfl.events.Event;


class Main extends Sprite {
	private var g:Float = 0.1;
	private var vx:Float = 2;
	private var vy:Float = 0;
	private var ball:Ball;
	
	public function new () {
		super ();
		init();
	}

	private function init():Void {
		ball = new Ball();
		ball.x = 20;
		ball.y = 20;
		addChild(ball);

		graphics.beginFill(0x332222);
		graphics.drawRect(0, 370, 800, 230);
		graphics.endFill();

		addEventListener(Event.ENTER_FRAME, on_each_timestep);
	}

	private function on_each_timestep(event:Event):Void {
		vy += g;

		ball.x += vx;
		ball.y += vy;
		if (ball.y > 350) {
			vy *= -0.8;
		}
	}
}
