package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Man5 extends EnemyBase {
		private var sprite : Spritemap;
		public function Man5(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.MAN_5, 15, 31);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(15, 31);
			gold = life = 35;
			speed = 20;
			maxVelocity.x = 30;
		}
	}

}