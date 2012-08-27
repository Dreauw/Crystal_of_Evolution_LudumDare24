package entities.enemies {
	import entities.towers.TowerBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	import net.flashpunk.FP;
	

	public class Tank extends EnemyBase {
		private var sprite : Image;
		public function Tank(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Image(Resource.TANK);
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(39, 26);
			gold = life = 200;
			speed = 20;
			maxVelocity.x = 70;
		}
	}

}