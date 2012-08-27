package entities.enemies {
	import entities.towers.TowerBase;
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	import net.flashpunk.FP;
	

	public class Man6 extends EnemyBase {
		private var sprite : Spritemap;
		private var ttimer : Number;
		public function Man6(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.MAN_6, 15, 34);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(15, 34);
			gold = life = 45;
			speed = 20;
			maxVelocity.x = 50;
			ttimer = Math.round(Math.random() * 10);
		}
		
		override public function update():void {
			ttimer -= FP.elapsed;
			if (ttimer <= 0) {
				var tower:TowerBase = world.nearestToEntity("tower", this) as TowerBase;
				if (tower && Math.abs(tower.x - x) < 5 && Math.abs(tower.y - y) < 20) {
					world.remove(tower);
				}
				destroy(true);
			}
			super.update();
		}
	}

}