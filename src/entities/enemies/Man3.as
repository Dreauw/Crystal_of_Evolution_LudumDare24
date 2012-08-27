package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Man3 extends EnemyBase {
		private var sprite : Spritemap;
		public function Man3(x:Number, y:Number, flipped:Boolean = false) {
			super(x, y, flipped);
			sprite = new Spritemap(Resource.MAN_3, 17, 18);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			sprite.flipped = flipped;
			graphic = sprite;
			setHitbox(17, 18);
			gold = life = 5;
			speed = 20;
		}
	}

}