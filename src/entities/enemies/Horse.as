package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Horse extends EnemyBase {
		private var sprite : Spritemap;
		public function Horse(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.HORSE_2, 35, 28);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(35, 28);
			gold = life = 25;
			speed = 10;
			maxVelocity.x = 40;
		}
	}

}