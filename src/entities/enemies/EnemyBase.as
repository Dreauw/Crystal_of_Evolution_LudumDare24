package entities.enemies {
	import entities.EntityBase;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import utils.Particle;
	import net.flashpunk.FP;
	import worlds.WorldGame;
	import utils.Audio;

	public class EnemyBase extends EntityBase {
		protected var speed:uint = 20;
		public var life:Number = 2
		protected var timer:Number = 0;
		protected var speedChange:Number = 0;
		protected var poison:Number = 0;
		protected var gold:uint = 2;
		protected var flip_left:Boolean = true;
		public function EnemyBase(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y);
			gravity = 600;
			acceleration.y = gravity;
			type = "enemy"
			layer = 1;
			flip_left = flipped;
			Audio.registerSound("destroy", "0,,0.023,,0.2662,0.4509,,-0.5275,,,,,,0.0959,,,,,1,,,,,0.5", true);
		}
		
		override public function update():void {
			if (timer > 0) {
				timer -= FP.elapsed;
				if (timer <= 0) {
					timer = 0;
					(graphic as Image).color = 0xFFFFFF;
					if (speedChange != 0) {
						maxVelocity.x -= speedChange;
						maxVelocity.y -= speedChange;
						speedChange = 0;
					} else if (poison > 0) {
						poison = 0;
						hit(poison);
					}
				}
			}
			if (flip_left) {
				moveLeft(speed); 
				if (collide("solid", x - speed-5, y)) jump(200);
			} else {
				moveRight(speed);
				if (collide("solid", x + speed-5, y)) jump(200);
			}
			
			super.update();
		}
		
		public function destroy(byCrystal:Boolean = false):void {
			Audio.playSound("destroy");
			var img:Image = (graphic as Image);
			var xx:Number = x;
			var yy:Number = y;
			if (img) {
				xx += img.width / 2;
				yy += img.height / 2;
			}
			Particle.emit("blood", xx, yy, 20);
			if (!byCrystal) {
				(world as WorldGame).or += gold;
			}
			(world as WorldGame).mobCounter += 1;
			(world as WorldGame).updateHud();
			world.remove(this);
		}
		
		public function hit(power:uint):void {
			life -= power;
			var img:Image = (graphic as Image);
			var xx:Number = x;
			var yy:Number = y;
			if (img) {
				xx += img.width / 2;
				yy += img.height / 2;
			}
			(life <= 0) ? destroy() : Particle.emit("blood", xx, yy, 5);
		}
		
		public function speedBoost(duration:Number, boost:Number):void {
			if (maxVelocity.x + speedChange + boost <= 0) {
				maxVelocity.x = 10; return;
			}
			if (maxVelocity.y + speedChange + boost <= 0) {
				maxVelocity.y = 10;return;
			}
			timer = duration;
			speedChange += boost;
			maxVelocity.x += speedChange;
			maxVelocity.y += speedChange;
			(graphic as Image).color = 0x0000FF;
		}
		
		public function setPoison(duration:Number, power:Number):void {
			timer = duration;
			poison = power;
			(graphic as Image).color = 0x00FF00;
		}
		
	}

}