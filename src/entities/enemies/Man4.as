package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Man4 extends EnemyBase {
		private var sprite : Spritemap;
		public function Man4(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.MAN_4, 13, 18);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(13, 18);
			gold = life = 10;
			speed = 20;
			maxVelocity.x = 50;
		}
	}

}