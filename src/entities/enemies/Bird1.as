package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Bird1 extends EnemyBase {
		private var sprite : Spritemap;
		public function Bird1(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.BIRD_1, 21, 28);
			sprite.add("fly", [0, 1], 5, true);
			sprite.play("fly");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(21, 48);
			gold = life = 15;
			maxVelocity.x = 50;
			speed = 20;
		}
	}

}