package entities {
	import entities.enemies.EnemyBase;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import utils.Resource;
	import net.flashpunk.FP;
	import worlds.WorldGame;
	import utils.Particle;
	import worlds.WorldTitle;
	
	public class Crystal extends Entity {
		private var animY:Number;
		private var startY:Number;
		private var up:Boolean;
		private var timer:Number;
		public function Crystal(x:Number, y:Number) {
			graphic = new Image(Resource.CRYSTAL);
			setHitbox((graphic as Image).width, (graphic as Image).height);
			animY = 0;
			startY = y - 21;
			layer = 1;
			type = "crystal";
			super(x, startY);
		}
		
		override public function update():void {
			if (timer > 0) {
				timer -= FP.elapsed;
				if (timer <= 0) {
					if (!visible) {
						world.remove(this);
						FP.world = new WorldTitle;
						return;
					}
					visible = false;
					Particle.emit("crystal", x + (graphic as Image).width / 2, y + (graphic as Image).height / 2, 20);
					timer = 1.4;
				}
			}
			if (!up) {
				animY += 0.15;
				if (animY >= 5) {
					//Particle.emit("crystal", x+(graphic as Image).width/2, y+(graphic as Image).height/2, 5);
					up = true
				}
			} else {
				animY -= 0.15;
				if (animY <= 0) {
					//Particle.emit("crystal", x+(graphic as Image).width/2, y+(graphic as Image).height/2, 5);
					up = false;
				}
			}
			y = startY + animY;
			var enemy:EnemyBase = collide("enemy", x, y) as EnemyBase;
			if (enemy) {
				(world as WorldGame).loseLife(1);
				enemy.destroy(true);
			}
			super.update();
		}
		
		public function destroy():void {
			timer = 2;
		}
		
	}
}