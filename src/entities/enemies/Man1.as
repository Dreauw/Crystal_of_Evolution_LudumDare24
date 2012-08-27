package entities.enemies {
	import net.flashpunk.graphics.Spritemap;
	import utils.Resource;
	

	public class Man1 extends EnemyBase {
		private var sprite : Spritemap;
		public function Man1(x:Number, y:Number) {
			super(x, y);
			sprite = new Spritemap(Resource.MAN_1, 10, 14);
			sprite.add("run", [0, 1, 0, 2], 5, true);
			sprite.play("run");
			graphic = sprite;
			setHitbox(10, 14);
			speed = 20;
		}
	}

}